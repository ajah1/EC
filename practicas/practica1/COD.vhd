----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:40:38 05/01/2015 
-- Design Name: 
-- Module Name:    COD - Behavioral 
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

entity COD is
    Port ( enable : in  STD_LOGIC;
           E : in  STD_LOGIC_VECTOR (9 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end COD;

architecture Behavioral of COD is
begin
	-- habilitacion activa por 1, entradas activas por 0
	-- prioritario (9 es mas prioritaria), es decir, si esta activa
	-- la 9 da igual lo que valgan los demas que sacamos 9 = 1001
	-- Como los when se comprueba de arriba abajo, se queda con el primer 
	-- caso que entra.
	S <= "ZZZZ" when enable = '0' else
		"1001" when E(9) = '0' else
		"1000" when E(8) = '0' else
		"0111" when E(7) = '0' else
		"0110" when E(6) = '0' else
		"0101" when E(5) = '0' else
		"0100" when E(4) = '0' else
		"0011" when E(3) = '0' else
		"0010" when E(2) = '0' else
		"0001" when E(1) = '0' else
		"0000" when E(0) = '0' else
		"ZZZZ";

end Behavioral;

