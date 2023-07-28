----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:05:50 08/09/2022 
-- Design Name: 
-- Module Name:    START_COM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity START_COM is
	port(
		RST: in std_logic;
		EOC: in std_logic;
		COM: out std_logic
		);
end START_COM;

architecture STRUCT of START_COM is
	signal T: std_logic;
begin

	process (EOC, RST)
	begin
		if (RST = '1') then
			T <= '0';
		else if (EOC'event and EOC = '1') then
			T <= '1';
		end if;
		end if;
end process;
COM <= T;
end STRUCT;

