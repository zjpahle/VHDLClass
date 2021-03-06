library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.fixed_pkg.all;
use IEEE.float_pkg.all;

entity expEngineTest is
end expEngineTest;

architecture test of expEngineTest is
--Constants Declarations--
	constant clk_period : time := 1 ns;

--Signals Declarations--
  	signal clk, start	: std_logic := '0';
	signal x		: ufixed(15 downto 0);
	signal resultFracPart	: ufixed(15 downto 0);
	signal resultIntPart	: std_logic_vector(1  downto 0);
	signal busy		: std_logic;

	--Test Signals--
	----------------

--Component Instantiation--
	component expEngine is
  	port    (
		start, clk	: in  std_logic;
		xin		: in  ufixed(15 downto 0);
		resultFracPart	: out ufixed(15 downto 0);
		resultIntPart	: out std_logic_vector(1  downto 0);
		busy		: out std_logic
		);
	end component expEngine;

	--component => signal--
	begin 
	expEngine1 : expEngine
	port map(
		start => start,
		clk => clk,
		xin => x,
		resultFracPart => resultFracPart,
		resultIntPart => resultIntPart,
		busy => busy

		--Test Ports--
		--------------
		);

--Begin Testing--
	clk <= NOT clk after clk_period/2;
	process begin
	x <= to_ufixed(0.5, x);
	start <= '1';
	wait for clk_period;
	start <= '0';
	wait until (busy = '0');
	x <= to_ufixed(0.2, x);
	start <= '1';
	wait for clk_period;
	start <= '0';
	wait until (busy = '0');
	x <= to_ufixed(0.1, x);
	start <= '1';
	wait for clk_period;
	start <= '0';
	wait until (busy = '0');
	
	end process;

end architecture test;