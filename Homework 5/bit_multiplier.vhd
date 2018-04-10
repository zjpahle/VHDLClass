library IEEE;
use IEEE.std_logic_1164.all;

entity bit_multiplier is
port   (
	xi, yi, pi, ci : in std_logic; 
	xo, yo, po, co : out std_logic
	);
end bit_multiplier;

architecture logical of bit_multiplier is
	signal xy : std_logic;
	begin
	xy <= xi and yi;
	co <= (pi and xy) or (pi and ci) or (xy and ci);
	po <= pi xor xy xor ci;
	xo <= xi;
	yo <= yi;
end logical;