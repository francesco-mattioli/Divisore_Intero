library ieee;
use ieee.std_logic_1164.all;

entity SHIFTER is
	port(
		X : in std_logic_vector(31 downto 0);
		B : in std_logic;
		Y : out std_logic_vector(31 downto 0)
		);
		
end SHIFTER;

architecture STRUCT of SHIFTER is
	begin
		Y <= X(30 downto 0) & B;

end STRUCT;