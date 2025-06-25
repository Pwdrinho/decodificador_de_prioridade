library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cronometro_tb is
-- testbench não tem portas
end cronometro_tb;

architecture Behavioral of cronometro_tb is

    signal clk        : std_logic := '0';
    signal reset      : std_logic := '1';  -- ativo em 0
    signal start_stop : std_logic := '1';  -- ativo em 0
    signal seg_anodo  : std_logic_vector(3 downto 0);
    signal seg_catodo : std_logic_vector(6 downto 0);

    constant CLK_PERIOD : time := 20 ns;

begin

    -- Instancia o DUT (Device Under Test)
    DUT: entity work.cronometro
        port map(
            clk => clk,
            reset => reset,
            start_stop => start_stop,
            seg_anodo => seg_anodo,
            seg_catodo => seg_catodo
        );

    -- Gerador de clock 50MHz
    clk_process: process
    begin
        for i in 0 to 199 loop  -- gera 200 ciclos de clock = 4 us
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait; -- para o processo aqui
    end process;

    -- Estímulos para reset e start/stop
    stimulus_process: process
    begin
        -- Inicialmente mantém reset ativo (nível baixo)
        reset <= '0';
        wait for 100 ns;  -- tempo de reset
        reset <= '1'; -- desativa reset

        wait for 100 ns;

        -- Pressiona start (ativo em 0)
        start_stop <= '0';
        wait for CLK_PERIOD * 2; -- tempo do botão pressionado
        start_stop <= '1';

        -- Deixa rodar por um tempo para ver cronômetro contar
        wait for 2 ms;

        -- Para a simulação
        assert false report "Fim da simulação" severity failure;
    end process;

end Behavioral;