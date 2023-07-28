
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_START_COM IS
	
END TB_START_COM;
 
ARCHITECTURE behavior OF TB_START_COM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT START_COM
    PORT(
		RST: in std_logic;
		START: in std_logic;
		COM: out std_logic
        );
    END COMPONENT;
    
	signal START: std_logic;
	signal COM: std_logic;
	signal RST: std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: START_COM PORT MAP (
		START => START,
		COM => COM,
		RST => RST
        );

 
	process
   begin		
		RST <= '1';
      START <= '1';
      wait for 10 ns;
		RST <= '0';
		wait for 20 ns;
		START <= '0';
      wait;
   end process;

END;
