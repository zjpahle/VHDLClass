library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity downcounter10bit is
port	(
	in1, rst, clk	: in std_logic;
	cnt_out		: out std_logic_vector (9 downto 0)
	);
end downcounter10bit;

architecture behavioral of downcounter10bit is
--Signals Declarations--
	signal cnt : std_logic_vector (9 downto 0) := "1111111111";

--Begin Behavior Logic--
	begin
 	process(clk) begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				cnt <= "1111111111";
				cnt_out <= cnt;
			elsif (cnt = "0000000000") then
				cnt <= "1111111111";
			elsif (in1 = '1') then
				cnt <= cnt - 1;
				--cnt_out <= cnt;
			end if;
		end if;
	end process;
 end behavioral;
