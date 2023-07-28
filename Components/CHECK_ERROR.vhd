
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CHECK_ERROR is
	port(
		ENB: in std_logic;
		CLK: in std_logic;
		RST: in std_logic;
		D: in std_logic_vector (31 downto 0);
		ERROR: out std_logic
		);
end CHECK_ERROR;

architecture STRUCT of CHECK_ERROR is

begin
	process(CLK)
		begin
			if (CLK'event and CLK = '1') then
				if (RST = '1') then
					ERROR <= '0';
				else if (ENB = '1') then
					if (D = "00000000000000000000000000000000") then
						ERROR <= '1';
					else 
						ERROR <= '0';	
					end if;
				end if;
				end if;
			end if;
	end process;
				

end STRUCT;

