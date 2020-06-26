----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:56:41 02/03/2016 
-- Design Name: 
-- Module Name:    sumador_4bits - circuito 
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


-- SUMADOR 4BITS PRACTICA 1
entity sumador_4bits is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           c0 : in  STD_LOGIC;
           c4 : out  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0));
end sumador_4bits;

architecture circuito of sumador_4bits is

component sumador_completo
	port( x, y, cin: in std_logic;
			sum, cout: out std_logic);
end component;
	
signal c1, c2, c3: std_logic;
	
begin
	sum1: sumador_completo port map (a(0), b(0), c0, s(0), c1);
	sum2: sumador_completo port map (a(1), b(1), c1, s(1), c2);
	sum3: sumador_completo port map (a(2), b(2), c2, s(2), c3);
	sum4: sumador_completo port map (a(3), b(3), c3, s(3), c4);

end circuito;

