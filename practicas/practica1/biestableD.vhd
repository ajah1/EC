----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:43:10 02/07/2016 
-- Design Name: 
-- Module Name:    biestableD - Behavioral 
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

entity biestableD is
    Port ( d : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rstH : in  STD_LOGIC;
           q : out  STD_LOGIC);
end biestableD;

architecture Behavioral of biestableD is

begin
	-- el proceso se ejecuta si alguna de las dos señales cambia
	process (clk, rsth)
		begin
			-- señal asincrona que no depende del reloj resetea el biestable.
			if(rsth = '1') then
				q <= '0';
			-- cuando clk ha cambiado de valor clk'event es cierto.
			elsif (clk'event and clk = '1') then
			-- si la señal de reloj acaba de cambiar y ha cambiado a uno, estoy en un flanco de subida.
				q <= d;
			end if;
	end process;
end Behavioral;

