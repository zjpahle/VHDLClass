library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.fixed_pkg.all;
use IEEE.float_pkg.all;

entity expEng is
  	port    (
		start, clk	: in  std_logic;
		xin		: in  ufixed(15 downto 0);
		resultFracPart	: out ufixed(15 downto 0);
		resultIntPart	: out std_logic_vector(1  downto 0):= "00";
		busy		: out std_logic := '0'
		);
end expEng;
architecture behavior of expEng is
	--Signals Declarations--
	signal reg1 	: ufixed(15 downto 0):= to_ufixed(0, 16);
	signal reg2 	: ufixed(15 downto 0):= to_ufixed(0, 16);
	signal regOut 	: ufixed(15 downto 0):= to_ufixed(0, 16);
	signal data	: ufixed(15 downto 0):= to_ufixed(0, 16);
	signal sum	: ufixed(16 downto 0):= to_ufixed(0, 16);
	signal addr	: std_logic_vector(3  downto 0):= "0001";
	signal counter	: std_logic_vector(1  downto 0);

	component array_multiplier 
  	generic (bitn : integer);
  	port    (
		x, y 	: in  ufixed(bitn-1 downto 0);
		start	: in  std_logic;
		z    	: out ufixed(bitn-1 downto 0)
		);
	end component array_multiplier;

	begin
	--component => signal--
	array_multiplier1 : array_multiplier
  	generic map(bitn => 16)
	port map(
		x 	=> reg1,
		y 	=> reg2,
		start 	=> start,
		z 	=> regOut
		);
	----Begin Behavior Logic--
	--Sequential--
--	e = 1; a = 1;
--	for(i = 1; i < n; i++)
--		{a = a*x*(1/i);
--		e = e + a;}
	process begin
		if(rising_edge(start)) then
			busy <= '1';
			counter <= "00";
			reg1 <= xin;
			reg2 <= to_ufixed(1, data);
			sum  <= to_ufixed(1, data);
			wait until clk;
			while (addr <= "1111") loop
				reg1 <= xin;
				reg2 <= regOut;
				wait until clk;
				reg1 <= regOut;
				reg2 <= data;
				wait until clk;
				sum  <= sum + regOut;
				if(sum > to_ufixed(0.99999999999999, data)) then
					counter <=  counter + "01";
				end if;
				addr <= "0000";
			end loop;
			resultFracPart <= sum(15 downto 0);
			resultIntPart  <= counter;
			busy <= '0';
		end if;
	end process;

	process(clk) begin
		if(rising_edge(clk)) then
			case addr is
				when "0001" => data <= to_ufixed(0.99999999999999, data);
				when "0010" => data <= to_ufixed(0.50000000000000, data);
				when "0011" => data <= to_ufixed(0.33333333333333, data);
				when "0100" => data <= to_ufixed(0.25000000000000, data);
				when "0101" => data <= to_ufixed(0.20000000000000, data);
				when "0110" => data <= to_ufixed(0.16666666666667, data);
				when "0111" => data <= to_ufixed(0.14285714285714, data);
				when "1000" => data <= to_ufixed(0.12500000000000, data);
				when "1001" => data <= to_ufixed(0.11111111111111, data);
				when "1010" => data <= to_ufixed(0.10000000000000, data);
				when "1011" => data <= to_ufixed(0.09090909090909, data);
				when "1100" => data <= to_ufixed(0.08333333333333, data);
				when "1101" => data <= to_ufixed(0.07692307692308, data);
				when "1110" => data <= to_ufixed(0.07142857142857, data);
				when "1111" => data <= to_ufixed(0.06666666666667, data);
				when others => data <= "0000000000000000";
			end case;
		end if;
	end process;
end behavior;