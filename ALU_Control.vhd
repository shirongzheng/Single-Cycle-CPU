LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ALU_Control IS
	PORT(		INPUT			: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				WHICH_BYTE	: IN STD_LOGIC:='0';
				OP				: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
				RS				: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
				RT				: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
				RD				: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
				SHAMT			: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
				FUNCTIONS	: OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
				IMMEDIATE	: OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END ALU_Control;

ARCHITECTURE Structure OF ALU_Control IS	
BEGIN
		PROCESS (WHICH_BYTE) --WHICH_BYTE's process
		BEGIN
			IF (WHICH_BYTE = '0') THEN
				OP <= INPUT(31 DOWNTO 26);
				RS <= INPUT(25 DOWNTO 21);
				RT <= INPUT(20 DOWNTO 16);
				RD <= INPUT(15 DOWNTO 11);
				SHAMT <= INPUT(10 DOWNTO 6);
				FUNCTIONS <= INPUT(5 DOWNTO 0);
			ELSE
				OP <= INPUT(31 DOWNTO 26);
				RS <= INPUT(25 DOWNTO 21);
				RT <= INPUT(20 DOWNTO 16);
				IMMEDIATE <= INPUT(15 DOWNTO 0);
			END IF;
		END PROCESS;
END Structure;		
		
				