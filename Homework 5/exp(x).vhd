library IEEE;
use IEEE.std_logic_1164.all;

entity exp is
  	port    (
		xin 		: in  std_logic_vector(15 downto 0);
		start 		: in  std_logic;
		resultIntPart 	: out std_logic_vector(1 downto 0);
		resultFracPart 	: out std_logic_vector(15 downto 0);
		busy 		: out std_logic
		);
end exp;

architecture main of exp is


	process(rising_edge(clk)) begin
--	e = 1; a = 1;
--	for(i = 1; i < n; i++)
--		{a = a*x*(1/i);
--		e = e + a;}
end main;
