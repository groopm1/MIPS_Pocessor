library ieee;
use ieee.std_logic_1164.all;

entity ULA_Control is
port(i_FUNCT : in std_logic_vector(5 downto 0);
	  i_CONTROL : in std_logic_vector(1 downto 0);
	  o_S : out std_logic_vector(3 downto 0));
end entity;

architecture arch of ULA_Control is
begin

	process(i_CONTROL, i_FUNCT)
	begin
		if(i_CONTROL = "00") then
			o_S <= "0010";
		elsif(i_CONTROL = "01") then
			o_S <= "0110";
		elsif(i_CONTROL = "10") then
			if(i_FUNCT = "100000") then
				o_S <= "0010";
			elsif(i_FUNCT = "100010") then
				o_S <= "0110";
			elsif(i_FUNCT = "100100") then
				o_S <= "0000";
			elsif(i_FUNCT = "100101") then
				o_S <= "0001";
			elsif(i_FUNCT = "101010") then
				o_S <= "0111";
			else 
				o_S <= "0111";
			end if;
		else
			if(i_FUNCT = "100000") then
				o_S <= "0010";
			elsif(i_FUNCT = "100010") then
				o_S <= "0110";
			elsif(i_FUNCT = "100100") then
				o_S <= "0000";
			elsif(i_FUNCT = "100101") then
				o_S <= "0001";
			elsif(i_FUNCT = "101010") then
				o_S <= "0111";
			else 
				o_S <= "0111";
			end if;
		end if;
	end process;
end arch;