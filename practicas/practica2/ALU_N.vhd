----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:15:56 03/02/2016 
-- Design Name: 
-- Module Name:    ALU_N - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all; -- para trabajar con numeros binarios.

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_N is
	 generic (N : integer := 32);
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           aluctrl : in  STD_LOGIC_VECTOR (3 downto 0);
           cero : out  STD_LOGIC;
           overflow : out  STD_LOGIC;
           negativo : out  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (N-1 downto 0));
end ALU_N;

architecture Behavioral of ALU_N is
begin
	-- meto el resultado en una variable temp para poder consultar
	-- el valor del resultado.
	-- el valor del temporal lo mete en la salida.
	process(a, b, aluctrl)
		variable 
			temp: std_logic_vector(N-1 downto 0);
		variable
			c : integer := 0;
	begin
		if aluctrl = "0000" then -- and
			temp := a and b;
			negativo <= '0';
			overflow <= '0';
		elsif aluctrl = "0001" then -- or
			temp := a or b;
			negativo <= '0';
			overflow <= '0';
		elsif aluctrl = "0010" then -- +
			temp := a + b;
			negativo <= temp(N-1);
			if a(N-1) = '1' and b(N-1) = '1' and temp(N-1) = '0' then
				overflow <= '1';
			end if;
			if a(N-1) = '0' and b(N-1) = '0' and temp(N-1) = '1' then
				overflow <= '1';
			end if;
		elsif aluctrl = "0110" then -- -
			temp := a - b;
			negativo <= temp(N-1);
			if a(N-1) = '1' and b(N-1) = '0' and temp(N-1) = '0' then
				overflow <= '1';
			end if;
			if a(N-1) = '0' and b(N-1) = '1' and temp(N-1) = '1' then
				overflow <= '1';
			end if;
		elsif aluctrl = "0111" then
			-- paso el numero a entero
			-- con signo.
			if signed(a) < signed(b) then
				c := 1;
			else
				c := 0;
			end if;
			temp := std_logic_vector(to_unsigned(c, N));
			overflow <= '0';
			negativo <= '0';
		elsif aluctrl = "1100" then
			temp := a nor b;
			overflow <= '0';
			negativo <= '0';
		end if;
		if signed(temp) = 0 then
			cero <= '1';
		else
			cero <= '0';
		end if;
		salida <= temp;
	end process;
end Behavioral;

