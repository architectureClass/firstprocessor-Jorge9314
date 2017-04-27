LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY procesador_Tb IS
END procesador_Tb;
 
ARCHITECTURE behavior OF procesador_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador2
    PORT(
         clk : IN  std_logic;
         Reset : IN  std_logic;
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador2 PORT MAP (
          clk => clk,
          Reset => Reset,
          Result => Result
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait;
   end process;

END;
