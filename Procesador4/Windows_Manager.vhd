library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Windows_Manager is
    Port (
			  Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  CWP : in STD_LOGIC_VECTOR (4 downto 0); -- Current Windows Pointer
			  Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
			  nCWP : out STD_LOGIC_VECTOR (4 downto 0);
			  nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRd : out  STD_LOGIC_VECTOR (5 downto 0)
			  );
end Windows_Manager;

architecture arq_Windows_Manager of Windows_Manager is

begin

	process(Rs1, Rs2, Rd, CWP, Op3, Op)
	begin
		
		if(Op = "10") then
			if(Op3 = "111100") then -- SAVE
				if(CWP = "00000") then
					nCWP <= "00001"; -- Como solo vamos a manejar dos ventanas entonces al dar la vuelta vuelve a la ventana 1
				else
					nCWP <= CWP - 1;
				end if;
			else
				if(Op3 = "111101") then -- RESTORE
					if(CWP = "00001") then
						nCWP <= "00000"; -- Como solo vamos a manejar dos ventanas entonces al dar la vuelta vuelve a la ventana 0
					else
						nCWP <= CWP + 1;
					end if;
				end if;
			end if;
		end if;
		
		--         24                 31
		if(Rs1 >= "11000" and Rs1 <= "11111") then -- Registros de Entrada
			nRs1 <= Rs1 - (conv_integer(CWP)*16);
		else
			--         16                 23
			if(Rs1 >= "11000" and Rs1 <= "11111") then -- Registros Locales
				nRs1 <= Rs1 + (conv_integer(CWP)*16);
			else
				--         28                 15
				if(Rs1 >= "11000" and Rs1 <= "11111") then -- Registros de Salida
					nRs1 <= Rs1 + (conv_integer(CWP)*16);
				else
					nRs1(5) <= '0';
					nRs1(4 downto 0) <= Rs1; -- Registros Globales
				end if;
			end if;
		end if;
		
		--         24                 31
		if(Rs2 >= "11000" and Rs2 <= "11111") then -- Registros de Entrada
			nRs2 <= Rs2 - (conv_integer(CWP)*16);
		else
			--         16                 23
			if(Rs2 >= "11000" and Rs2 <= "11111") then -- Registros Locales
				nRs2 <= Rs2 + (conv_integer(CWP)*16);
			else
				--         28                 15
				if(Rs2 >= "11000" and Rs2 <= "11111") then -- Registros de Salida
					nRs2 <= Rs2 + (conv_integer(CWP)*16);
				else
					nRs2(5) <= '0';
					nRs2(4 downto 0) <= Rs2; -- Registros Globales
				end if;
			end if;
		end if;
		
		--         24                 31
		if(Rd >= "11000" and Rd <= "11111") then -- Registros de Entrada
			nRd <= Rd - (conv_integer(CWP)*16);
		else
			--         16                 23
			if(Rd >= "11000" and Rd <= "11111") then -- Registros Locales
				nRd <= Rd + (conv_integer(CWP)*16);
			else
				--         28                 15
				if(Rd >= "11000" and Rd <= "11111") then -- Registros de Salida
					nRd <= Rd + (conv_integer(CWP)*16);
				else
					nRd(5) <= '0';
					nRd(4 downto 0) <= Rd; -- Registros Globales
				end if;
			end if;
		end if;

	end process;

end arq_Windows_Manager;

