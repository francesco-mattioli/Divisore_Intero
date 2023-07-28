LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TB_Q_REG_SP_32_BIT IS
END TB_Q_REG_SP_32_BIT;
 
ARCHITECTURE behavior OF TB_Q_REG_SP_32_BIT IS 
 
 constant width: Integer:=32;
    COMPONENT Q_REG_SP_32_BIT
    PORT(
         ENB : IN  std_logic;
         CLK : IN  std_logic;
         RST : IN  std_logic;
         X : IN  std_logic;
         Y : OUT  std_logic_vector(width-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ENB : std_logic;
   signal CLK : std_logic;
   signal RST : std_logic;
   signal X : std_logic;

 	--Outputs
   signal Y : std_logic_vector(width-1 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Q_REG_SP_32_BIT 
	PORT MAP (
          ENB => ENB,
          CLK => CLK,
          RST => RST,
          X => X,
          Y => Y
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
				X <= '1';
				wait for 100 ns;
				RST <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '1';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '1';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '1';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '1';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '1';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				ENB <='1';
				wait for 10 ns;
				X <= '1';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait for 10 ns;
				X <= '0';
				wait;
			end process;

END;