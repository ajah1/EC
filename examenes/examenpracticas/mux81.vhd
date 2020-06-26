----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:03:00 03/03/2016 
-- Design Name: 
-- Module Name:    mux81 - Behavioral 
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

entity mux81 is
    Port ( e : in  STD_LOGIC_VECTOR (7 downto 0);
           c : in  STD_LOGIC_VECTOR (2 downto 0);
           y : out  STD_LOGIC);
end mux81;

architecture Behavioral of mux81 is
	component mux41
		 Port ( E : in  STD_LOGIC_VECTOR (3 downto 0);
				  C : in  STD_LOGIC_VECTOR (1 downto 0);
				  Y : out  STD_LOGIC);
	end component;
	signal x : std_logic;
	signal z : std_logic;
begin
	mux0: mux41 port map(E => e(3 downto 0), C => c(1 downto 0), Y => x);
	-- mux0: mux41 port map(E(0) => e(0), E(1) => e(1), E(2) => e(2), E(3) => e(3), C(1) => c(1), C(0) => c(0), Y => x);
	mux1: mux41 port map(E => e(7 downto 4), C => c(1 downto 0), Y => z);
	-- mux1: mux41 port map(E(0)=>e(4), E(1)=>e(5), E(2)=>e(6), E(3)=>e(7), C(1) => c(1), C(0)=>c(0), Y=>z);
	mux2: mux41 port map(E(0)=>x, E(1)=>z, C(1) =>'0', C(0) =>c(2), Y => y);

end Behavioral;

