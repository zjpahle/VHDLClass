library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity problem1_test is
end problem1_test;

architecture test of problem1_test is
--Constants Declarations--
	constant clk_period : time := 1 ns;

--Signals Declarations--
	signal dataA, dataB	: std_logic_vector (7 downto 0);
	signal Count		: std_logic_vector (4 downto 0);
	signal clk,rst 		: std_logic := '0';
	
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
	clk <= NOT clk after clk_period/2;

	process begin
		--first, test 7 different--
		dataA <= "00000000";
		dataB <= "11111111";
		wait for 6*clk_period;
		--then, test 2 same--
		dataA <= "00000000";
		dataB <= "00000000";
		wait for 1*clk_period;
		--then, test 2 same--
		dataA <= "00000000";
		dataB <= "11111111";
		wait for 7*clk_period;
		--then, test 2 same--
		dataA <= "00000000";
		dataB <= "00000000";
		wait for 3*clk_period;

	end process;
end architecture test;