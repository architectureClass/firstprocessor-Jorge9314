library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder is
    Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture arq_Adder of Adder is

begin

	process(Op1,Op2)
	begin
	
		Result <= Op1 + Op2;
		
	end process;
	
end arq_Adder;

