LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ZERO_EXTENSION IS
	PORT(		DATA		: BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
				DIN		: IN STD_LOGIC_VECTOR(15 DOWNTO 0));
END ZERO_EXTENSION;

ARCHITECTURE Structure OF ZERO_EXTENSION IS
BEGIN
	DATA(31 DOWNTO 16) <= "0000000000000000";
	DATA(15 DOWNTO 0) <= DIN;
END Structure;
