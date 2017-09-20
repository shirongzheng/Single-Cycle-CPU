LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registers_32bit IS
	PORT(		Data_In			: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
				write_en			: IN STD_LOGIC;
				clock				: IN STD_LOGIC;
				Data_Out			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END registers_32bit;

ARCHITECTURE Structure OF registers_32bit IS

BEGIN
    process(clock)
    begin
        if RISING_EDGE(clock) then
            if write_en = '1' then
                Data_Out <= Data_In;
            end if;
        end if;
    end process;
END Structure;