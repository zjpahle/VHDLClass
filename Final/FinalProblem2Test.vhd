library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity bth_test is
end bth_test;

architecture test of bth_test is
--Constants Declarations--
	constant clk_period : time := 10 ns;

--Signals Declarations--
	signal SAR, DAR, TCR, dataOut, dataIn, address		: std_logic_vector (7 downto 0):= "00000000";
	signal clk, busy, go, memReady, readMem, writeMem	: std_logic := '0';

--Component Instantiation--
	component bth is
		port	(
		  	go, clk, memReady 	: in  std_logic;
			SAR, DAR, TCR, dataIn	: in  std_logic_vector (7 downto 0);
			busy, readMem, writeMem	: out std_logic;
			dataOut,address		: out std_logic_vector (7 downto 0)
			);
	end component bth;

	--component => signal--
	begin 
	bth1 : bth
	port map(
	  	go => go,
		clk => clk,
		memReady => memReady,
		SAR => SAR,
		DAR => DAR,
		TCR => TCR,
		dataIn => dataIn,
		busy => busy,
		readMem => readMem,
		writeMem => writeMem,
		dataOut => dataOut,
		address => address
		);

--Begin Testing--
	clk <= NOT clk after clk_period/2;
	process begin
		SAR <= "00001111";
		DAR <= "11110000";
		TCR <= "00000101";
		go <= '1';
		wait on clk;
		go <= '0';
	end process;
end architecture test;
