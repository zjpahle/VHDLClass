library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity controller_test is
end controller_test;

architecture test of controller_test is

--Constants Declarations--
	constant clk_period : time := 1 ns;

--Signals Declarations--
		signal buffFull, nxt4rdy, clk 			: std_logic := '0';
		signal strAddr 					: std_logic_vector (7 downto 0):= "00000000";
		signal cs, cur4rdy, done, memReady, buffEn, rwe : std_logic;
		signal addr					: std_logic_vector (7 downto 0);

--Component Instantiation--
	component controller is
	port	(
		buffFull, nxt4rdy, clk 				: in  std_logic;
		strAddr 					: in  std_logic_vector (7 downto 0);
		cs, cur4rdy, done, memReady, buffEn, rwe 	: out std_logic;
		addr						: out std_logic_vector (7 downto 0)
		);
	end component controller;

	--component => signal--
	begin
	controller1 : controller
	port map(
		buffFull => buffFull,
		nxt4rdy  => nxt4rdy,
		clk 	 => clk,
		strAddr  => strAddr,
		cs 	 => cs,
		cur4rdy  => cur4rdy,
		done 	 => done,
		memReady => memReady,
		buffEn 	 => buffEn,
		rwe 	 => rwe,
		addr 	 => addr
		);

--Begin Testing--
	memReady <= '0';
	clk <= NOT clk after clk_period/2;
	process
	variable count : std_logic_vector(7 downto 0) := "00000000";
	begin
		straddr <= "00000110";
		wait until rising_edge(clk);
		count := count + 1;
		if(count = 4) then
			buffFull <= '1';
		elsif(count = 10) then
			buffFull <= '0';
		elsif(cur4rdy = '1') then
			nxt4rdy <= '1';
			wait for 4*clk_period;
			nxt4rdy <= '0';
		end if;
	end process;
end architecture test;