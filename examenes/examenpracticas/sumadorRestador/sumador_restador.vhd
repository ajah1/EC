----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:10 03/09/2016 
-- Design Name: 
-- Module Name:    sumador_restador - Behavioral 
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

entity sumador_restador is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
			  sr: in std_logic);
end sumador_restador;

architecture Behavioral of sumador_restador is
component fullAdder 
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end component;
component pxor
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : out  STD_LOGIC);
end component;

	signal x: std_logic_vector (3 downto 0);
	signal y: std_logic_vector (2 downto 0);
begin
	xor0a: pxor port map (b(0), sr, x(0));
	xor1a: pxor port map (b(1), sr, x(1));
	xor2a: pxor port map (b(2), sr, x(2));
	xor3a: pxor port map (b(3), sr, x(3)); 
	sum0 : fullAdder port map (a(0), x(0), sr, s(0), y(0));
	sum1 : fullAdder port map (a(1), x(1), y(0), s(1), y(1));
	sum2 : fullAdder port map (a(2), x(2), y(1), s(2), y(2));
	sum3 : fullAdder port map (a(3), x(3), y(2), s(3), cout);
end Behavioral;

