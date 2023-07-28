LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY TB_ADDSUB IS
END TB_ADDSUB;
 
ARCHITECTURE behavior OF TB_ADDSUB IS 
 
	constant width: Integer:=32;
    COMPONENT ADDSUB
	 
    PORT(
		OP: in std_logic;
		X: in std_logic_vector(width-1 downto 0);
		Y: in std_logic_vector(width-1 downto 0);
		Z: out std_logic_vector(width-1 downto 0);
		COUT: out std_logic
        );
    END COMPONENT;
	 
	 
	 --input
	 signal OP:  std_logic;
	 signal X: std_logic_vector(width-1 downto 0);
	 signal Y: std_logic_vector(width-1 downto 0);
	 
	 --output
	 signal Z: std_logic_vector(width-1 downto 0);
	 signal COUT: std_logic;
 
BEGIN
 
   uut: ADDSUB 
		PORT MAP (
			X => X,
			Y => Y,
			Z => Z,
			OP => OP,
			COUT => COUT
        );
 

   process
   begin		
      
		X <= "00000000000000000000000000001010"; --10
		Y <= "00000000000000000000000000000001"; --1
		OP <= '1';
      wait for 100 ns;	
		
		X <= "00000000000000000000000000001010"; --10
		Y <= "00000000000000000000000000010001"; --17
		OP <= '1';
      wait for 100 ns;
		
		X <= "11111111111111111111111111111111"; --4294967295
		Y <= "00000000000000000000000000000001"; --1
		OP <= '1';
      wait for 100 ns;

		X <= "00000000000000000000000000001110"; --14
		Y <= "00000000000000000000000000000010"; --2
		OP <= '0';
      wait;
   end process;

END;