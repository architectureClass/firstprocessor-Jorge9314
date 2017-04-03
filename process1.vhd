library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity process1 is
    Port ( CLK : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end process1;

architecture arq_process1 of process1 is

component ProgramCounter
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0)
  );
end component;


component IM 
    Port ( clk : in STD_LOGIC;
			  Address_In : in  STD_LOGIC_VECTOR (31 downto 0); 
           Reset : in  STD_LOGIC; 
           Instruction_Out : out  STD_LOGIC_VECTOR (31 downto 0)
		  ); 
end component;

component Adder 
    Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0)
		  );
end component;

component CU 
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0)
			);
end component;

component RF 
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
			  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in STD_LOGIC ;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0)
		  );
end component;

component ALU
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0)
		  );
end component;

signal programCounterOut : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal nextprogramCounterOut : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal adderOut : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
signal crs1_aux: STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');			
signal crs2_aux: STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');	
signal aluOut : STD_LOGIC_VECTOR (5 downto 0);

begin

NextProgramCounter : ProgramCounter
    Port map( Data => adderOut,
           rst => rst,
           CLK => clk,
           DataOut => nextprogramCounterOut
  );

Adder0 : Adder 
    Port map( Op1 => x"00000001",
           Op2 => nextprogramCounterOut,
           DataOut => adderOut 
			);

ProgramCounter0 : ProgramCounter
    Port map( Data => nextprogramCounterOut,
           rst => rst,
           CLK => clk,
           DataOut => programCounterOut
  );

InstructionMemory0 : IM
    Port map ( clk => clk,
			  Address_In => programCounterOut, 
           Reset => rst, 
           Instruction_Out => InstructionMemoryOut
		  ); 
 
RegisterFile0 : RF 
    Port map ( rs1 => InstructionMemoryOut(18 downto 14),
           rs2 => InstructionMemoryOut(4 downto 0) ,
           rd => InstructionMemoryOut(29 downto 25),
			  dwr => aluOut,
			  reset => rst,
           crs1 => crs1_aux,
           crs2 => crs2_aux
		  );

 UnidadControl0 : CU 
    Port map( op => InstructionMemoryOut(31 downto 30) ,
           op3 => InstructionMemoryOut(27 downto 19),
           aluop => aluOut
			);

 ALU0	: ALU
    Port map ( crs1 => crs1_aux,
           crs2 => crs2_aux,
           aluop => aluOut,
           DWR => aluOut
		  );

end arq_process1;

