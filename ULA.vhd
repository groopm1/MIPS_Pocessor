library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
port (i_I0 : in std_logic_vector(31 downto 0);
		i_I1 : in std_logic_vector(31 downto 0);
		i_SEL : in std_logic_vector(3 downto 0);
		i_CLK : in std_logic;
		i_ENABLE : in std_logic;
		o_ZERO : out std_logic;
		o_S : out std_logic_vector(31 downto 0));
end ULA;

architecture arch of ULA is

	signal r_R : std_logic_vector(31 downto 0);

	begin
		
		process(i_I0, i_I1, i_SEL, i_ENABLE, i_CLK)
		begin
			if(i_ENABLE = '1') then
				if(rising_edge(i_CLK)) then
					if(i_SEL = "0000") then
						r_R <= i_I0 and i_I1;
					
					elsif(i_SEL = "0001") then
						r_R <= i_I0 or i_I1;
						
					elsif(i_SEL = "0010") then
						r_R <= std_logic_vector(unsigned(i_I0) + unsigned(i_I1));
						
					elsif(i_SEL = "0110") then
						r_R <= std_logic_vector(unsigned(i_I0) - unsigned(i_I1));
						
					elsif(i_SEL = "0111") then
						if(i_I0 < i_I1) then
							r_R <= "00000000000000000000000000000001";
						else
							r_R <= "00000000000000000000000000000000";
						end if;
						
					elsif(i_SEL = "1100") then
						r_R <= i_I0 nor i_I1;
						
					else
						r_R <= r_R;
					end if;
				end if;
			else
				r_R <= "00000000000000000000000000000000";
			end if;
		end process;
		
		process(r_R)
		begin
			if(r_R = "00000000000000000000000000000000") then
				o_ZERO <= '1';
			else
				o_ZERO <= '0';
			end if;
		end process;
			
		o_S <= r_R;
end arch;