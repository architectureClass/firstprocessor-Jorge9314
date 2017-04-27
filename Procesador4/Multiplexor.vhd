library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Multiplexor is
    Port ( Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Inmediate : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Multiplexor;

architecture arq_Multiplexor of Multiplexor is

begin
	process(Data1, Data2, Inmediate)
	begin
			if(Inmediate = '0') then
				DataOut <= Data1;
			else
				DataOut <= Data2;
			end if;
	end process;

end arq_Multiplexor;

