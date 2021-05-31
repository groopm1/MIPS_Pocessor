library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA_tb is
end;

architecture bench of ULA_tb is

  component ULA
      port (
      i_I0 : in std_logic_vector(31 downto 0);
      i_I1 : in std_logic_vector(31 downto 0);
      i_SEL : in std_logic_vector(3 downto 0);
      i_CLK : in std_logic;
      i_ENABLE : in std_logic;
      o_ZERO : out std_logic;
      o_S : out std_logic_vector(31 downto 0)
    );
  end component;

  -- Ports
  signal i_I0 : std_logic_vector(31 downto 0);
  signal i_I1 : std_logic_vector(31 downto 0);
  signal i_SEL : std_logic_vector(3 downto 0);
  signal i_CLK : std_logic;
  signal i_ENABLE : std_logic;
  signal o_ZERO : std_logic;
  signal o_S : std_logic_vector(31 downto 0);

begin

  ULA_inst : ULA
    port map (
      i_I0 => i_I0,
      i_I1 => i_I1,
      i_SEL => i_SEL,
      i_CLK => i_CLK,
      i_ENABLE => i_ENABLE,
      o_ZERO => o_ZERO,
      o_S => o_S
    );

process
begin

    i_ENABLE <= '0';

    i_I0 <= "00000000000000000000000000000000";
    i_I1 <= "00000000000000000000000000000000";
    i_SEL <= "0000";
    i_CLK <= '0';
    wait for 5 ns;
    assert (o_S = "00000000000000000000000000000000") report "erro" severity error;

    i_I0 <= "00000000000000000000000000000000";
    i_I1 <= "00000000000000000000000000000000";
    i_SEL <= "0000";
    i_CLK <= '1';
    wait for 5 ns;

    i_ENABLE <= '1';

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0000";
    i_CLK <= '0';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0000";
    i_CLK <= '1';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0001";
    i_CLK <= '0';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0001";
    i_CLK <= '1';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0010";
    i_CLK <= '0';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0010";
    i_CLK <= '1';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0110";
    i_CLK <= '0';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0110";
    i_CLK <= '1';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0111";
    i_CLK <= '0';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0111";
    i_CLK <= '1';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "1100";
    i_CLK <= '0';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "1100";
    i_CLK <= '1';
    wait for 5 ns;

    i_ENABLE <= '0';
    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0000";
    i_CLK <= '0';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0000";
    i_CLK <= '1';
    wait for 5 ns;

    i_I0 <= "00000000000000000000000000000010";
    i_I1 <= "00000000000000000000000000000001";
    i_SEL <= "0000";
    i_CLK <= '0';
    wait;

end process;

end bench;
