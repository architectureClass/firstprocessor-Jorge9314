library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador1 is
    Port ( clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador1;

architecture arq_Procesador1 of Procesador1 is

	component Adder
		Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
             Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
             Result : out  STD_LOGIC_VECTOR (31 downto 0)
				);
	end component;
	
	component Program_Counter
		Port ( clk : in  STD_LOGIC;
             address_in : in  STD_LOGIC_VECTOR (31 downto 0);
             reset : in  STD_LOGIC;
             address_out : out  STD_LOGIC_VECTOR (31 downto 0)
				);
	end component;
	
	component Instruction_Memory
		Port ( clk : in STD_LOGIC;
			    Address_In : in  STD_LOGIC_VECTOR (31 downto 0);
             Reset : in  STD_LOGIC;
			    Instruction_Out : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
	end component;
	
	component Control_Unit
		Port ( Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
				 Op : in  STD_LOGIC_VECTOR (1 downto 0);
             ALUOP : out  STD_LOGIC_VECTOR (5 downto 0)
			  );
	end component;
	
	component Register_File
		Port ( clk : in STD_LOGIC;
			    Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
             Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
             Rd : in  STD_LOGIC_VECTOR (4 downto 0);
             Reset : in  STD_LOGIC;
			    EnableWriting : in STD_LOGIC;
             DWR : in  STD_LOGIC_VECTOR (31 downto 0);
             CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
             CRs2 : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
	end component;
	
	component Arithmetic_Logic_Unit
		Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
             Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
             ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
             ALUResult : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
	end component;
	
	signal DataBus_nPC_Adder, DataBus_Adder_nPC : std_logic_vector(31 downto 0); -- Se�ales del Adder y nPC

	signal DataBus_nPC_PC, DataBus_PC_IM : std_logic_vector(31 downto 0); -- Se�ales PC y nPC
	
	signal DataBus_Instruction : std_logic_vector(31 downto 0); -- Se�ales Instruction memory
	
	signal DataBus_CU_ALU : std_logic_vector(5 downto 0); -- Se�ales Control unit
	signal DataBus_RF_ALU_CRs1, DataBus_RF_ALU_CRs2 : std_logic_vector(31 downto 0); -- Se�ales Control unit
	
	signal DataBus_ALUResult : std_logic_vector(31 downto 0); -- Se�ales ALU
	
begin

	add : Adder
		Port Map (
				Op1 => "00000000000000000000000000000001",
				Op2 => DataBus_nPC_Adder,
				Result => DataBus_Adder_nPC
			);
			
	PC : Program_Counter
		Port Map (
				clk => clk,
				address_in => DataBus_nPC_PC,
				reset => Reset,
				address_out => DataBus_PC_IM
			);
	
	nPC : Program_Counter
		Port Map (
				clk => clk,
				address_in => DataBus_Adder_nPC,
				reset => Reset,
				address_out => DataBus_nPC_PC
			);
	DataBus_nPC_Adder <= DataBus_nPC_PC;
	
	IM : Instruction_Memory
		Port Map (
				clk => clk,
				Address_In => DataBus_PC_IM,
				Reset => Reset,
				Instruction_Out => DataBus_Instruction
			);
	
	CU : Control_Unit
		Port Map (
				Op3 => DataBus_Instruction(24 downto 19),
				Op => DataBus_Instruction(31 downto 30),
				ALUOP => DataBus_CU_ALU
			);
	
	RF : Register_File
		Port Map (
				clk => clk,
				Rs1 => DataBus_Instruction(18 downto 14),
				Rs2 =>  DataBus_Instruction(4 downto 0),
				Rd =>  DataBus_Instruction(29 downto 25),
				Reset => Reset,
				EnableWriting => '1',
				DWR => DataBus_ALUResult,
				CRs1 => DataBus_RF_ALU_CRs1,
				CRs2 => DataBus_RF_ALU_CRs2
			);
	
	ALU : Arithmetic_Logic_Unit
		Port Map (
				Op1 => DataBus_RF_ALU_CRs1,
				Op2 => DataBus_RF_ALU_CRs2,
				ALUOP => DataBus_CU_ALU,
				ALUResult => DataBus_ALUResult
			);
	
	Result <= DataBus_ALUResult;

end arq_Procesador1;

