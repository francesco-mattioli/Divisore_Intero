library ieee;
use ieee.std_logic_1164.ALL;



entity ADDSUB is
	generic( N: Integer:=32);
	port( 
		OP: in std_logic;
		X: in std_logic_vector(N-1 downto 0);
		Y: in std_logic_vector(N-1 downto 0);
		Z: out std_logic_vector(N-1 downto 0);
		COUT: out std_logic
		);
end ADDSUB;

architecture STRUCT of ADDSUB is
	component FA is 
		port(
			X	:in std_logic;
			Y	:in std_logic;
			CIN	:in std_logic;
			S	:out std_logic;
			COUT	:out std_logic
			);
end component;
			
	signal C: std_logic_vector(N downto 0);
	signal TS: std_logic_vector(N-1 downto 0);
	signal TY: std_logic_vector(N-1 downto 0); --segnale per memorizzare la xor di ogni bit con OP
	

begin
	GEN:for I in 0 to N-1 generate
		TY(I) <= (Y(I) xor OP);
		U: FA 
		port map(
				X => X(I),
				Y => TY(I),
				CIN => C(I),
				S => TS(I),
				COUT => C(I+1)
				);
	end generate;
	C(0) <= OP;
	COUT <= C(N);
	Z <= TS;
	

end STRUCT;