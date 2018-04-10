library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter8bit_test is
end counter8bit_test;

architecture test of counter8bit_test is
--Constants Declarations--
	constant clk_period : time := 1 ns;

--Signals Declarations--
	signal rst   : std_logic;
	signal clk 	  : std_logic := '0';
	signal countOut	  : std_logic_vector (7 downto 0);

--Component Instantiation--
	component counter8bit is
	port	(
		rst, clk    	: in std_logic;
		countOut	: out std_logic_vector (7 downto 0)
		);
	end component counter8bit;

	--component => signal--
	begin 
	counter8bit1 : counter8bit
	port map(
		rst		=> rst,
		clk		=> clk,
		countOut	=> countOut
		);

--Begin Testing--
	clk <= NOT clk after 1 ns;
	process begin

		rst <= '1';
		wait for 1 ns;
		rst <= '0';

		wait for 10 ns;
		wait for 2 ns;
		wait for 1 ns;
	end process;
end architecture test;
