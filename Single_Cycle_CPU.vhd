LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OP_CONTROL IS 
	PORT(		INSTR				: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				TO_ALU		   : OUT STD_LOGIC);
END OP_CONTROL;

ARCHITECTURE STRUCTURE OF OP_CONTROL IS
	SIGNAL OP			: STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL RS			: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL RT			: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL RD			: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL SHAMT	   : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL FUNCT		: STD_LOGIC_VECTOR(5 DOWNTO 0);