library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity problem1 is
port	(
	A, B		: in  std_logic_vector (7 downto 0);
	reset, clk	: in  std_logic;
	Count		: out std_logic_vector (4 downto 0)
	);
end problem1;

architecture behavioral of problem1 is
--Signals Declarations--
	signal count1Out, count2Out 	: std_logic_vector (4 downto 0);
	signal compOut, counten, diff	: std_logic;

--Component Instantiation--
	component comp8bit is
	port 	( 
		dataA		: in  std_logic_vector (7 downto 0);
		dataB		: in  std_logic_vector (7 downto 0);
		dOut 		: out std_logic
		);
	end component comp8bit;
	
	component counter5bit is
	port	(
		in1    		: in  std_logic;
		rst    		: in  std_logic;
		clk    		: in  std_logic;
		countOut	: out std_logic_vector (4 downto 0)
		);
	end component counter5bit;
	
	--component => signal--
	begin 
	comp1 : comp8bit 
	port map(
		dataA	=> A,
		dataB	=> B,
		dOut	=> compOut
		);
	
	counter5bit1 : counter5bit
	port map(
		in1	=> diff,
		rst	=> reset,
		clk	=> clk,
		countOut=> count1Out
		);

	counter5bit2 : counter5bit
	port map(
		in1	=> counten,
		rst	=> reset,
		clk	=> clk,
		countOut=> count2Out
		);

--Begin Behavior Logic--
	diff  <= (not compOut);
	Count <= count2Out;
	process(clk) begin
		if (count1Out >= 5) then
			counten <= '1';
		else
			counten <= '0';
		end if;
	end process;

end behavioral;