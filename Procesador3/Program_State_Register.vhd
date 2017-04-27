library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Program_State_Register is
    Port ( NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC);
end Program_State_Register;

architecture arq_Program_State_Register of Program_State_Register is

signal PSR_Vector : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin

	Process(NZVC)
	begin
	
		PSR_Vector(23 downto 20) <= NZVC;
		C <= PSR_Vector(20);
		
	end process;
	
end arq_Program_State_Register;

