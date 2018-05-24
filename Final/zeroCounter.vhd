library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity zerocounter8bit is
port	(
	start, clk	: in  std_logic;
	load 		: in std_logic_vector (7 downto 0);
	ovf 		: out std_logic;
	count 		: out std_logic_vector (7 downto 0)
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
			if (start = '1') then
				cnt <= load;
				ovf <= '0';
			elsif (cnt = "00000000") then
				ovf <= '1';
			else 
				cnt <= cnt - 1;
			end if;
			count <= cnt;
		end if;
	end process;
 end behavioral;
