library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity counter_generic is
generic (bitn : integer);
port   (
	input, clk : in std_logic; 
	count : inout std_logic_vector (bitn-1 downto 0)
	);
end counter_generic;

architecture behavioral of counter_generic is
begin
process(clk) begin
	if(rising_edge(clk)) then
		if (count >= count'high) then
			count <= std_logic_vector(to_unsigned(0,count'length));
	        elsif (input = '1') then
	        	count <= std_logic_vector(to_unsigned(1,count'length));
	        end if;
	end if;
end process;
end behavioral;