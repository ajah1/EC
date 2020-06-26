----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:52 03/07/2016 
-- Design Name: 
-- Module Name:    sumadorCompleto - Behavioral 
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

entity sumadorCompleto is
    Port ( ai : in  STD_LOGIC;
           bi : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
			  pi: out STD_LOGIC;
			  gi: out STD_LOGIC);
end sumadorCompleto;

architecture Behavioral of sumadorCompleto is
begin
	s <= ai xor bi xor cin;
	pi <= ai or bi;
	gi <= ai and bi;
end Behavioral;

