library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity problem3_test is
end problem3_test;

architecture test of problem3_test is
--Constants Declarations--
	--clk period from 64 mhz--
	constant clk_period : time := 15.6 ns;

--Signals Declarations--
  	signal refClk, inSig, adjust 	: std_logic := '0';
	signal multFactor		: std_logic_vector (2 downto 0);
	signal outSig, valid		: std_logic;

	--Test Signals--
	signal upovf_test, zeroovf_test : std_logic;
	signal multFactorSig		: std_logic_vector (2 downto 0):= "000";
	signal new_freq_test 		: std_logic_vector (7 downto 0):= "00000000";
	signal old_freq_test 		: std_logic_vector (9 downto 0):= "0000000000";
	----------------

--Component Instantiation--
	component problem3 is
	port	(
	  	refClk, inSig, adjust 	: in  std_logic;
		multFactor		: in  std_logic_vector (2 downto 0);
		outSig, valid		: out std_logic;

		--test outputs--
		upovf_test, zeroovf_test : out std_logic;
		multFactorSig		 : out std_logic_vector (2 downto 0);
		new_freq_test 		 : out std_logic_vector (7 downto 0);
		old_freq_test 		 : out std_logic_vector (9 downto 0)
		----------------

		);
	end component problem3;

	--component => signal--
	begin 
	problem3_1 : problem3
	port map(
		refClk 		=> refClk,
		inSig 		=> inSig,
		adjust 		=> adjust,
		multFactor	=> multFactor,
		outSig		=> outSig,
		valid		=> valid,

		--Test Ports--
		upovf_test 	=> upovf_test,
		zeroovf_test 	=> zeroovf_test,
		new_freq_test 	=> new_freq_test,
		old_freq_test 	=> old_freq_test,
		multFactorSig	=> multFactorSig
		--------------

		);

--Begin Testing--
	refClk <= NOT refClk after clk_period/2;
	multFactor <= "001";
	inSig <= NOT inSig after clk_period*64;
	process begin
	wait for 20000*clk_period;
	end process;

end architecture test;
