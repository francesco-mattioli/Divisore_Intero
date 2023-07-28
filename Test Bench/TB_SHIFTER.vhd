
library ieee;
use ieee.std_logic_1164.all;
 
 
ENTITY TB_SHIFTER IS
END TB_SHIFTER;
 
ARCHITECTURE behavior OF TB_SHIFTER IS 
 
	 constant width: Integer:=32;
    COMPONENT SHIFTER
    PORT(
		X : in std_logic_vector(width-1 downto 0);
		B : in std_logic;
		Y : out std_logic_vector(width-1 downto 0)
        );
    END COMPONENT;
    
  --input
	signal X : std_logic_vector(width-1 downto 0);
	signal B : std_logic;
		
	--output
	signal Y : std_logic_vector(width-1 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SHIFTER PORT MAP (
		X => X,
		B => B,
		Y => Y
      );

   -- Stimulus process
   process
   begin		
		X <= "00000000000000000000000000000001";
		B <= '0';
      wait for 10 ns;	
		B <= '1';
		wait for 30 ns;
		X <= Y;
		B <= '0';
      wait;
   end process;

END;