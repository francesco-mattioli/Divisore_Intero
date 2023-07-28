library ieee;
use ieee.std_logic_1164.all;


entity Q_REG_SP_32_BIT is
	port(
		ENB: in std_logic;
		CLK: in std_logic;
		RST: in std_logic;
		X: in std_logic;
		Y: out std_logic_vector(31 downto 0)
		);
	
end Q_REG_SP_32_BIT;

architecture STRUCT of Q_REG_SP_32_BIT is
	signal T: std_logic_vector(31 downto 0);
	
begin
	process(CLK,RST)
		begin
			if(RST = '1') then
				T <= (others => '0');
			else if(CLK'event and CLK = '1' and ENB = '1') then
					T <= T(30 downto 0) & X;
			end if;
			end if;
	end process;
	Y <= T;
end STRUCT;