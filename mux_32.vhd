library ieee;
use ieee.std_logic_1164.all;

entity mux_32 is
port (i_I0 : in std_logic_vector(31 downto 0);
		i_I1 : in std_logic_vector(31 downto 0);
		i_SEL : in std_logic;
		o_S : out std_logic_vector(31 downto 0));
end mux_32;

architecture arch of mux_32 is
begin
	
	process(i_I0, i_I1, i_SEL)
	begin
		
		if(i_SEL = '0') then
			o_S <= i_I0;
			
		elsif (i_SEL = '1') then
			o_S <= i_I1;
		
		else
			o_S <= "00000000000000000000000000000000";
		
		end if;
	end process;
end arch;
		