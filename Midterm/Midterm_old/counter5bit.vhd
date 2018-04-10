library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter5bit is
port	(
	in1,rst,clk    	: in std_logic;
	countOut	: out std_logic_vector (4 downto 0)
	);
end counter5bit;

architecture behavioral of counter5bit is
--Signals Declarations--
	signal cnt : std_logic_vector (4 downto 0) := "00000";

--Begin Behavior Logic--
	begin
 	process(clk) begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				cnt <= "00000";
			end if;
			if (in1 = '1') then
				cnt <= cnt + 1;
			end if;
		end if;
		
	countOut <= cnt;
	end process;
 end behavioral;