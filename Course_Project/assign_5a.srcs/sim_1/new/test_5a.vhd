Library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY test_5a IS
END ENTITY test_5a;

ARCHITECTURE arc OF test_5a IS

	SIGNAL clock, reset, din_valid, din, done : STD_LOGIC;
	SIGNAL count : STD_LOGIC_VECTOR (7 downto 0);
	SIGNAL input : STD_LOGIC_VECTOR(31 downto 0);

BEGIN

	rafi : ENTITY work. assign_5a (arc)
	PORT MAP (clock => clock, reset => reset, din_valid => din_valid, din => din, count => count, done => done);

	PROCESS
	BEGIN

		Clock <= '0' ;
		wait for 1 ns;
		clock <= '1';
		wait for 1 ns;

	END PROCESS; 

	PROCESS
	BEGIN

		reset <= '1' ;
		wait for 5 ns;
		reset <= '0';
		wait;

	END PROCESS; 

process(clock) 

variable it : natural; 

begin 

    input <= "11001010110100100110101010011101"; 
    it := 31;
        if rising_edge(clock) then 

            if reset = '1' then 

                din_valid <= '0'; 

            else 

                din_valid <= '1'; 
                it := it - 1; 

            end if; 

            din <= input(it); 

        end if; 

    end process; 

END ARCHITECTURE arc;




	




