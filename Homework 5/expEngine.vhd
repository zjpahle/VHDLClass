library IEEE;
use IEEE.std_logic_1164.all;

entity expEng is
  	port    (

		);
end expEng;
architecture behavior of expEng is

	component array_multiplier 
  	generic (bitn : integer);
  	port    (
		x, y : in  std_logic_vector(bitn-1 downto 0);
		z    : out std_logic_vector(bitn-1 downto 0)
		);

	begin
	--component => signal--
	mult1 : array_multiplier
	generic map (bitn => 16)
	port map(
		x => xin,
		
		);
----Begin Behavior Logic--
	--Combinational--


	--Sequential--
	process

	begin
	if(rising_edge(clk)) then

	end process;
end behavior;