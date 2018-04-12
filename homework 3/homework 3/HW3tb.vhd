library ieee;
use ieee.std_logic_1164.all;

entity and_gate_tb is
end and_gate_tb;

architecture test of and_gate_tb is
  signal r_SIG1   : std_logic := '0';
  signal r_SIG2   : std_logic := '0';
  signal w_RESULT : std_logic;

component and_gate is
port (
end component and_gate;
 
begin
	and_gate_INST : and_gate
	port map (
	);

	process is
	begin
	end process;
end architecture test;