LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_ITYPE IS
	PORT(		SIGNAL SEL			: STD_LOGIC;
				SIGNAL OUTPUT		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				SIGNAL RS_I			: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				SIGNAL RT_I			: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				SIGNAL RD_I			: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				SIGNAL CONVERT_16	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				SIGNAL INSTR_OUT	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
				SIGNAL TO_RS		: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
				SIGNAL TO_RT		: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
				SIGNAL TO_RD		: OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END MUX_ITYPE;

ARCHITECTURE STRUCTURE OF MUX_ITYPE IS
BEGIN 
	PROCESS(SEL, OUTPUT, RS_I, RT_I, RD_I)
	BEGIN
		IF (SEL = '1') THEN 
			TO_RS <= RS_I;
			TO_RT <= RT_I;
			TO_RD <= RD_I;
			INSTR_OUT <= "000000" & RS_I & RT_I & RD_I & "00000000000";
		ELSIF (SEL = '0') THEN
			CONVERT_16 <= OUTPUT(15 DOWNTO 0);
			TO_RS <= OUTPUT(25 DOWNTO 21);
			TO_RT <= OUTPUT(20 DOWNTO 16);
			INSTR_OUT <= OUTPUT(31 DOWNTO 0);
		END IF;
	END PROCESS;
END STRUCTURE;