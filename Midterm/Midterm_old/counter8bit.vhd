library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter8bit is
port	(
	rst, clk    	: in std_logic;
	countOut	: out std_logic_vector (7 downto 0)
	);
end counter8bit;

architecture behavioral of counter8bit is
--Signals Declarations--
	signal cnt : std_logic_vector (7 downto 0) := "00000000";

--Begin Behavior Logic--
	begin
 	process(clk) begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				cnt <= "00000000";
			else 
				cnt <= cnt + 1;
			end if;
		end if;
		
	countOut <= cnt;
	end process;
 end behavioral;
