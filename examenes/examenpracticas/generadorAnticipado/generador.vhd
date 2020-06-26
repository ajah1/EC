----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:36:44 03/07/2016 
-- Design Name: 
-- Module Name:    generador - Behavioral 
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

entity generador is
    Port ( g : in  STD_LOGIC_VECTOR (3 downto 0);
           p : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           c : out  STD_LOGIC_VECTOR (3 downto 0));
end generador;

architecture Behavioral of generador is
begin
	c(0) <= g(0) or (p(0) and cin);
	c(1) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
	c(2) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
	c(3) <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) 
	or (p(3) and p(2) and p(1) and p(0) and cin);

end Behavioral;

