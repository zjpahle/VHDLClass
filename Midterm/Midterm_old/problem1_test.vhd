library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity problem1_test is
end problem1_test;

architecture test of problem1_test is
--Signals Declarations--
	signal dataA, dataB	: std_logic_vector (7 downto 0);
	signal rst		: std_logic;
	signal Count		: std_logic_vector (4 downto 0);
	signal clk 		: std_logic := '0';
	
--Component Instantiation--
	component problem1 is
	port 	( 
		A, B 		: in  std_logic_vector (7 downto 0);
		reset, clk	: in std_logic;
		Count		: out std_logic_vector (4 downto 0)
		);
	end component problem1;
	
--component => signal--
	begin problem1_1 : problem1
	port map(
		A	=> dataA,
		B	=> dataB,
		reset	=> rst,
		Count	=> Count,
		clk	=> clk
		);

--Begin Testing--
	clk <= NOT clk after 1 ns;
	process begin
		rst <= '1';
		wait for 2 ns;
		rst <= '0';
		wait for 2 ns;

		--first, test 7 different--
		dataA <= "00000000";
		dataB <= "10000000";
		wait for 10 ns;
	

		--then, test 2 same--
		dataA <= "00000000";
		dataB <= "00000000";
		wait for 4 ns;

	
	end process;
end architecture test;