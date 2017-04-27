library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Arithmetic_Logic_Unit is
    Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
			  C : in  STD_LOGIC;
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Arithmetic_Logic_Unit;

architecture arq_Arithmetic_Logic_Unit of Arithmetic_Logic_Unit is

begin

	process(Op1, Op2, ALUOP)
	begin
		case ALUOP is
			when "000000" => -- Add
				ALUResult <= Op1 + Op2;
			when "010000" => -- ADDcc
				ALUResult <= Op1 + Op2;
			when "001000" => -- ADDx
				ALUResult <= Op1 + Op2 + C;
			when "000100" => -- Sub
				ALUResult <= Op1 - Op2;
			when "010100" => -- Subcc
				ALUResult <= Op1 - Op2;
			when "000010" => -- OR
				ALUResult <= Op1 or Op2;
			when "010010" => -- ORcc
				ALUResult <= Op1 or Op2;
			when "000110" => -- ORN
				ALUResult <= Op1 or not(Op2);
			when "010110" => -- ORNcc
				ALUResult <= Op1 or not(Op2);
			when "000001" => -- AND
				ALUResult <= Op1 and Op2;
			when "010001" => -- ANDcc
				ALUResult <= Op1 and Op2;
			when "000101" => -- ANDN
				ALUResult <= Op1 and not(Op2);
			when "010101" => -- ANDNcc
				ALUResult <= Op1 and not(Op2);
			when "000011" => -- XOR
				ALUResult <= Op1 xor Op2;
			when "010011" => -- XORcc
				ALUResult <= Op1 xor Op2;
			when "000111" => -- XNOR
				ALUResult <= Op1 xor not(Op2);
			when "010111" => -- XNORcc
				ALUResult <= Op1 xor not(Op2);
			when others =>
				ALUResult <= (others=>'0'); -- NOP
		end case;
	end process;

end arq_Arithmetic_Logic_Unit;