library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity bth is
port	(
  	go, clk, memReady 	: in  std_logic;
	SAR, DAR, TCR, dataIn	: in  std_logic_vector (7 downto 0);
	busy, readMem, writeMem	: out std_logic := '0';
	dataOut,address		: out std_logic_vector (7 downto 0) := "00000000"
	);
end bth;

architecture behavioral of bth is
--Signals Declarations--
	signal cntstart : std_logic;
	signal regload  : std_logic;
	signal rwsel 	: std_logic;
	signal done     : std_logic;
	signal datasel	: std_logic_vector(7 downto 0);
	signal inputsel	: std_logic_vector(7 downto 0);
	signal count	: std_logic_vector(7 downto 0);

--Component Instantiation--
	component memory8bit is
		port	(
			rwsel, clk 	: in    std_logic;
			addr 		: in    std_logic_vector (7 downto 0);
			data    	: inout std_logic_vector (7 downto 0)
			);
	end component memory8bit;

	component zerocounter8bit is
		port	(
			start, clk	: in  std_logic;
			load 		: in std_logic_vector (7 downto 0);
			ovf 		: out std_logic;
			count 		: out std_logic_vector (7 downto 0)
			);
	end component zerocounter8bit;

	--component => signal--
	begin 

	mem1 : memory8bit 
	port map(
		rwsel => rwsel,
		clk => clk,
		addr => count,
		data => datasel
		);

	zerocounter8bit1 : zerocounter8bit
	port map(
		start => cntstart,
		clk => clk,
		load => TCR,
		ovf => done,
		count => count
		);

--Begin Behavior Logic--
	--multiplexer logic--
	process (rwsel) begin

		if(rwsel = '1') then
			inputsel <= SAR;
			datasel <= dataIn;
		else
			inputsel <= DAR;
			dataOut <= datasel;
		end if;
	end process;

	--adder logic--
	process (count, inputsel) begin
		address <= inputsel + count;
	end process;

	--Controller Logic--
	process begin
	if (clk = '1') then
			if (go = '1') then 
			busy <= '1';
			rwsel <= '1';
			regload <= not regload;
			cntstart <= '1';
			wait until clk = '1';
			regload <= not regload;
			cntstart <= '0';
			wait until memReady = '1';
			cntstart <= '1';
			wait until clk = '1';
			cntstart <= '0';
			wait until done = '1';
			rwsel <= '0';
			cntstart <= '1';
			wait until done = '1';
			busy <= '0';
		end if;
	end if;
	end process;
end behavioral;
