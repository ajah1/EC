----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:36:54 02/08/2016 
-- Design Name: 
-- Module Name:    contador - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador is
	generic (nbits:integer := 8);
	port(	clk:in std_logic;
			rst:in std_logic;
			q: inout std_logic_vector(nbits-1 downto 0));
end contador;

architecture Behavioral of contador is
begin
process (clk, rst)
begin
	if rst = '1' then
		q <= (others => '0');
	elsif clk ='1' and clk'event then
		q <= q + '1';
	end if;
end process;

end Behavioral;

