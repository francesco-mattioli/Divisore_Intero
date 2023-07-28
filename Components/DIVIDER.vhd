library ieee;
use ieee.std_logic_1164.all;


entity DIVIDER is
	port(
		RST: in std_logic;
		CLK: in std_logic;
		NUM: in std_logic_vector(31 downto 0);
		D: in std_logic_vector(31 downto 0);
		START: in std_logic; -- start signal
		EOC: out std_logic; --end of computation signal 
		ERROR: out std_logic; -- error signal when D = 0
		Q: out std_logic_vector(31 downto 0);
		R:  out std_logic_vector(31 downto 0)
		);
end DIVIDER;

architecture STRUCT of DIVIDER is
	component N_REG_PS_32_BIT is
		port(
			ENB: in std_logic;
			CLK: in std_logic;
			RST: in std_logic;
			LOAD: in std_logic;
			X: in std_logic_vector(31 downto 0);
			Y: out std_logic
			);
	end component;
	
	component R_REG_PP_32_BIT is
		port(
			ENB: in std_logic;
			CLK: in std_logic;
			RST: in std_logic;
			X: in std_logic_vector(31 downto 0);
			Y: out std_logic_vector(31 downto 0)
			);
	end component;
	

	component Q_REG_SP_32_BIT is
		port(
			ENB: in std_logic;
			CLK: in std_logic;
			RST: in std_logic;
			X: in std_logic;
			Y: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component COUNTER_5_BIT is
		port(
			CLK: in std_logic;
			RST: in std_logic;
			ENB: in std_logic;
			--ZC: out std_logic_vector(4 downto 0);
			ENDC: out std_logic
		);
	end component;
	
	component ADDSUB is
		generic(N: Integer:=32);
	port( 
		OP: in std_logic;
		X: in std_logic_vector(N-1 downto 0);
		Y: in std_logic_vector(N-1 downto 0);
		Z: out std_logic_vector(N-1 downto 0);
		COUT: out std_logic
		);
	end component;
	
	component SHIFTER is
		port(
			X : in std_logic_vector(31 downto 0);
			B : in std_logic;
			Y : out std_logic_vector(31 downto 0)
			);
		end component;
		
	component CHECK_ERROR is
		port(
			ENB: in std_logic;
			CLK: in std_logic;
			RST: in std_logic;
			D: in std_logic_vector (31 downto 0);
			ERROR: out std_logic
		);
	end component;
	
	component COM_START is
		port(
			ENB: in std_logic;
			RST: in std_logic;
			CLK: in std_logic;
			START: in std_logic;
			COM: out std_logic
			);
	end component;
	
			
		
	signal TY_REG_N: std_logic;
	signal TY_REG_D: std_logic_vector(31 downto 0);
	signal TY_REG_R: std_logic_vector(31 downto 0);
	signal TY_REG_Q: std_logic_vector(31 downto 0);
	signal TY_MUX: std_logic_vector(31 downto 0);
	signal TY_SHIFT: std_logic_vector(31 downto 0);
	signal TZ_ADDSUB: std_logic_vector(31 downto 0);
	--signal TZ_COUNT: std_logic_vector(4 downto 0);
	signal TCOUT: std_logic;
	signal TEOC: std_logic;
	signal TERROR: std_logic;
	signal TRST: std_logic;
	signal N_ENB: std_logic;
	signal R_Q_COUNT_ERR_ENB: std_logic;
	signal IN_START: std_logic;
	signal N_D_COM_ERR_COUNT_RST: std_logic;


		
		
begin
	
	TY_MUX <= TZ_ADDSUB when TCOUT = '1' else
				 TY_SHIFT;
	
	TRST <= RST or START;
	
	N_ENB <= START or IN_START;
	
	R_Q_COUNT_ERR_ENB <= IN_START and (not START);
	
	
	N_D_COM_ERR_COUNT_RST <= RST or TEOC;
	
	
	REG_N: N_REG_PS_32_BIT
		port map(
			ENB => N_ENB,
			CLK => CLK,
			RST => N_D_COM_ERR_COUNT_RST,
			LOAD => START,
			X => NUM,
			Y => TY_REG_N
			);
			
	REG_D: R_REG_PP_32_BIT
		port map(
			ENB => START,
			CLK => CLK,
			RST => N_D_COM_ERR_COUNT_RST,
			X => D,
			Y => TY_REG_D
			);
		
	REG_R: R_REG_PP_32_BIT
		port map(
			ENB => R_Q_COUNT_ERR_ENB,
			CLK => CLK,
			RST => TRST,
			X => TY_MUX,
			Y => TY_REG_R
			);
			
	REG_Q: Q_REG_SP_32_BIT
		port map(
			ENB => R_Q_COUNT_ERR_ENB,
			CLK => CLK,
			RST => TRST,
			X => TCOUT,
			Y => TY_REG_Q
			);
			
	SUB: ADDSUB
		port map(
			X => TY_SHIFT,
			Y => TY_REG_D,
			Z => TZ_ADDSUB,
			OP => '1',
			COUT => TCOUT
		);
			
	SHIFT: SHIFTER
		port map(
			X => TY_REG_R,
			B => TY_REG_N,
			Y => TY_SHIFT
		);
		
	COUNT: COUNTER_5_BIT
		port map(
			--ZC => TZ_COUNT,
			CLK => CLK,
			RST => N_D_COM_ERR_COUNT_RST,
			ENDC => TEOC,
			ENB => R_Q_COUNT_ERR_ENB
		);
		
	CHECK: CHECK_ERROR
		port map(
			ENB => R_Q_COUNT_ERR_ENB,
			CLK => CLK,
			RST => N_D_COM_ERR_COUNT_RST,
			D => TY_REG_D,
			ERROR => TERROR
		);
		
	COMMUT: COM_START
		port map(
			ENB => START,
			START => START,
			CLK => CLK,
			RST => N_D_COM_ERR_COUNT_RST,
			COM => IN_START
		);
		

	Q <= TY_REG_Q;
	R <= TY_REG_R;
	EOC <= TEOC;
	ERROR <= TERROR;

end STRUCT;
