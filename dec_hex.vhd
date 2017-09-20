LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
-- Hexadecimal to 7 segment decoder for LED display

ENTITY dec_to_hex IS
PORT (hex_digit: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
segment : OUT STD_LOGIC_VECTOR (6 downto 0));  -- a downto g
END dec_to_hex;

ARCHITECTURE a OF dec_to_hex IS
SIGNAL segment_data: STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
PROCESS (hex_digit)
BEGIN

CASE hex_digit IS
when "0000" =>
segment_data <= "1111110";
when "0001" =>
segment_data <= "0110000";
when "0010" =>
segment_data <= "1101101";
when "0011" =>
segment_data <= "1111001";
when "0100" =>
segment_data <= "0110011";
when "0101" =>
segment_data <= "1011011";
when "0110" =>
segment_data <= "1011111";
when "0111" =>
segment_data <= "1110000";
when "1000" =>
segment_data <= "1111111";
when "1001" =>
segment_data <= "1110011";
when "1010" =>
segment_data <= "1110111";
when "1011" =>
segment_data <= "0011111";
when "1100" =>
segment_data <= "1001110";
when "1101" =>
segment_data <= "0111101";
when "1110" =>
segment_data <= "1001111";
when "1111" =>
segment_data <= "1000111";
END CASE;
END PROCESS;

segment(6) <= NOT segment_data(6);  -- a
segment(5) <= NOT segment_data(5);	-- b
segment(4) <= NOT segment_data(4);	-- c
segment(3) <= NOT segment_data(3);	-- d
segment(2) <= NOT segment_data(2);	-- e
segment(1) <= NOT segment_data(1);	-- f
segment(0) <= NOT segment_data(0);	-- g
END a;