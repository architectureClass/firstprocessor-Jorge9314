library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture arq_ALU of ALU is

begin
	process (crs1, crs2, aluop) 
	begin
		case aluop is
			when "000000" => -- Add
				DWR <= Op1 + Op2;
			when "000100" => -- Sub
				DWR <= Op1 - Op2;
			when "000010" => -- OR
				DWR <= Op1 or Op2;
			when "000110" => -- ORN
				DWR <= Op1 or not(Op2);
			when "000001" => -- AND
				DWR <= Op1 and Op2;
			when "000101" => -- ANDN
				DWR <= Op1 and not(Op2);
			when "000011" => -- XOR
				DWR <= Op1 xor Op2;
			when "000111" => -- XNOR
				DWR <= Op1 xor not(Op2);
			when others =>
		end case;
	end process;
end arq_ALU;

