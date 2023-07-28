library ieee;
use ieee.std_logic_1164.all;


entity COUNTER_5_BIT is
	port(
		ENB: in std_logic;
		CLK: in std_logic;
		RST: in std_logic;
		--ZC: out std_logic_vector(4 downto 0);
		ENDC: out std_logic
		);
	
end COUNTER_5_BIT;

architecture STRUCT of COUNTER_5_BIT is
	component ADDSUB is 
		generic (N: Integer:=5);
		port(
			OP: in std_logic;
			X: in std_logic_vector(N-1 downto 0);
			Y: in std_logic_vector(N-1 downto 0);
			Z: out std_logic_vector(N-1 downto 0);
			COUT: out std_logic
		);
	end component;
	
	signal TX:std_logic_vector(4 downto 0);
	signal TZ: std_logic_vector(4 downto 0);
	signal TNUM: std_logic_vector(4 downto 0);
	signal TENDC: std_logic;
	
begin

	U: ADDSUB
	
		port map(
			OP => '0',
			X => TX,
			Y => "00001",
			Z => TZ
			);
			
	process(CLK)
	begin 	
		if (CLK'event and CLK = '1') then
			if (RST = '1') then
				TNUM <= "00000";
				TENDC <= '0';
			else if (ENB = '1') then
				if(TNUM = "11111") then
					TENDC <= '1';
				else
					TNUM <= TZ;
				end if;
			end if;
			end if;
		end if;
		TX <= TNUM;
	end process;
	--ZC <= TNUM;
	ENDC <= TENDC;
end STRUCT;