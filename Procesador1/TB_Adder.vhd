--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:01:19 03/29/2017
-- Design Name:   
-- Module Name:   C:/Users/juanz/Google Drive/Semestre 7/Arquitectura de computadoras/Procesador1/TB_Adder.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Adder
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
 
ENTITY TB_Adder IS
END TB_Adder;
 
ARCHITECTURE behavior OF TB_Adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         Op1 : IN  std_logic_vector(31 downto 0);
         Op2 : IN  std_logic_vector(31 downto 0);
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Op2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          Op1 => Op1,
          Op2 => Op2,
          Result => Result
        );

   -- Stimulus process
   stim_proc: process
   begin
      Op1 <= "00000000000000000000000000000000";
		Op2 <= "00000000000000000000000000000000";
      wait for 10 ns;
		
		Op1 <= "00000000000000000000000000000001"; -- 1
		Op2 <= "00000000000000000000000000000001"; -- 1
      wait for 10 ns;
		
		Op1 <= "10000000000000000000000000000000";
		Op2 <= "10000000000000000000000000000000";
      wait for 10 ns;
		
		Op1 <= "00000000000000000000000000111111";
		Op2 <= "00000000000000000000000000000000";
      wait for 10 ns;
   end process;

END;
