library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


ENTITY Sumador_completo IS

PORT (X, Y, Cin   :IN STD_LOGIC;
Sum, Cout	: OUT STD_LOGIC);
END Sumador_completo;


ARCHITECTURE Ecuaciones OF Sumador_completo IS
BEGIN

Sum <= X XOR Y XOR Cin;
Cout <= (X AND Y) OR (X AND Cin) OR (Y AND Cin);
END Ecuaciones;
