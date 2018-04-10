library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity comp8bit is
port 	( 
	dataA, dataB 	: in  std_logic_vector (7 downto 0);
	dOut 		: out std_logic
	);
end comp8bit;

architecture Behavioral of comp8bit is
	begin
		dOut <= '1' when dataA = dataB else '0';
end behavioral;