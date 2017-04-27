library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador3 is
    Port ( clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador3;

architecture arq_Procesador3 of Procesador3 is

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
		Port ( --clk : in STD_LOGIC;
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
		Port ( --clk : in STD_LOGIC;
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
	
	component Signal_Extend_Unit
		Port ( DataIn : in  STD_LOGIC_VECTOR (12 downto 0);
				 DataOut : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
	end component;
	
	component Multiplexor
		Port ( Data1 : in  STD_LOGIC_VECTOR (31 downto 0);
				 Data2 : in  STD_LOGIC_VECTOR (31 downto 0);
				 Inmediate : in  STD_LOGIC;
				 DataOut : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
	end component;
	
	component Program_State_Register_Modifier
		Port ( ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
             OP1_ALU : in  STD_LOGIC_VECTOR (31 downto 0);
             OP2_ALU : in  STD_LOGIC_VECTOR (31 downto 0);
             Result_ALU : in  STD_LOGIC_VECTOR (31 downto 0);
             NZVC : out  STD_LOGIC_VECTOR (3 downto 0)
				);
	end component;
	
	component Program_State_Register
		Port ( NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
             C : out  STD_LOGIC
			   );
	end component;
	
	component Arithmetic_Logic_Unit
		Port ( Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
             Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
             ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
				 C : in  STD_LOGIC;
             ALUResult : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
	end component;
	
	signal DataBus_nPC_Adder, DataBus_Adder_nPC : std_logic_vector(31 downto 0); -- Señales del Adder y nPC

	signal DataBus_nPC_PC, DataBus_PC_IM : std_logic_vector(31 downto 0); -- Señales PC y nPC
	
	signal DataBus_Instruction : std_logic_vector(31 downto 0); -- Señales Instruction memory
	
	signal DataBus_CU_ALU : std_logic_vector(5 downto 0); -- Señales Control unit
	
	signal DataBus_RF_ALU_CRs1, DataBus_RF_MUX_CRs2 : std_logic_vector(31 downto 0); -- Señales Register File
	
	signal DataBus_SEU_MUX : std_logic_vector(31 downto 0); -- Señales Signal Extend Unit
	
	signal DataBus_MUX_ALU : std_logic_vector(31 downto 0); -- Señales Signal Extend Unit
	
	signal DataBus_NZVC : std_logic_vector(3 downto 0); -- Señales Program State Register Modifier
	
	signal DataBus_C : std_logic; -- Señales Program State Register
	
	signal DataBus_ALUResult : std_logic_vector(31 downto 0); -- Señales ALU
	
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
				--clk => clk,
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
				--clk => clk,
				Rs1 => DataBus_Instruction(18 downto 14),
				Rs2 =>  DataBus_Instruction(4 downto 0),
				Rd =>  DataBus_Instruction(29 downto 25),
				Reset => Reset,
				EnableWriting => '1',
				DWR => DataBus_ALUResult,
				CRs1 => DataBus_RF_ALU_CRs1,
				CRs2 => DataBus_RF_MUX_CRs2
			);
	
	SEU : Signal_Extend_Unit
		Port Map (
				DataIn => DataBus_Instruction(12 downto 0),
				DataOut => DataBus_SEU_MUX
			);
	
	MUX : Multiplexor
		Port Map (
				Data1 => DataBus_RF_MUX_CRs2,
				Data2 => DataBus_SEU_MUX,
				Inmediate => DataBus_Instruction(13),
				DataOut => DataBus_MUX_ALU
			);
	
	PSR_Modifier : Program_State_Register_Modifier
		Port Map (
				ALUOP => DataBus_CU_ALU,
            OP1_ALU => DataBus_RF_ALU_CRs1,
            OP2_ALU => DataBus_MUX_ALU,
            Result_ALU => DataBus_ALUResult,
            NZVC => DataBus_NZVC
			);
	
	PSR : Program_State_Register
		Port Map (
				NZVC => DataBus_NZVC,
            C => DataBus_C
			);
	
	ALU : Arithmetic_Logic_Unit
		Port Map (
				Op1 => DataBus_RF_ALU_CRs1,
				Op2 => DataBus_MUX_ALU,
				ALUOP => DataBus_CU_ALU,
				C => DataBus_C,
				ALUResult => DataBus_ALUResult
			);
	
	Result <= DataBus_ALUResult;

end arq_Procesador3;

