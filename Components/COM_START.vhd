
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity COM_START is
	port(
		ENB: in std_logic;
		RST: in std_logic;
		CLK: in std_logic;
		START: in std_logic;
		COM: out std_logic
		);
end COM_START;

architecture STRUCT of COM_START is

begin
		
	process(CLK,RST)
		begin
		if (RST = '1') then
			COM <= '0';
		else if (CLK'event and CLK = '1' and ENB = '1') then
				COM <= START;
		end if;
		end if;
	end process;
		
	
end STRUCT;

