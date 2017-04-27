library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_File is
    Port ( --clk : in STD_LOGIC;
			  Rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           Reset : in  STD_LOGIC;
			  EnableWriting : in STD_LOGIC;
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0) := (others=>'0')
			  );
end Register_File;

architecture arq_Register_File of Register_File is

	type memory_type is array (0 to 39) of std_logic_vector (31 downto 0);
	
	signal memory : memory_type := (others => (others=>'0'));

begin

	process(Rs1,Rs2,Rd,Reset,EnableWriting,DWR)
	begin
		
		if Reset = '1' then
				memory <= (others => x"00000000");
				CRs1 <= (others=>'0');
				CRs2 <= (others=>'0');
		else
		
			--if(rising_edge(clk)) then
				
				if EnableWriting = '1' then
					memory(conv_integer(Rd)) <= DWR;
				end if;
				
				CRs1 <= memory(conv_integer(Rs1));
				CRs2 <= memory(conv_integer(Rs2));
				
				-- Se debe resetear el valor del registro %g0 por que siempre debe valer ceros --
				memory(0) <= (others => '0');
			--end if;
			
		end if;
		
	end process;

end arq_Register_File;

