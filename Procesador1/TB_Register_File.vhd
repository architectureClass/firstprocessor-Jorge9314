--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:53:09 03/29/2017
-- Design Name:   
-- Module Name:   C:/Users/juanz/Google Drive/Semestre 7/Arquitectura de computadoras/Procesador1/TB_Register_File.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Register_File IS
END TB_Register_File;
 
ARCHITECTURE behavior OF TB_Register_File IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         clk : IN  std_logic;
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Reset : IN  std_logic;
         EnableWriting : IN  std_logic;
         DWR : IN  std_logic_vector(31 downto 0);
         CRs1 : OUT  std_logic_vector(31 downto 0);
         CRs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal EnableWriting : std_logic := '0';
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CRs1 : std_logic_vector(31 downto 0);
   signal CRs2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          clk => clk,
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Reset => Reset,
          EnableWriting => EnableWriting,
          DWR => DWR,
          CRs1 => CRs1,
          CRs2 => CRs2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Rs1 <= "00000";
		Rs2 <= "00001";
		Rd <= "00000";
		Reset <= '0';
		EnableWriting <= '0';
		DWR <= "11111111111111111111111111111111";
      wait for 100 ns;
		
		Rs1 <= "00000";
		Rs2 <= "00001";
		Rd <= "00000";
		Reset <= '0';
		EnableWriting <= '1';
		DWR <= "11111111111111111111111111111111";
      wait for 20 ns;
		
		Rs1 <= "00000";
		Rs2 <= "00001";
		Rd <= "00000";
		Reset <= '0';
		EnableWriting <= '0';
		DWR <= "11111111111111111111111111111111";
      wait for 100 ns;
		
		Rs1 <= "00001";
		Rs2 <= "00010";
		Rd <= "00001";
		Reset <= '0';
		EnableWriting <= '1';
		DWR <= "11111111111111111111111111111111";
      wait for 20 ns;
		
		Rs1 <= "00001";
		Rs2 <= "00010";
		Rd <= "00010";
		Reset <= '0';
		EnableWriting <= '1';
		DWR <= "11111111111111111111111111111111";
      wait for 20 ns;
		
		Rs1 <= "00001";
		Rs2 <= "00010";
		Rd <= "00010";
		Reset <= '0';
		EnableWriting <= '0';
		DWR <= "11111111111111111111111111111111";
      wait for 100 ns;
		
		Rs1 <= "00001";
		Rs2 <= "00010";
		Rd <= "00010";
		Reset <= '1';
		EnableWriting <= '0';
		DWR <= "11111111111111111111111111111111";
      wait for 20 ns;
		
		Rs1 <= "00001";
		Rs2 <= "00010";
		Rd <= "00010";
		Reset <= '0';
		EnableWriting <= '0';
		DWR <= "11111111111111111111111111111111";
      wait for 100 ns;

      wait;
   end process;

END;
