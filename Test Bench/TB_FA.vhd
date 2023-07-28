library ieee;
use ieee.std_logic_1164.all;
 
ENTITY TB_FA IS
END TB_FA;
 
ARCHITECTURE behavior OF TB_FA IS 
 
 
    COMPONENT FA
    PORT(
         X : IN  std_logic;
         Y : IN  std_logic;
         CIN : IN  std_logic;
         S : OUT  std_logic;
         COUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic;
   signal Y : std_logic;
   signal CIN : std_logic;

 	--Outputs
   signal S : std_logic;
   signal COUT : std_logic;
   
BEGIN
 
   uut: FA 
		PORT MAP (
          X => X,
          Y => Y,
          CIN => CIN,
          S => S,
          COUT => COUT
        );

  
   process
   begin		
		X <= '0';
		Y <= '0';
		CIN <= '0';
		wait for 20 ns;
		
		X <= '1';
		Y <= '0';
		CIN <= '0';
		wait for 20 ns;
		
		X <= '1';
		Y <= '1';
		CIN <= '0';
		wait for 20 ns;
		
		
		X <= '1';
		Y <= '1';
		CIN <= '1';
		wait for 20 ns;
		
		
		X <= '1';
		Y <= '0';
		CIN <= '1';
		wait;
		
   end process;

END;