library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity controller is
port	(
	buffFull, nxt4rdy, clk 				: in  std_logic;
	strAddr 					: in  std_logic_vector (7 downto 0);
	cs, cur4rdy, done, memReady, buffEn, rwe 	: out std_logic := '0';
	addr						: out std_logic_vector (7 downto 0) := "00000000"
	);
end controller;

architecture behavioral of controller is
begin
	process(clk)
	variable currAddr : std_logic_vector (7 downto 0):= strAddr;
	variable count : std_logic_vector(1 downto 0):= "00";

	begin
	if(rising_edge(clk)) then
		if(buffFull = '0') then
			rwe 	<= '0'; -- read
			buffEn  <= '1';
			cs 	<= '0';
			cur4rdy <= '0';
			done	<= '1';

		elsif(buffFull = '1') then
			rwe 	<= '1'; -- write
			buffEn  <= '0';
			cs 	<= '1';
			cur4rdy <= '1';
			done	<= '0';
			if (nxt4rdy = '1') then
				buffEn   <= '1';
				while (count < 4) loop
					currAddr := currAddr + 1;
					addr <= currAddr;
					count := count + 1;
				end loop;
				--if(count=3) then
					count := "00";
					cur4rdy <= '0';
				--end if;
			end if;
		end if;
	end if;
	end process;
end behavioral;
