
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY TB_CHECK_ERROR IS
END TB_CHECK_ERROR;
 
ARCHITECTURE behavior OF TB_CHECK_ERROR IS 
 
    COMPONENT CHECK_ERROR
    PORT(
		CLK: in std_logic;
		ENB: in std_logic;
		RST: in std_logic;
		D: in std_logic_vector (31 downto 0);
		ERROR: out std_logic
      );
    END COMPONENT;
    
	 signal CLK: std_logic;
	 signal ENB: std_logic;
	 signal RST: std_logic;
	 signal D: std_logic_vector(31 downto 0);
	 signal ERROR: std_logic;
 
 
BEGIN
 
   uut: CHECK_ERROR PORT MAP (
			RST => RST,
			CLK => CLK,
			ENB => ENB,
			D => D,
			ERROR => ERROR
        );

	process 
			begin
				CLK <= '0';
				wait for 5 ns;
				CLK <= '1';
				wait for 5 ns;
			end process;

   process
   begin		
      RST <= '1';
		ENB <= '0';
      wait for 100 ns;	
		RST <= '0';
		D <= "0000000000000000010000000000000";
		wait for 10 ns;
		ENB <= '1';
		wait for 100 ns;	
		RST <= '1';
		wait for 10 ns;
		D <= "00000000000000000000000000000000";
		RST <= '0';
      wait;
   end process; 

END;
