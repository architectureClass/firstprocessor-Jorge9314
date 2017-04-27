--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:17:30 03/29/2017
-- Design Name:   
-- Module Name:   C:/Users/juanz/Google Drive/Semestre 7/Arquitectura de computadoras/Procesador1/TB_Program_Counter.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Program_Counter
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
 
ENTITY TB_Program_Counter IS
END TB_Program_Counter;
 
ARCHITECTURE behavior OF TB_Program_Counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Program_Counter
    PORT(
         clk : IN  std_logic;
         address_in : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         address_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal address_in : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal address_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Program_Counter PORT MAP (
          clk => clk,
          address_in => address_in,
          reset => reset,
          address_out => address_out
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
		address_in <= "00000000000000000000000000000100";
		wait for 15 ns;
		
		address_in <= "00000000000000000100100000000000";
		wait for 20 ns;
		
		address_in <= "00000000000000000000000000010000";
		wait for 20 ns;
		
		address_in <= "00000000000000000000000000000010";
		wait for 20 ns;
		
		address_in <= "11100000000000000000000000000100";
		wait for 15 ns;
		
		address_in <= "11100000000000000100100000000000";
		wait for 20 ns;
		
		address_in <= "11100000000000000000000000010000";
		wait for 20 ns;
		
		address_in <= "11100000000000000000000000000010";
		wait for 20 ns;

      wait;
   end process;

END;
