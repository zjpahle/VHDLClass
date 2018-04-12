library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity ones_sum is
	port 	( 
		data : in  std_logic_vector (7 downto 0);
		rst : in std_logic;
		ones : out  std_logic_vector (3 downto 0)
		);
	end ones_sum;

architecture Behavioral of ones_sum is
begin
	process(data)

		variable count : unsigned(3 downto 0) := "0000";
		begin
		count := "0000";
		
		for i in 0 to 7 loop
			if(rst = '1') then
				count := "0000";
			end if;
				if(data(i) = '1') then
				count := count + 1;
			end if;
		end loop;
		ones <= std_logic_vector(count);
	end process;
end behavioral;