LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY WRITE_TO_BYTE IS
	PORT(		REG_DATA				: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				DIN					: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				CHOOSE_BYTE			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				CLOCK					: IN STD_LOGIC;
				RESULT				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END WRITE_TO_BYTE;

ARCHITECTURE STRUCTURE OF WRITE_TO_BYTE IS
BEGIN
	PROCESS(CLOCK)
		VARIABLE CONTENTS		: STD_LOGIC_VECTOR(31 DOWNTO 0);
		VARIABLE WRITE_WORD	: STD_LOGIC_VECTOR(31 DOWNTO 0);
		 BEGIN 
			IF (RISING_EDGE(CLOCK)) THEN 
				CONTENTS:= REG_DATA;
				WRITE_WORD:= "00000000000000000000000000000000";
				CASE CHOOSE_BYTE IS
					WHEN "00" =>
					--WRITE TO BYTE1
					FOR I IN 0 TO 7 LOOP WRITE_WORD(I):= DIN(I);
												CONTENTS(I):='0';
					END LOOP;
					RESULT <= CONTENTS OR WRITE_WORD;
					
					WHEN "01" =>
					--WRITE TO BYTE2
					FOR I IN 8 TO 15 LOOP WRITE_WORD(I):= DIN(I-8);
												CONTENTS(I):='0';
					END LOOP;
					RESULT <= CONTENTS OR WRITE_WORD;
					
					WHEN "10" =>
					--WRITE TO BYTE3
					FOR I IN 16 TO 23 LOOP WRITE_WORD(I):= DIN(I-16);
												CONTENTS(I):='0';
					END LOOP;
					RESULT <= CONTENTS OR WRITE_WORD;
					
					WHEN "11" =>
					--WRITE TO BYTE4
					FOR I IN 24 TO 31 LOOP WRITE_WORD(I):= DIN(I-24);
												CONTENTS(I):='0';
					END LOOP;
					RESULT <= CONTENTS OR WRITE_WORD;
					
					WHEN OTHERS => NULL;
				END CASE;
			END IF;
		END PROCESS;
END STRUCTURE;