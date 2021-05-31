library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Extensor is
port (i_I : in std_logic_vector(16 downto 0);
		o_S : out std_logic_vector(31 downto 0));
end entity;

architecture arch of Extensor is
begin
	o_S <= std_logic_vector(resize(unsigned(i_I), 32));
end arch;
		