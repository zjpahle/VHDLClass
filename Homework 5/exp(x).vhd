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

begin
--high level description for address table--

test <= std_logic_vector(data);
end main;