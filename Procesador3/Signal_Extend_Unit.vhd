library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Signal_Extend_Unit is
    Port ( DataIn : in  STD_LOGIC_VECTOR (12 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Signal_Extend_Unit;

architecture arq_Signal_Extend_Unit of Signal_Extend_Unit is

begin
	process(DataIn)
	begin
		if(DataIn(12) = '0') then
			DataOut(31 downto 13) <= (others=>'0');
			DataOut(12 downto 0) <= DataIn;
		else
			DataOut(31 downto 13) <= (others=>'1');
			DataOut(12 downto 0) <= DataIn;
		end if;
	end process;
end arq_Signal_Extend_Unit;
