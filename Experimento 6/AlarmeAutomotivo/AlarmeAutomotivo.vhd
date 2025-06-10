library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AlarmeAutomotivo is
    Port ( Porta   : in  STD_LOGIC;  -- Porta do motorista
           Ignicao : in  STD_LOGIC;  -- Ignição
           Farol   : in  STD_LOGIC;  -- Faróis
           Alarme  : out STD_LOGIC); -- Saída do alarme (LED ou Buzzer)
end AlarmeAutomotivo;

architecture Behavioral of AlarmeAutomotivo is
begin
    Alarme <= (Farol AND (NOT Ignicao)) OR (Porta AND Ignicao);
end Behavioral;
