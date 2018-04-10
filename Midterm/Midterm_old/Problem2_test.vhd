library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity problem2_test is
end problem2_test;

architecture test of problem2_test is
--Constants Declarations--
	--constant clk_period : time := 1 ns;

--Signals Declarations--
	signal rst, valid, clk	 	 : std_logic := '0';
	signal tgt_val, tgt_addr 	 : std_logic_vector (7 downto 0);

--Component Instantiation--
	component Problem_2 is
	port 	(
	  	clk 		: in  std_logic;
		reset		: in  std_logic;
		tgt_value	: in  std_logic_vector (7 downto 0);
		valid		: out std_logic;
		tgt_addr	: out std_logic_vector (7 downto 0)
		);
	end component Problem_2;

	--component => signal--
	begin Problem_2_1 : Problem_2
	port map(
		clk	  => clk,
		reset	  => rst,
		tgt_value => tgt_val,
		valid	  => valid,
		tgt_addr  => tgt_addr
		);

--Begin Testing--
	clk <= NOT clk after 1 ns;
	process begin
		--set value and reset--
		tgt_val <= "00001010";
		rst <= '1';
		wait for 1 ns;
		rst <= '0';
		wait for 100 ns;
		-----------------------
	end process;

end architecture test;
