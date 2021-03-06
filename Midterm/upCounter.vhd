library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity upcounter10bit is
port	(
	rst, clk    	: in std_logic;
	ovf		: out std_logic := '0';
	cnt_out		: out std_logic_vector (9 downto 0)
	);
end upcounter10bit;

architecture behavioral of upcounter10bit is
--Signals Declarations--
	signal cnt : std_logic_vector (9 downto 0) := "0000000000";

--Begin Behavior Logic--
	begin
 	process(clk) begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				cnt <= "0000000000";
				ovf <= '0';
			elsif (cnt = "1111111111") then
				ovf <= '1';
				cnt <= "0000000000";
			else
				cnt <= cnt + 1;
				cnt_out <= cnt;
			end if;
		end if;
	end process;
 end behavioral;