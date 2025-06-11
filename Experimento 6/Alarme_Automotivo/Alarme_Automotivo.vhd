library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alarme_Automotivo is
    Port ( 
        Porta   : in  STD_LOGIC;
        Ignicao : in  STD_LOGIC;
        Farol   : in  STD_LOGIC;
        Alarme  : out STD_LOGIC
    );
end Alarme_Automotivo;

architecture Behavioral of Alarme_Automotivo is
begin
    process(Porta, Ignicao, Farol)
    begin
        if (Porta = '1' and Ignicao = '1') or (Farol = '1' and Ignicao = '0') then
            Alarme <= '1';
        else
            Alarme <= '0';
        end if;
    end process;
end Behavioral;
