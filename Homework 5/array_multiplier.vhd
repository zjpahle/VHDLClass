library IEEE;
use IEEE.std_logic_1164.all;

entity array_multiplier is
  	generic (bitn : integer);
  	port    (
		x, y 	: in  std_logic_vector(bitn-1 downto 0);
		start	: in  std_logic;
		z    	: out std_logic_vector(bitn-1 downto 0);
		ovf	: out  std_logic
		);
end array_multiplier;

architecture iterative of array_multiplier is
	component bit_multiplier 
	port   (
		xi, yi, pi, ci : in  std_logic;
		xo, yo, po, co : out std_logic
		);
	end component;

	constant n : integer := x'length - 1;
	type pair is array (n+1 downto 0, n+1 downto 0) of std_logic;

	signal xv, yv, cv, pv : pair;
	begin

	rows: for i in x'range
	generate cols: for j in y'range
		generate cell: bit_multiplier
			port map (
				xv(i,j),
				yv(i,j),
				pv(i,j+1),
				cv(i,j),
				xv(i,j+1),
				yv(i+1,j),
				pv(i+1,j),
				cv(i,j+1)
				);
		end generate;
	end generate;

	sides: for i in x'range
		generate
			xv(i, 0) <= x(i);
			cv(i, 0) <= '0';
			pv(0, i+1) <= '0';
			pv(i+1, n+1) <= cv(i, n+1);
			yv(0, i) <= y(i);
			z(i) <= pv(i+1, 0);
			z(i + n+1) <= pv(n+1, i+1);
		end generate;
		ovf <= cv(4,3);
end iterative;