--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:35:31 03/30/2017
-- Design Name:   
-- Module Name:   C:/Users/juanz/Google Drive/Semestre 7/Arquitectura de computadoras/Procesador1/TB_Instruction_Memory.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Instruction_Memory
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
 
ENTITY TB_Instruction_Memory IS
END TB_Instruction_Memory;
 
ARCHITECTURE behavior OF TB_Instruction_Memory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Instruction_Memory
    PORT(
         clk : IN  std_logic;
         Address_In : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         Instruction_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Address_In : std_logic_vector(31 downto 0) := (others => '0');
   signal Reset : std_logic := '0';

 	--Outputs
   signal Instruction_Out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Instruction_Memory PORT MAP (
          clk => clk,
          Address_In => Address_In,
          Reset => Reset,
          Instruction_Out => Instruction_Out
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
		Address_In <= "00000000000000000000000000000000";
      wait for 20 ns;
		Address_In <= "00000000000000000000000000000100";
      wait for 20 ns;
		Address_In <= "00000000000000000000000000001000";
      wait for 20 ns;
		Address_In <= "00000000000000000000000000001100";
      wait for 20 ns;
		Address_In <= "00000000000000000000000000111110";
		wait;
   end process;

END;
