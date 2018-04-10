library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity zerocounter8bit_test is
end zerocounter8bit_test;

architecture test of zerocounter8bit_test is
--Constants Declarations--
	--clk period from 64 mhz
	constant clk_period : time := 15.6 ns;

--Signals Declarations--
	signal load	: std_logic_vector (7 downto 0):= "00000011";
	signal clk		: std_logic:= '0';
	signal lo, zero_out	: std_logic:= '0';

--Component Instantiation--
	component zerocounter8bit is
	port	(
		load		: in      std_logic_vector (7 downto 0);
		clk		: in      std_logic;
		go		: inout	  std_logic;
		zero	 	: out	  std_logic
		);
	end component zerocounter8bit;

	--component => signal--
	begin 
	zerocounter8bit1 : zerocounter8bit
	port map(
		load	=> load,
		clk	=> clk,
		go	=> lo,
		zero	=> lo
		);

--Begin Testing--
	clk <= NOT clk after clk_period/2;
	lo <= '1';
	process begin
		wait for clk_period;
		if (lo = '1') then
			zero_out <= not zero_out;
		end if;
	end process;

end architecture test;
