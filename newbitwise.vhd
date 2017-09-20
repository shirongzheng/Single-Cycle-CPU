library ieee;
use ieee.std_logic_1164.all;

entity newbitwise is port(
a,b: in std_logic_vector(31 downto 0); 
op_code: in std_logic_vector(5 downto 0);
result: out std_logic_vector(31 downto 0);
add_sub: out std_logic; 
alu_mux: out std_logic 
--branch_eq: out std_logic
);
end newbitwise;

architecture arch of newbitwise is
signal in1, in2, out1: std_logic_vector(31 downto 0);
signal op_immed: std_logic_vector(2 downto 0);
signal i_instruct: std_logic;
begin
		in1 <= a;
		in2 <= b;
		result <= out1;
		op_immed <= op_code(2 downto 0); 
		i_instruct <= '1';
		process( i_instruct ) 
		begin
			case op_immed is when "000" =>
				out1 <= in1 and in2; -- and i 
				alu_mux <= '1';
				--branch_eq <= '0';
			when "001" =>
				out1 <= in1 or in2; -- ori 
				alu_mux <= '1';
				--branch_eq <= '0';
			when "010" =>
				out1 <= in1 xor in2;
				alu_mux <= '1'; 
				--branch_eq <= '0';
			-- xor
			when "011" => -- branch eq 
				--if(not(in1 xor in2) = "11111111111111111111111111111111") then
				--	branch_eq <= '1'; 
				--else
				--	branch_eq <= '0'; 
				--end if;
				alu_mux <= '1';
			when "100" =>
				add_sub <= '1'; -- add 
				alu_mux <= '0'; 
				--branch_eq <= '0';
			when "101" =>
				add_sub <= '0'; -- sub 
				alu_mux <= '0';
				 --branch_eq <= '0';
			when "110" => 
				add_sub <= '1'; -- addi 
				alu_mux <= '0'; 
				--branch_eq <= '0';
			when "111" =>
				add_sub <= '0'; -- subi 
				alu_mux <= '0';
				--branch_eq <= '0';
			when others =>
				 null;
			end case; 
		end process; 
end arch;