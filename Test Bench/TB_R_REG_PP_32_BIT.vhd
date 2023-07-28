  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY TB_R_REG_PP_32_BIT IS
  END TB_R_REG_PP_32_BIT;

  ARCHITECTURE behavior OF TB_R_REG_PP_32_BIT IS 
			 constant width: Integer:=32;
          COMPONENT R_REG_PP_32_BIT
          PORT(
               ENB: in std_logic;
					CLK: in std_logic;
					RST: in std_logic;
					X: in std_logic_vector(width-1 downto 0);
					Y: out std_logic_vector(width-1 downto 0)
                  );
          END COMPONENT;

          signal X: std_logic_vector(width-1 downto 0);
			 signal Y: std_logic_vector(width-1 downto 0);
			 
			 signal ENB: std_logic;
			 signal RST: std_logic;
			 signal CLK: std_logic;
          

  BEGIN

  -- Component Instantiation
          uut: R_REG_PP_32_BIT PORT MAP(
                  X => X,
						Y => Y,
						ENB => ENB,
						RST => RST,
						CLK => CLK
          );


  process 
			begin
				CLK <= '0';
				wait for 10 ns;
				CLK <= '1';
				wait for 10 ns;
			end process;
			
			process 
			begin
				RST <= '1';
				X <= "01010101010101010101010101010101";
				ENB <= '0';
				wait for 100 ns;
				RST <= '0';
				wait for 10 ns;
				ENB <= '1';
				wait for 20 ns;
				ENB <= '0';
				X <= "00000000000000000000000000000001";
				wait for 20 ns;
				ENB <= '1';
				wait for 20 ns;
				X <= "00000000000000000000000000000011";
				wait for 20 ns;
				X <= "00000011000011000011000000000011";
				ENB <= '0';
				wait;
			end process;

  END;