----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:49 03/07/2016 
-- Design Name: 
-- Module Name:    cla4bits - Behavioral 
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

entity cla4bits is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end cla4bits;

architecture Behavioral of cla4bits is
component sumadorCompleto
    Port ( ai : in  STD_LOGIC;
           bi : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
			  pi: out STD_LOGIC;
			  gi: out STD_LOGIC);
end component;
component generador
    Port ( g : in  STD_LOGIC_VECTOR (3 downto 0);
           p : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           c : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
signal px : std_logic_vector (3 downto 0);
signal gx : std_logic_vector (3 downto 0);
signal cx : std_logic_vector (3 downto 0);
begin
	sum1:	sumadorCompleto port map (ai => a(0), bi => b(0), cin => cx(0), s => s(0), pi => px(0), gi => gx(0));
	sum2: sumadorCompleto port map (a(1), b(1), cx(1), s(1), px(1), gx(1));
	sum3: sumadorCompleto port map (a(2), b(2), cx(2), s(2), px(2), gx(2));
	sum4: sumadorCompleto port map (a(3), b(3), cx(3), s(3), px(3), gx(3));
	gen: generador port map (g => gx, p => px, cin => cin, c => cx);
end Behavioral;


