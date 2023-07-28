library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_REG_PP_32_BIT is
	port(
		ENB: in std_logic;
		CLK: in std_logic;
		RST: in std_logic;
		LOAD: in std_logic;
		X: in std_logic_vector(31 downto 0);
		Y: out std_logic_vector(31 downto 0)
		);
		
end D_REG_PP_32_BIT;

architecture STRUCT of D_REG_PP_32_BIT is
	signal TY: std_logic_vector(31 downto 0);
	signal TX: std_logic_vector(31 downto 0);
	
begin
	
	TX <= X when LOAD = '1' else
			TY;
	process(CLK, RST)
	begin
		if(RST = '1') then
			TY <= (others => '0');
		else if(CLK'event and CLK = '1' and ENB = '1') then
			TY <= TX;
		end if;
		end if;
	end process;
	Y <= TY;
		
end STRUCT;