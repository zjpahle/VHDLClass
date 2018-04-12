library IEEE;
use IEEE.std_logic_1164.all;

entity expEng is
  	port    (
		go		: in  std_logic;
		xin, yin	: in  std_logic_vector(15 downto 0);
		zout		: out std_logic_vector(15 downto 0)
		);
end expEng;
architecture behavior of expEng is

	component array_multiplier 
  	generic (bitn : integer);
  	port    (
		x, y : in  std_logic_vector(bitn-1 downto 0);
		z    : out std_logic_vector(bitn-1 downto 0)
		);
	end component array_multiplier;

	component counter_generic 
  	generic (bitn : integer);
	 port   (
		input, clk : in std_logic; 
		count : inout std_logic_vector (bitn-1 downto 0)
		);
	end component counter_generic;

	begin
	--component => signal--
	mult1 : array_multiplier
	generic map (bitn => 16)
	port map(
		x => xin,
		y => yin,
		z => zout
		);

	counter2bit : counter_generic
	generic map (bitn => 2)
	port map(

		);

	counter4bit : counter_generic
	generic map (bitn => 4)
	port map(

		);

----Begin Behavior Logic--
	--Combinational--
	--Sequential--
	process
	
	begin
		if(rising_edge(go)) then

		else
			zout <= '0';
		end if
	end process;
end behavior;

--	e = 1; a = 1;
--	for(i = 1; i < n; i++)
--		{a = a*x*(1/i);
--		e = e + a;}