Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY assign_5a IS
PORT (

	
    clock, reset, din, din_valid : IN STD_LOGIC;
	count :OUT STD_LOGIC_VECTOR(7 downto 0);
	done : OUT STD_LOGIC

);
END ENTITY assign_5a;

ARCHITECTURE arc OF assign_5a IS 

    TYPE state_type IS (a, b, c, d, e); 

    SIGNAL rahat : state_type; 

    SIGNAL rinti : UNSIGNED(7 DOWNTO 0); 

BEGIN 

    PROCESS(clock, reset) 

    BEGIN 

        IF reset = '1' then 

            rahat <= a; 

            count <= (others => '0'); 

        ELSIF rising_edge(clock) then 

            CASE rahat IS 

                WHEN a => 

                    IF din = '0' then 

                        rahat <= b; 

                    ELSE 

                        rahat <= a; 

                    END IF;

                WHEN b => 

                    IF DIN = '0' THEN

                        rahat <= c; 

                    ELSE 

                        rahat <= d; 

                    END IF; 

                WHEN c => 

                    IF DIN = '0' THEN 

                        rahat <= a; 

                    ELSE 

                        rahat <= d; 

                        rinti <= rinti + 1; 

                    END IF; 



                WHEN d => 

                    IF DIN = '0' THEN 

                        rahat <= e; 

                    ELSE

                        rahat <= a; 

                    END IF; 

                WHEN e => 

                    IF DIN = '0' THEN 

                        rahat <= c; 

                    ELSE 

                        rahat <= d; 

                        rinti <= rinti + 1; 

                    END IF; 

                END CASE; 

            END IF; 

    END PROCESS; 


    count <= STD_LOGIC_VECTOR(rinti(7 DOWNTO 0));

    done <= '1';

END ARCHITECTURE arc;


