library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture arq_CU of CU is

begin
	process (op, op3) 
		begin 
			case op is
				when "00" => -- Sethi or Branch
				when "01" => -- CALL
				when "10" => 
				case op3 is 
					when "000000" => -- ADD
						ALUOP <= "000000";
					when "000100" => -- SUB
						ALUOP <= "000100";
					when "000010" => -- OR
						ALUOP <= "000010";
					when "000110" => -- ORN
						ALUOP <= "000110";
					when "000001" => -- AND
						ALUOP <= "000001";
					when "000101" => -- ANDN
						ALUOP <= "000101";
					when "000011" => -- XOR
						ALUOP <= "000011";
					when "000111" => -- XNOR
						ALUOP <= "000111";
					when others => -- NOP
				end case;
				when others => -- Arithmetic Logic or Access memory
			end case;
	end process;
end arq_CU;

