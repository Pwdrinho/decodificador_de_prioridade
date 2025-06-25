
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cronometro_tb is
end cronometro_tb;

architecture behavior of cronometro_tb is

    -- Sinais para o DUT
    signal clk_tb        : STD_LOGIC := '0';
    signal reset_tb      : STD_LOGIC := '1'; -- ativo em 0
    signal start_stop_tb : STD_LOGIC := '1'; -- ativo em 0
    signal seg_anodo_tb  : STD_LOGIC_VECTOR(3 downto 0);
    signal seg_catodo_tb : STD_LOGIC_VECTOR(6 downto 0);

    constant clk_period : time := 10 ns;

    -- Função para converter STD_LOGIC_VECTOR em string
    function slv_to_string(slv : STD_LOGIC_VECTOR) return string is
        variable result : string(1 to slv'length);
    begin
        for i in slv'range loop
            if slv(i) = '1' then
                result(i - slv'low + 1) := '1';
            else
                result(i - slv'low + 1) := '0';
            end if;
        end loop;
        return result;
    end;

begin

    -- Instanciação do DUT
    uut: entity work.cronometro
        port map (
            clk        => clk_tb,
            reset      => reset_tb,
            start_stop => start_stop_tb,
            seg_anodo  => seg_anodo_tb,
            seg_catodo => seg_catodo_tb
        );

    -- Geração do clock
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Processo de estímulo com verificações
    stim_proc: process
    begin
        -- Reset inicial
        wait for 20 ns;
        reset_tb <= '0';
        wait for 20 ns;
        reset_tb <= '1';

        -- Aciona start_stop para iniciar contagem
        wait for 50 ns;
        start_stop_tb <= '0';
        wait for 10 ns;
        start_stop_tb <= '1';

        -- Aguarda tempo suficiente para aparecer o número "1"
        wait for 100 ns;
        assert seg_catodo_tb = "1111001"
            report "ERRO: Esperado dígito 1 no display (catodo), recebido: " & slv_to_string(seg_catodo_tb)
            severity error;

        -- Aguarda tempo para aparecer "2"
        wait for 100 ns;
        assert seg_catodo_tb = "0100100"
            report "ERRO: Esperado dígito 2 no display (catodo), recebido: " & slv_to_string(seg_catodo_tb)
            severity error;

        -- Aguarda tempo para aparecer "3"
        wait for 100 ns;
        assert seg_catodo_tb = "0110000"
            report "ERRO: Esperado dígito 3 no display (catodo), recebido: " & slv_to_string(seg_catodo_tb)
            severity error;

        -- Pausa a contagem
        start_stop_tb <= '0';
        wait for 10 ns;
        start_stop_tb <= '1';

        -- Espera e finaliza
        wait for 200 ns;
        wait;
    end process;

end behavior;