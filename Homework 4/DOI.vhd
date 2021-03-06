library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity DOI is
port	(
	data			: in  std_logic_vector (15 downto 0);
	straddr 		: in  std_logic_vector (7 downto 0);
	gnt, clk 		: in  std_logic;
	memWrite		: out std_logic_vector (15 downto 0);
	cs, req, done, memReady : out std_logic;
	addr			: out std_logic_vector (7 downto 0)
	);
end DOI;

architecture behavioral of DOI is

--Signal Declaration--
	signal fullsig	: std_logic;
	signal ensig	: std_logic;
	signal rwsig	: std_logic;

--Component Instantiation--
	component controller is
	port	(
		buffFull, nxt4rdy, clk 				: in  std_logic;
		strAddr 					: in  std_logic_vector (7 downto 0);
		cs, cur4rdy, done, memReady, buffEn, rwe 	: out std_logic;
		addr						: out std_logic_vector (7 downto 0)
		);
	end component controller;

		component buff16bit is
	port	(
		datain 		: in  std_logic_vector (15 downto 0);
		clk, rwsel, en 	: in  std_logic;
		dataout 	: out std_logic_vector (15 downto 0);
		full 		: out std_logic
		);
	end component buff16bit;

--Port Mapping--
	--component => signal--
	begin
	controller1 : controller
	port map(
		buffFull=> fullsig,
		buffEn	=> ensig,
		strAddr	=> straddr,
		nxt4rdy	=> gnt,
		cur4rdy	=> req,
		done	=> done,
		memReady=> memReady,
		addr	=> addr,
		clk	=> clk,
		cs	=> cs,
		rwe	=> rwsig
		);
	
		buff16bit1 : buff16bit
	port map(
		datain	=> data,
		clk	=> clk,
		rwsel	=> rwsig,
		en	=> ensig,
		dataout	=> memWrite,
		full	=> fullsig
		);
end behavioral;