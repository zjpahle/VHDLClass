library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;

entity DOI_test is
end DOI_test;

architecture test of DOI_test is

--Constants Declarations--
	constant clk_period : time := 1 ns;

--Signals Declarations--
	signal data,dataout		: std_logic_vector (15 downto 0);
	signal straddr, addr		: std_logic_vector (7 downto 0);
	signal gnt, clk 		: std_logic := '0';
	signal cs, req, done, memReady  : std_logic := '0';

--Component Instantiation--
	component DOI is
	port	(
		data			: in  std_logic_vector (15 downto 0);
		straddr 		: in  std_logic_vector (7 downto 0);
		gnt, clk 		: in  std_logic;
		memWrite		: out std_logic_vector (15 downto 0);
		cs, req, done, memReady : out std_logic;
		addr			: out std_logic_vector (7 downto 0)
		);
	end component DOI;

	--component => signal--
	begin
	DOI1 : DOI
	port map(
		data	=> data,
		straddr	=> straddr,
		gnt	=> gnt,
		clk	=> clk,
		memWrite=> dataout,
		addr	=> addr,
		cs	=> cs,
		req	=> req,
		done	=> done,
		memReady=> memReady
		);

--Begin Testing--
	clk <= NOT clk after clk_period/2;
	process
	--variable seed1, seed2: positive := 10;
	--variable rand: real;
			--uniform(seed1, seed2, rand);
			--rand := conv_integer(rand);
	begin
		data <= "0000000000000000";
		straddr <= "00000110";
		for i in 0 to 512 loop
			if(rising_edge(clk)) then
				data <= data + 1;
				if(req = '1') then
					wait on clk;
					gnt <= '1';
					wait on clk;
					gnt <= '0';
				end if;
			end if;
		end loop;
		wait on clk;
	end process;
end architecture test;
