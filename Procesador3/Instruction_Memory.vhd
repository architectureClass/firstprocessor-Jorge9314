library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity Instruction_Memory is
    Port ( --clk : in STD_LOGIC;
			  Address_In : in  STD_LOGIC_VECTOR (31 downto 0); -- Entra la direccion de la instruccion en la memoria --
           Reset : in  STD_LOGIC; -- Cuando vale 1 resetea la instruccion de salida a ceros --
           Instruction_Out : out  STD_LOGIC_VECTOR (31 downto 0)); -- devuelve la instruccion a ejecutar --
end Instruction_Memory;

architecture arq_Instruction_Memory of Instruction_Memory is
	-- rom_type = tipo de memoria --
	type rom_type is array (0 to 31) of std_logic_vector (31 downto 0); -- Es la matriz que almacena 32 instrucciones cada una de 32 bits --
	
	-- Se crea una funcion para cargar un archivo de texto en la memoria --
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName; -- lee el archivo y lo pone en RomFile --
		variable RomFileLine : line; -- Esta variable va a contar el numero de lineas --
		variable temp_bv : bit_vector(31 downto 0); -- Vector temporal --
		variable temp_mem : rom_type; -- Memoria temporal --
		begin
			for I in rom_type'range loop -- Un bucle en todo el rango de la memoria --
				readline (RomFile, RomFileLine); -- Leemos la linea del RomFile en la posicion RomFileLine --
				read(RomFileLine, temp_bv); -- Leemos la instruccion en esa linea y la almacenamos en temp_bv --
				temp_mem(i) := to_stdlogicvector(temp_bv); -- En la posicion i de temp_mem almacenamos el vector temp_bv --
			end loop;
		return temp_mem; -- Despues de copiar todo el archivo devolvemos la memoria ya con las instrucciones en ella --
	end function;
	
	-- Creamos la memoria que va a ser del tipo rom_type --
	signal instructions : rom_type := InitRomFromFile("test_Prueba.data");
	-- y iniciamos la memoria con las instrucciones almacenadas en el archivo Ejemplo: "test.data" --
	
begin

	process(Reset, Address_In, instructions)
	begin
		
		--if rising_edge(clk) then
			if Reset = '1' then
				Instruction_Out <= (others => '0');
			else
				Instruction_Out <= instructions(conv_integer(Address_In(4 downto 0)));
			end if;
		--end if;

	end process;

end arq_Instruction_Memory;

