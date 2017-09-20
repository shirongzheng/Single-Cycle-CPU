library ieee;
use ieee.std_logic_1164.all;

entity IControl is 
port(
op_code: in std_logic_vector(5 downto 0);
immed_bool: out std_logic );
end IControl;

architecture arch of IControl is
signal instruction_type: std_logic_vector(2 downto 0);
signal i_instruct: std_logic;
begin
i_instruct <= '1';
instruction_type <= op_code(2 downto 0);
process( i_instruct )
begin
case instruction_type is
when "000"=>
immed_bool<='1';
when "001" =>
immed_bool <= '1'; 
when "010" =>
immed_bool <= '0'; 
when "011" =>
immed_bool <= '0'; 
when "100" =>
immed_bool <= '0'; 
when "101" =>
immed_bool <= '0';
when "110" =>
immed_bool <= '1';
when "111" =>
immed_bool <= '1';
when others =>
    null;
end case;
end process; 
end arch;