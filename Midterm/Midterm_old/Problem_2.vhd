library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity problem_2 is
port	(
  	clk 		: in  std_logic;
	reset		: in  std_logic;
	tgt_value	: in  std_logic_vector (7 downto 0);
	valid		: out std_logic := '0';
	tgt_addr	: out std_logic_vector (7 downto 0) := "00000000"
	);
end problem_2;

architecture behavioral of problem_2 is
--Signals Declarations--
	signal count  : std_logic_vector (7 downto 0);
	signal memchk : std_logic_vector (7 downto 0);
	signal enchk  : std_logic;

--Component Instantiation--
	component counter8bit is
	port	(
		rst    	 : in  std_logic;
		clk    	 : in  std_logic;
		countOut : out std_logic_vector (7 downto 0)
		);
	end component counter8bit;

	component memory8bit is
		port	(
			addr 	: in  std_logic_vector (7 downto 0);
			dataout : out std_logic_vector (7 downto 0)
			);
	end component memory8bit;
	
	component comp8bit is
		port 	( 
			dataA : in   std_logic_vector (7 downto 0);
			dataB : in   std_logic_vector (7 downto 0);
			dOut  : out  std_logic
			);
	end component comp8bit;

	--component => signal--
	begin 
	count1 : counter8bit 
	port map(
		rst	=> reset,
		clk	=> clk,
		countOut=> count
		);

	mem1 : memory8bit 
	port map(
		addr	=> count,
		dataout => memchk
		);

	comp1 : comp8bit
	port map(
		dataA	=> memchk,
		dataB	=> tgt_value,
		dOut	=> enchk
		);

--Begin Behavior Logic--
	process(clk) begin
	if rising_edge(clk) then
		if enchk = '1' then
			tgt_addr <= count;
		else
			tgt_addr <= "00000000";
		end if;
	end if;
	valid <= enchk;
	end process;

end behavioral;