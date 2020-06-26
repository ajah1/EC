----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:23:09 03/03/2016 
-- Design Name: 
-- Module Name:    deco38 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity deco38 is
    Port ( E : in  STD_LOGIC_VECTOR (2 downto 0);
           enable : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end deco38;

architecture Behavioral of deco38 is
	variable temp : std_logic(7 downto 0);
	variable pos : integer;
begin
	process (E, enable)
	begin
		if enable = '0' then
			temp <= "ZZZZZZZZ";
		elsif E = "000" then
			pos := to_integer(signed(E));
			temp <= "00000000"
			temp(pos) := '1';
		end if;
		S <= temp;
	end process;
end Behavioral;

