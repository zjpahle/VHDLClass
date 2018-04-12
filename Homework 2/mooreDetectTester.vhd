LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY mooreseqdec_tester IS END ENTITY;

ARCHITECTURE timed OF mooreseqdec_tester IS SIGNAL aa, clock, rst, ww : std_logic := '0';
BEGIN 
	UUT1: ENTITY WORK.mooreseqdec (procedural)
		PORT MAP(aa, clock, rst, ww);
rst <= '1' AFTER 31 NS, '0' AFTER 54 NS;
clock <= NOT clock AFTER 7 NS WHEN NOW<=165 NS ELSE '0';

PROCESS BEGIN 
	WAIT FOR 23 NS; aa <= '1';
	WAIT FOR 21 NS; aa <= '0';
	WAIT FOR 19 NS; aa <= '1';
	WAIT FOR 31 NS; aa <= '1';
	WAIT FOR 34 NS; aa <= '0';
	WAIT FOR 36 NS; aa <= '0';
	WAIT FOR 38 NS; aa <= '1';
	WAIT FOR 41 NS; aa <= '1';
	WAIT FOR 43 NS; aa <= '1';
	WAIT FOR 45 NS; aa <= '1';
	WAIT FOR 47 NS; aa <= '0';
	WAIT FOR 49 NS; aa <= '1';
	WAIT FOR 51 NS; aa <= '0';
	WAIT FOR 53 NS; aa <= '1';
	WAIT FOR 55 NS; aa <= '0';
	WAIT;
END PROCESS;

PROCESS(ww) BEGIN
	REPORT"Signal w changed to:"& std_logic'IMAGE(ww) & " at " & TIME'IMAGE(NOW)
		SEVERITY NOTE;
	END PROCESS;
END ARCHITECTURE
timed;