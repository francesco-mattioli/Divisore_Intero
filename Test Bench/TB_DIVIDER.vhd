LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY TB_DIVIDER IS
END TB_DIVIDER;
 
ARCHITECTURE behavior OF TB_DIVIDER IS 
 
 
    COMPONENT DIVIDER
    PORT(
			RST: in std_logic;
			CLK: in std_logic;
         NUM : IN  std_logic_vector(31 downto 0);
         D : IN  std_logic_vector(31 downto 0);
         START : IN  std_logic;
         EOC : OUT  std_logic;
         Q : OUT  std_logic_vector(31 downto 0);
         R : OUT  std_logic_vector(31 downto 0);
			ERROR: OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal NUM : std_logic_vector(31 downto 0);
   signal D : std_logic_vector(31 downto 0);
   signal START : std_logic;

 	--Outputs
   signal EOC : std_logic;
   signal Q : std_logic_vector(31 downto 0);
   signal R : std_logic_vector(31 downto 0);
	signal ERROR : std_logic;

	--CLK & RST
	signal RST: std_logic;
	signal CLK: std_logic;
	constant CLOCK: time := 48 ns;
	
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DIVIDER PORT MAP (
          NUM => NUM,
          D => D,
          START => START,
          EOC => EOC,
          Q => Q,
          R => R,
			 RST => RST,
			 CLK => CLK,
			 ERROR => ERROR
        );

  process 
			begin
				CLK <= '0';
				wait for CLOCK/2;
				CLK <= '1';
				wait for CLOCK/2;
			end process;
		
		process 
			begin
				RST <= '1';
				NUM <= "01000100000011000001000000001000"; -- 1141641224
				D <= "00000000000000000000000000010010"; -- 18
				START <= '0';
				wait for CLOCK*5;
				RST <= '0';
				wait for CLOCK*35; -- fatto per caso particolare di COM_START
				START <= '1';
				wait for CLOCK;
				START <= '0';				
				wait for CLOCK*28; -- cambio i valori in ingresso prima che sia finita la precedente divisione
				NUM <= "00000000000000000000000000001000"; -- 8
				D <= "00000000000000000000000000000010"; -- 2
				wait for CLOCK*10;
				START <= '1';
				wait for CLOCK;
				START <= '0';
				wait for CLOCK*35;
				NUM <= "00000000000000000000000000001000"; -- 8
				D <= "00000000000000000000000000000000"; -- 0
				wait for CLOCK*2;
				START <= '1';
				wait for CLOCK;
				START <= '0';
				wait for CLOCK*35;
				NUM <= "00000000000000000000000000000000"; -- 0
				D <= "00000000000000000000000010001000"; -- 136
				wait for CLOCK*3;
				START <= '1';
				wait for CLOCK;
				START <= '0';
				wait for CLOCK*35;
				NUM <= "10010000001000111000000000001000"; -- 2418245640
				D <= "01010110000111000000000000000010"; -- 1444675586
				wait for CLOCK;
				START <= '1';
				wait for CLOCK;
				START <= '0';
				wait for CLOCK*35;
				NUM <= "00010000001000111000000000001000"; -- 2418245640
				D <= "11010110000111000000000000000010"; -- 1444675586
				wait for CLOCK;
				START <= '1';
				wait for CLOCK;
				START <= '0';
				wait for CLOCK*35;
				NUM <= "00000000000000000000000000010001"; -- 17
				D <= "00000000000000000000000000000010"; -- 2
				wait for CLOCK;
				START <= '1';
				wait for CLOCK;
				START <= '0';
				wait for CLOCK*35;
				NUM <= "00000000000000000000000000010000"; -- 16
				D <= "00100001000100100111010001100010"; -- 554857570
				wait for CLOCK;
				START <= '1';
				wait for CLOCK;
				START <= '0';
				wait for CLOCK*35;
				NUM <= "00000000000000000000000000000000"; -- 0
				D <= "00000000000000000000000000000000"; -- 0
				wait for CLOCK;
				START <= '1';
				wait for CLOCK;
				START <= '0';
				wait for CLOCK*35;
				NUM <= "01110000100000010001111000010000"; -- 1887510032
				D <= "01110000100000010001111000010000"; -- 1887510032
				wait for CLOCK;
				START <= '1';
				wait for CLOCK;
				START <= '0';
				wait;
			end process;


END;