----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:17:03 02/14/2016 
-- Design Name: 
-- Module Name:    circuitoDesplazamiento - Behavioral 
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

entity circuitoDesplazamiento is
    Port ( e : in  STD_LOGIC_VECTOR (3 downto 0);
           il : in  STD_LOGIC;
           ir : in  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           h : out  STD_LOGIC_VECTOR (3 downto 0));
end circuitoDesplazamiento;

 
architecture Behavioral of circuitoDesplazamiento is
component mux41
    Port ( e : in  STD_LOGIC_VECTOR (3 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC);
end component;
begin
	mux0: mux41 port map(e(0) => e(0), e(1) => e(1), e(2) => ir, e(3) => '0', c => s, y => h(0));
	mux1: mux41 port map(e(0) => e(1), e(1) => e(2), e(2) => e(0), e(3) => '0',c => s, y => h(1));
	mux2: mux41 port map(e(0) => e(2), e(1) => e(3), e(2) => e(1), e(3) => '0',c => s, y => h(2));
	mux3: mux41 port map(e(0) => e(3), e(1) => il, e(2) => e(2), e(3) => '0',c => s, y => h(3));
end Behavioral;

