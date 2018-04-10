library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity comp8bit_test is
end comp8bit_test;

architecture test of comp8bit_test is
  signal dataA   : std_logic_vector (7 downto 0);
  signal dataB   : std_logic_vector (7 downto 0);
  signal dOut 	 : std_logic;

component comp8bit is
	port 	( 
		dataA : in  std_logic_vector (7 downto 0);
		dataB : in  std_logic_vector (7 downto 0);
		dOut  : out std_logic
		);
end component comp8bit;

signal clk : std_logic := '0';
constant clk_period : time := 1 ns;

begin comp8bit1 : comp8bit
port map(
	dataA	=> dataA,
	dataB	=> dataB,
	dOut	=> dOut
	);

	process is
	begin
		dataA <= "00000000";
		dataB <= "00000000";
		wait for clk_period;
		dataA <= "10000000";
		dataB <= "11000000";
		wait for clk_period;
		dataA <= "00000001";
		dataB <= "00000001";
		wait for clk_period;
		dataA <= "11000000";
		dataB <= "11100000";
		wait for clk_period;
		dataA <= "00000011";
		dataB <= "00000011";
		wait for clk_period;
		dataA <= "10000011";
		dataB <= "10000011";
		wait for clk_period;

	end process;
end architecture test;