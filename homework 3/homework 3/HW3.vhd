library ieee;
use ieee.std_logic_1164.all;
 
entity HW3 is
  port (
	data		: in std_logic_vector  (7 DOWNTO 0);
	reset, clk	: in std_logic;
	result		: out std_logic_vector (3 DOWNTO 0)
	);
end entity HW3;

architecture BEHAVIOR of HW3 is

component and_gate
	port (
	in1, in2    	: in std_logic;
	or_out		: out std_logic
	);
	end component;
begin
	and1: and_gate
		port map (data(0), reset);
end BEHAVIOR;