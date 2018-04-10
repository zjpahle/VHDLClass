library ieee;
use ieee.std_logic_1164.all;

entity ones_sum_tb is
end ones_sum_tb;

architecture test of ones_sum_tb is
  signal data   : std_logic_vector (7 downto 0);
  signal ones 	: std_logic_vector (3 downto 0);

component ones_sum is
port 	(
	A	: in  std_logic_vector (7 downto 0);
	ones	: out std_logic_vector (3 downto 0));
end component ones_sum;
 
begin
	ones_sum1 : ones_sum
	port map (
		A	=> data,
		ones	=> ones
		);

	process is
	begin
		data <= "00000000";
		wait for 10 ns;
		data <= "01001000";
		wait for 10 ns;
		data <= "01011100";
		wait for 10 ns;
		data <= "11111111";
		wait for 10 ns;    
	end process;
end architecture test;