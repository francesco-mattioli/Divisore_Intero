LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY TB_N_REG_PS_32_BIT IS
END TB_N_REG_PS_32_BIT;
 
ARCHITECTURE behavior OF TB_N_REG_PS_32_BIT IS 
 
	 constant width: Integer:=32;
    COMPONENT N_REG_PS_32_BIT
    PORT(
		CLK: in std_logic;
		RST: in std_logic;
		LOAD: in std_logic;
		ENB: in std_logic;
		X: in std_logic_vector(width-1 downto 0);
		Y: out std_logic
        );
    END COMPONENT;
    
   signal X: std_logic_vector(width-1 downto 0);
	signal LOAD: std_logic;
	
	signal Y: std_logic;
	
	signal CLK: std_logic;
	signal RST: std_logic;
	signal ENB: std_logic;
	
 
BEGIN
 
   uut: N_REG_PS_32_BIT 
		PORT MAP (
			X => X,
			LOAD => LOAD,
			Y => Y,
			CLK => CLK,
			RST => RST,
			ENB => ENB
        );

		
	--clock
	
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
				X <= "11010101010101010101010101010101";
				LOAD <= '0';
				--ENB <= '1';
				wait for 100 ns;
				--LOAD <= '0';
				--wait for 10 ns;
				RST <= '0';
				wait for 10 ns;
				LOAD <= '1';
				ENB <= '1';
				wait for 10 ns;
				LOAD <= '0';
				wait for 120 ns;
				ENB <= '0';
				wait for 100 ns;
				X <= "01010101010101010101010000000000";
				LOAD <= '1';
				wait for 10 ns;
				LOAD <= '0';
				wait for 10 ns;
				ENB <= '0';
				wait;
			end process;

END;