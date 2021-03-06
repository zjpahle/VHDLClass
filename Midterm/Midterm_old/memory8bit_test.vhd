library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity memory8bit_test is
end memory8bit_test;

architecture test of memory8bit_test is

--Signals Declarations--
	signal addr, dataout	: std_logic_vector (7 downto 0):= "00000000";
	signal clk		: std_logic := '0';

--Component Instantiation--
	component memory8bit is
	port	(
		addr 	: in  std_logic_vector (7 downto 0);
		dataout : out std_logic_vector (7 downto 0)
		);
	end component memory8bit;

	--component => signal--
	begin 
	memory8bit1 : memory8bit
	port map(
		addr => addr,
		dataout => dataout
		);

--Begin Testing--
	clk <= NOT clk after 1 ns;
	process begin
		if(rising_edge(clk)) then
			addr <=  addr + 1;
		end if;
		wait for 1 ns;
	end process;
end architecture test;
