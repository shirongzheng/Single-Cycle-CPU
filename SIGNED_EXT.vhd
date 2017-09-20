Library ieee;
Use ieee.std_logic_1164.all;

Entity SIGNED_EXT is
Port (
immediate: in std_logic_vector(15 downto 0);
extend_to_32: out std_logic_vector(31 downto 0)
);
End SIGNED_EXT; 

Architecture arch of SIGNED_EXT is
begin
	--process(immediate)
		--begin
		--if(immediate(15)='0') then
			extend_to_32<="0000000000000000" & immediate;
		--else 
			--extend_to_32 <= "1111111111111111" & immediate;
		--end if;
--end process;
end arch;