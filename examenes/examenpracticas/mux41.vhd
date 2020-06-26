----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:45:46 03/03/2016 
-- Design Name: 
-- Module Name:    mux41 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all; 

entity mux41 is
    Port ( E : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out  STD_LOGIC);
end mux41;

architecture Behavioral of mux41 is
	variable pos : Integer;
begin
	process(E, C)
	begin
		pos := to_integer(signed(C));
		Y <= E(pos);
		
--		if C = "00" then
--			Y <= E(0);
--		elsif C = "01" then
--			Y <= E(1);
--		elsif C = "10" then
--			Y <= E(2);
--		else
--			Y <= E(3);
--		end if;
	end process;
end Behavioral;

