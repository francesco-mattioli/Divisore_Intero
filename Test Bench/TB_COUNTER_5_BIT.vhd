 LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;

  ENTITY TB_COUNTER_5_BIT IS
  END TB_COUNTER_5_BIT;

  ARCHITECTURE behavior OF TB_COUNTER_5_BIT IS 

			 constant width: Integer:=5;
          COMPONENT COUNTER_5_BIT
          PORT(
            CLK: in std_logic;
				ENB: in std_logic;
				RST: in std_logic;
				ZC: out std_logic_vector(width-1 downto 0);
				ENDC: out std_logic
            );
          END COMPONENT;
			 
		signal ZC: std_logic_vector(width-1 downto 0);
		signal CLK: std_logic;
		signal ENB: std_logic;
		signal RST: std_logic;
		signal ENDC: std_logic;
		
          

  BEGIN

         uut: COUNTER_5_BIT 
				PORT MAP(
					ZC => ZC,
					CLK => CLK,
					RST => RST,
					ENDC => ENDC,
					ENB => ENB
				);

     process 
		begin 
			RST <= '1';
			wait for 80 ns;
			RST <= '0';
			wait for 20 ns;
			ENB <= '0';
			RST <= '1';
			wait for 40 ns;
			ENB <= '1';
			RST <= '0';
			--wait for 620 ns;
			--ENB <= '0';
			wait;
		end process;
		
	--clock
	
		process 
			begin
				CLK <= '0';
				wait for 20 ns;
				CLK <= '1';
				wait for 20 ns;
			end process;
			

  END;