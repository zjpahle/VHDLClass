LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY mooreseqdec IS PORT(datain, clk, reset : IN std_logic; w : OUT std_logic);
END ENTITY;

ARCHITECTURE procedural OF mooreseqdec IS TYPE state IS(a, b, c, d, e, f, g, h);
SIGNAL current:state:= a;
BEGIN
	PROCESS (clk) BEGIN
		IF (clk = '0' AND clk'EVENT) THEN
			IF reset = '1' THEN current <= a;
			ELSE
				CASE current IS 
				WHEN a => 
				IF datain='0' THEN current <= b;
				ELSE current <= a; 
				END IF;
				WHEN b => 
				IF datain='1' THEN current <= c;
				ELSE current <= a; 
				END IF;
				WHEN c => 
				IF datain='1' THEN current <= d;
				ELSE current <= e; 
				END IF;
				WHEN d => 
				IF datain='0' THEN current <= f;
				ELSE current <= a; 
				END IF;
				WHEN e => 
				IF datain='1' THEN current <= g;
				ELSE current <= a; 
				END IF;
				WHEN f => 
				IF datain='0' THEN current <= h;
				ELSE current <= a; 
				END IF;
				WHEN g => 
				IF datain='0' THEN current <= h;
				ELSE current <= d; 
				END IF;
				WHEN h => 
				IF datain='1' THEN current <= a;
				ELSE current <= a; 
				END IF;

				WHEN OTHERS => 
				current <= a;
				END CASE;
			END IF;
		END IF;
	END PROCESS;
	w <= '1' WHEN current = h ELSE'0';
END ARCHITECTURE
procedural;