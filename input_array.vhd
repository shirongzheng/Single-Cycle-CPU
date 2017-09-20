Library ieee;
Use ieee.std_logic_1164.all;

Entity input_array is
Port (
input_code: in std_logic_vector(31 downto 0);
rs:out std_logic_vector(4 downto 0);
rt:out std_logic_vector(4 downto 0);
rd:out std_logic_vector(4 downto 0);
immediate : out std_logic_vector(15 downto 0);
OpCode : out std_logic_vector(5 downto 0)
);
End input_array; 

Architecture arch of input_array is
begin
	rs<=input_code(25 downto 21);
	rt<=input_code(20 downto 16);
	rd<=input_code(15 downto 11);
	immediate<=input_code(15 downto 0);
	OpCode<=input_code(31 downto 26);
	

End arch;
