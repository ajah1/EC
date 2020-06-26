----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:37 03/10/2016 
-- Design Name: 
-- Module Name:    demultiplexor - Behavioral 
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

entity demultiplexor is
    Port ( entrada : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           enable : in  STD_LOGIC;
           s0 : out  STD_LOGIC_VECTOR (3 downto 0);
           s1 : out  STD_LOGIC_VECTOR (3 downto 0);
           s2 : out  STD_LOGIC_VECTOR (3 downto 0);
           s3 : out  STD_LOGIC_VECTOR (3 downto 0));
end demultiplexor;

architecture Behavioral of demultiplexor is

begin
	process (entrada, sel, enable)
	begin
		if enable = '0' then
			s0 <= "1111";
			s1 <= "1111";
			s2 <= "1111";
			s3 <= "1111";
		elsif sel = "00" then
			s0 <= entrada;
			s1 <= "0000";
			s2 <= "0000";
			s3 <= "0000";
		elsif sel = "01" then
			s0 <= "0000";
			s1 <= entrada;
			s2 <= "0000";
			s3 <= "0000";
		elsif sel = "10" then
			s0 <= "0000";
			s1 <= "0000";
			s2 <= entrada;
			s3 <= "0000";
		elsif sel = "11" then
			s0 <= "0000";
			s1 <= "0000";
			s2 <= "0000";
			s3 <= entrada;
		end if;
	end process;

end Behavioral;

