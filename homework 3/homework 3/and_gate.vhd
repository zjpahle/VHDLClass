library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
  port (
	in1, in2    	: in std_logic;
	and_out		: out std_logic
	);
end entity and_gate;

architecture and_arch of and_gate is
 begin
 	and_out <= in1 and in2;
 end and_arch;