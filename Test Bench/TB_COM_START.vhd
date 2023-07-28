
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY TB_COM_START IS
END TB_COM_START;
 
ARCHITECTURE behavior OF TB_COM_START IS 

 
    COMPONENT COM_START
    PORT(
			ENB: IN std_logic;
			RST: IN std_logic;
			CLK: IN std_logic;
         START : IN  std_logic;
         COM : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
	signal ENB: std_logic;
	signal RST: std_logic;
   signal START : std_logic;
	signal CLK: std_logic;

 	--Outputs
   signal COM : std_logic;
   
 
BEGIN
 
   uut: COM_START PORT MAP (
			 ENB => ENB,
			 RST => RST,
          START => START,
			 CLK => CLK,
          COM => COM
        );

 
 process 
			begin
				CLK <= '0';
				wait for 5 ns;
				CLK <= '1';
				wait for 5 ns;
			end process;

   -- Stimulus process
   stim_proc: process
   begin
		ENB <= '0';
		RST <= '1';
      START <= '0';
      wait for 100 ns;	
		RST <= '0';
		wait for 100 ns;	
		ENB <= '1';
		START <= '1';
		wait for 10 ns;	
		START <= '0';
		ENB <= '0';
		wait for 20 ns;	
		START <= '1';
		ENB <= '1';
		wait for 10 ns;	
		START <= '0';
		ENB <= '0';
      wait;
   end process;

END;
