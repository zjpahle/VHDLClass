library ieee;
use ieee.std_logic_1164.all;

entity ones_sum_tb is
end ones_sum_tb;

architecture test of ones_sum_tb is
  signal data   : std_logic_vector (7 downto 0);
  signal rst	: std_logic;
  signal ones 	: std_logic_vector (3 downto 0);

component ones_sum is
port	(
	data	: in  std_logic_vector (7 downto 0);
	rst	: in  std_logic;
	ones	: out std_logic_vector (3 downto 0)
	);
end component ones_sum;

signal clk : std_logic := '0';
constant clk_period : time := 1 ns;

begin ones_sum1 : ones_sum
port map(
	data	=> data,
	rst	=> rst,
	ones	=> ones
	);

	process is
	begin
		data <= "00000000";
		wait for clk_period;
		data <= "01001000";
		wait for clk_period;
		data <= "01010100";
		wait for clk_period;
		data <= "11111111";
		wait for clk_period;
		data <= "01010101";
		wait for clk_period;
		data <= "11001011";
		wait for clk_period;
		data <= "00000001";
		wait for clk_period;
		data <= "10111101";
		wait for clk_period;
		rst <= '1';
		wait for clk_period;
		data <= "10111101";
	end process;
end architecture test;