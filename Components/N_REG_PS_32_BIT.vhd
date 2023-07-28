library ieee;
use ieee.std_logic_1164.all;


entity N_REG_PS_32_BIT is
	port(
		CLK: in std_logic;
		RST: in std_logic;
		LOAD: in std_logic;
		ENB: in std_logic;
		X: in std_logic_vector(31 downto 0);
		Y: out std_logic
		);

end N_REG_PS_32_BIT;

architecture STRUCT of N_REG_PS_32_BIT is
	signal T: std_logic_vector(31 downto 0);
	signal Z: std_logic_vector(31 downto 0);

begin
		--mux
		T <= X when LOAD = '1' else
				Z(30 downto 0) & '0';
				
		REG_PS :process (CLK,RST)
		begin 
			if(RST = '1') then 
				Z <= (others => '0');
			else if(CLK'event and CLK = '1' and ENB = '1') then 
					Z <= T;	
			end if;
			end if;
		end process;
		Y <= Z(31);
	
end STRUCT;