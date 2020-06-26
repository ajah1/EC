--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:28:52 03/11/2016
-- Design Name:   
-- Project Name:  examenMaria
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: demultiplexor
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
 
ENTITY test_demux IS
END test_demux;
 
ARCHITECTURE behavior OF test_demux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demultiplexor
    PORT(
         entrada : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         enable : IN  std_logic;
         s0 : OUT  std_logic_vector(3 downto 0);
         s1 : OUT  std_logic_vector(3 downto 0);
         s2 : OUT  std_logic_vector(3 downto 0);
         s3 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');
   signal enable : std_logic := '0';

 	--Outputs
   signal s0 : std_logic_vector(3 downto 0);
   signal s1 : std_logic_vector(3 downto 0);
   signal s2 : std_logic_vector(3 downto 0);
   signal s3 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: demultiplexor PORT MAP (
          entrada => entrada,
          sel => sel,
          enable => enable,
          s0 => s0,
          s1 => s1,
          s2 => s2,
          s3 => s3
        );
			entrada <= "0011",
			"0111" after 100 ns,
			"0000" after 200 ns,
			"1100" after 300 ns, 
			"0111" after 700 ns,
			"0110" after 800 ns,
			"0101" after 900 ns,
			"0100" after 1000 ns;
			sel <= "00",
			"10" after 100 ns,
			"00" after 200 ns,
			"01" after 400 ns,
			"10" after 500 ns,
			"11" after 600 ns,
			"10" after 800 ns,
			"01" after 900 ns,
			"00" after 1000 ns;
			enable <= '0',
			'1' after 200 ns;


END;
