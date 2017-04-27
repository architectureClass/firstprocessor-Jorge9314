Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Program_State_Register_Modifier is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           OP1_ALU : in  STD_LOGIC_VECTOR (31 downto 0);
           OP2_ALU : in  STD_LOGIC_VECTOR (31 downto 0);
           Result_ALU : in  STD_LOGIC_VECTOR (31 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0) := "0000");
end Program_State_Register_Modifier;

architecture arq_Program_State_Register_Modifier of Program_State_Register_Modifier is

begin
	process(ALUOP, OP1_ALU, OP2_ALU, Result_ALU)
	begin
	
		if(ALUOP = "010000") then	-- ADDcc
		
			NZVC(3) <= Result_ALU(31); ---> bit negative
			
			if(Result_ALU = "00000000000000000000000000000000") then
				NZVC(2) <= '1'; ---> bit zero
			else
				NZVC(2) <= '0'; ---> bit zero
			end if;
			
			---> bit Overboard
			NZVC(1) <= ((OP1_ALU(31) and OP2_ALU(31) and (not Result_ALU(31))) or ((OP1_ALU(31)) and (not OP2_ALU(31)) and Result_ALU(31)));
			
			---> bit carry
			NZVC(0) <= ((OP1_ALU(31) and OP2_ALU(31)) or ((not Result_ALU(31)) and (OP1_ALU(31) or OP2_ALU(31))));
			
		else
		
			if(ALUOP = "010100") then	-- SUBcc
				
				NZVC(3) <= Result_ALU(31);
				
				if(Result_ALU = "00000000000000000000000000000000") then -- Los operandos son iguales
					NZVC(2) <= '1';
				else
					NZVC(2) <= '0';
				end if;
				
				---> bit Overboard
				NZVC(1) <= ((OP1_ALU(31) and (not OP2_ALU(31)) and (not Result_ALU(31))) or ((not OP1_ALU(31)) and OP2_ALU(31) and Result_ALU(31)));
				
				---> bit carry
				NZVC(0) <= (OP1_ALU(31) and OP2_ALU(31)) or ((not Result_ALU(31)) and (OP1_ALU(31) or OP2_ALU(31)));
			
			else
				--          ORcc                ORNcc               ANDcc               ANDNcc              XORcc               XORNcc
				if(ALUOP = "010010" or ALUOP = "010110" or ALUOP = "010001" or ALUOP = "010101" or ALUOP = "010011" or ALUOP = "010111") then
				
					NZVC(3) <= Result_ALU(31);
				
					if(Result_ALU = "00000000000000000000000000000000") then -- Los operandos son iguales
						NZVC(2) <= '1';
					else
						NZVC(2) <= '0';
					end if;
					
					---> bit Overboard
					NZVC(1) <= '0';
					
					---> bit carry
					NZVC(0) <= '0';
				
				end if;
				
			end if;
			
		end if;
	
	end process;
end arq_Program_State_Register_Modifier;

