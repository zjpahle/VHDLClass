library ieee;
use ieee.std_logic_1164.all;
 
entity or_gate is
  port (
	in1, in2	: in std_logic;
	or_out		: out std_logic
	);
end entity or_gate;

architecture behavior of or_gate is
begin
or_out <= in1 OR in2;
end behavior;