--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:25:43 03/29/2017
-- Design Name:   
-- Module Name:   C:/Users/juanz/Google Drive/Semestre 7/Arquitectura de computadoras/Procesador1/TB_Control_Unit.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control_Unit
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
 
ENTITY TB_Control_Unit IS
END TB_Control_Unit;
 
ARCHITECTURE behavior OF TB_Control_Unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control_Unit
    PORT(
         Op3 : IN  std_logic_vector(5 downto 0);
         Op : IN  std_logic_vector(1 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal Op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal ALUOP : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control_Unit PORT MAP (
          Op3 => Op3,
          Op => Op,
          ALUOP => ALUOP
        );
 

   -- Stimulus process
   stim_proc: process
   begin
      Op <= "00";
		Op3 <= "000000";
      wait for 10 ns;
		Op <= "00";
		Op3 <= "000001";
      wait for 10 ns;
		Op <= "01";
		Op3 <= "000000";
      wait for 10 ns;
		Op <= "01";
		Op3 <= "000001";
      wait for 10 ns;
		Op <= "11";
		Op3 <= "000000";
      wait for 10 ns;
		Op <= "11";
		Op3 <= "000001";
      wait for 10 ns;
		Op <= "10";
		Op3 <= "000001";
      wait for 10 ns;
		Op <= "10";
		Op3 <= "000100";
      wait for 10 ns;
		Op <= "10";
		Op3 <= "000000";
      wait for 10 ns;



      -- insert stimulus here 

      wait;
   end process;

END;
