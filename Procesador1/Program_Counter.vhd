library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Program_Counter is
    Port ( clk : in  STD_LOGIC;
           address_in : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           address_out : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0'));
end Program_Counter;

architecture arq_Program_Counter of Program_Counter is
begin

	process(clk, reset)
	begin
	
		if reset = '1' then
			address_out <= (others=>'0');
		elsif rising_edge(clk) then
			address_out <= address_in;
		end if;
		
	end process;

end arq_Program_Counter;

