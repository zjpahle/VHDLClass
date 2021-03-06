library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_textio.all;

entity buff16bit is
port	(
	datain 		: in  std_logic_vector (15 downto 0);
	clk, rwsel, en 	: in  std_logic;
	dataout 	: out std_logic_vector (15 downto 0):= "0000000000000000";
	full 		: out std_logic := '0'
	);
end buff16bit;

architecture behavioral of buff16bit is

type mem is array (natural range <>, natural range <>) of std_logic;
constant memsize : integer := 2**8;
signal memloc : std_logic_vector (7 downto 0) := "00000000";

begin
process 
variable memory : mem (0 to memsize-1, datain'range);
begin
	if(rising_edge(clk)) then
		if((en = '1') and (rwsel = '0')) then
			for i in dataout'range loop
				memory(conv_integer(memloc),i):=datain (i);
			end loop;
			memloc <= memloc + 1;
		elsif((en = '1') and (rwsel = '1')) then
			for i in dataout'range loop
				dataout(i)<=memory(conv_integer(memloc),i);
			end loop;
			memloc <= memloc - 1;
		else
			dataout <= "0000000000000000";
		end if;
		if(memloc >= "11111111") then
			full <= '1';
		elsif(memloc = "00000000") then
			full <= '0';
		end if;
	end if;
	wait on clk;
	end process;
end behavioral;


--use ieee.std_logic_textio.all;
--entity std_logic_ram is
--   port (address, datain : in std_logic_vector; 
--         dataout : out std_logic_vector;
--         cs, rwbar : in std_logic; opr : in boolean);
--end entity std_logic_ram;
----
--architecture behavioral of std_logic_ram is
--type mem is array (natural range <>, natural range <>) of std_logic;
--begin
--process 
--constant memsize : integer := 2**address'length; 
--variable memory : mem (0 to memsize-1, datain'range);
--begin
--	id: if opr'event then
--	if opr=true then 
--		init_mem (memory, "memdata.dat");
--	else 
--		dump_mem (memory, "memdump.dat"); end if;
--	end if;
--	wr: if cs = '1' then 
--		if rwbar = '0' then -- writing
--		for i in dataout'range loop
--			memory(conv_integer(address),i):=datain (i);
--		end loop;
--		end if;
--	end if;         
--	wait on cs, rwbar, address, datain, opr;
--end process; 

