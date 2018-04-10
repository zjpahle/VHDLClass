library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity zerocounter8bit is
port	(
	load		: in  std_logic_vector (7 downto 0);
	clk		: in  std_logic;
	go		: in  std_logic;
	zero	 	: out std_logic
	);
end zerocounter8bit;

architecture behavioral of zerocounter8bit is
--Signals Declarations--
	signal cnt 	: std_logic_vector (7 downto 0);

--Begin Behavior Logic--
	begin
	cnt <= load;
 	process(clk) begin
		if (rising_edge(clk)) then
			if (go = '1') then
				cnt <= load;
				zero <= '0';
			elsif (cnt = "00000000") then
				zero <= '1';
			else 
				cnt <= cnt - 1;
			end if;
		end if;
	end process;
 end behavioral;
