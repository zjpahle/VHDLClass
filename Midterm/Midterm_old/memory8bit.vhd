library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity memory8bit is
port	(
	addr 	: in  std_logic_vector (7 downto 0);
	dataout : out std_logic_vector (7 downto 0)
	);
end memory8bit;

architecture behavioral of memory8bit is
	type mem is array (natural range <>, natural range <>) of std_logic;
	constant memsize : integer := 2**addr'length;
begin


	process
		variable memory : mem (0 TO memsize-1, dataout'RANGE) :=  (others =>"00000000");
		begin
	-- insert memory value for test bench to find--
		memory(4,7) := '0';
		memory(4,6) := '0';
		memory(4,5) := '0';
		memory(4,4) := '0';
		memory(4,3) := '1';
		memory(4,2) := '0';
		memory(4,1) := '1';
		memory(4,0) := '0';
	-----------------------------------------------
		for i in dataout'range loop
			dataout(i) <= memory(conv_integer(addr),i);
		end loop;
		wait on addr;
	end process;
end behavioral;