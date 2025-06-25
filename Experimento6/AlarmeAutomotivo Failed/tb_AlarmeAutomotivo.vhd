library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_AlarmeAutomotivo is
end tb_AlarmeAutomotivo;

architecture testbench of tb_AlarmeAutomotivo is

    signal Porta   : STD_LOGIC := '0';
    signal Ignicao : STD_LOGIC := '0';
    signal Farol   : STD_LOGIC := '0';
    signal Alarme  : STD_LOGIC;

    component AlarmeAutomotivo
        Port ( Porta   : in  STD_LOGIC;
               Ignicao : in  STD_LOGIC;
               Farol   : in  STD_LOGIC;
               Alarme  : out STD_LOGIC);
    end component;

begin

    UUT: AlarmeAutomotivo
        port map (Porta => Porta, Ignicao => Ignicao, Farol => Farol, Alarme => Alarme);

    stim_proc: process
    begin
        -- Teste 1: Porta fechada, Ignição desligada, Farol apagado -> Alarme = 0
        Porta <= '0'; Ignicao <= '0'; Farol <= '0';
        wait for 10 ns;

        -- Teste 2: Farol aceso e Ignição desligada -> Alarme = 1
        Porta <= '0'; Ignicao <= '0'; Farol <= '1';
        wait for 10 ns;

        -- Teste 3: Porta aberta e Ignição ligada -> Alarme = 1
        Porta <= '1'; Ignicao <= '1'; Farol <= '0';
        wait for 10 ns;

        -- Teste 4: Porta aberta, Ignição desligada -> Alarme = 0
        Porta <= '1'; Ignicao <= '0'; Farol <= '0';
        wait for 10 ns;

        -- Teste 5: Farol aceso e Ignição ligada -> Alarme = 0
        Porta <= '0'; Ignicao <= '1'; Farol <= '1';
        wait for 10 ns;

        -- Teste 6: Porta aberta, Farol aceso, Ignição ligada -> Alarme = 1
        Porta <= '1'; Ignicao <= '1'; Farol <= '1';
        wait for 10 ns;

        wait;
    end process;

end testbench;
