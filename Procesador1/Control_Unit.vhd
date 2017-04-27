library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Control_Unit is
    Port ( Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0) := (others=>'0')
			  );
end Control_Unit;

architecture arq_Control_Unit of Control_Unit is

begin
	
	process(Op3,Op)
	begin
		case Op is
			when "00" => -- Branch or SETHI
				
			when "01" => -- CALL
			
			when "10" => -- Arithmetic Logic or Access memory
				case Op3 is
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

end arq_Control_Unit;

