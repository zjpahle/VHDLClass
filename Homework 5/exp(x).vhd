library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

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
signal data	: std_logic_vector(15 downto 0);
signal addr	: std_logic_vector(3  downto 0);
begin
	--high level description for address table--
process(clk) begin
	if(rising_edge(clk)) then
		case addr is
			when "0001" =>	data <= std_logic_vector(to_unsigned(1,data'length))/std_logic_vector(to_unsigned(1,data'length));
--			when "0010" =>	data <= to_unsigned(1,data'length)/to_unsigned(2,data'length);
--			when "0011" =>	data <= to_unsigned(1)/to_unsigned(3);
--			when "0100" =>	data <= to_unsigned(1)/to_unsigned(4);
--			when "0101" =>	data <= to_unsigned(1)/to_unsigned(5);
--			when "0110" =>	data <= to_unsigned(1)/to_unsigned(6);
--			when "0111" =>	data <= to_unsigned(1)/to_unsigned(7);
--			when "1000" =>	data <= to_unsigned(1)/to_unsigned(8);
--			when "1001" =>	data <= to_unsigned(1)/to_unsigned(9);
--			when "1010" =>	data <= to_unsigned(1)/to_unsigned(10);
--			when "1011" =>	data <= to_unsigned(1)/to_unsigned(11);
--			when "1100" =>	data <= to_unsigned(1)/to_unsigned(12);
--			when "1101" =>	data <= to_unsigned(1)/to_unsigned(13);
--			when "1110" =>	data <= to_unsigned(1)/to_unsigned(14);
--			when "1111" =>	data <= to_unsigned(1)/to_unsigned(15);
		end case;
	end if;
end main;
