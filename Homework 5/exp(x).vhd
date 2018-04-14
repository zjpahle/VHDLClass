library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.fixed_pkg.all;
use IEEE.float_pkg.all;

entity exp is
  	port    (
		xin 		: in  std_logic_vector(15 downto 0);
		start, clk 	: in  std_logic;
		resultIntPart 	: out std_logic_vector(1 downto 0);
		resultFracPart 	: out std_logic_vector(15 downto 0);
		busy 		: out std_logic
		);
end exp;

architecture main of exp is
signal data	: ufixed(15 downto 0);
signal addr	: std_logic_vector(3  downto 0);
signal test	: std_logic_vector(15 downto 0);
begin
--high level description for address table--
process(clk) begin
	if(rising_edge(clk)) then
		case addr is
			when "0001" => data <= to_ufixed(1.00000000000000, data);
			when "0010" => data <= to_ufixed(0.50000000000000, data);
			when "0011" => data <= to_ufixed(0.33333333333333, data);
			when "0100" => data <= to_ufixed(0.25000000000000, data);
			when "0101" => data <= to_ufixed(0.20000000000000, data);
			when "0110" => data <= to_ufixed(0.16666666666667, data);
			when "0111" => data <= to_ufixed(0.14285714285714, data);
			when "1000" => data <= to_ufixed(0.12500000000000, data);
			when "1001" => data <= to_ufixed(0.11111111111111, data);
			when "1010" => data <= to_ufixed(0.10000000000000, data);
			when "1011" => data <= to_ufixed(0.09090909090909, data);
			when "1100" => data <= to_ufixed(0.08333333333333, data);
			when "1101" => data <= to_ufixed(0.07692307692308, data);
			when "1110" => data <= to_ufixed(0.07142857142857, data);
			when "1111" => data <= to_ufixed(0.06666666666667, data);
			when others => data <= "0000000000000000";
		end case;
	end if;
end process;
test <= std_logic_vector(data);
end main;