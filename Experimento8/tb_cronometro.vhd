library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cronometro is
end tb_cronometro;

architecture sim of tb_cronometro is

    -- Component Declaration
    component cronometro
        Port (
            clk        : in  STD_LOGIC;
            reset      : in  STD_LOGIC;
            start_stop : in  STD_LOGIC;
            seg_anodo  : out STD_LOGIC_VECTOR (3 downto 0);
            seg_catodo : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    -- Sinais para conectar no DUT
    signal clk        : STD_LOGIC := '0';
    signal reset      : STD_LOGIC := '1'; -- ativo em 0
    signal start_stop : STD_LOGIC := '1'; -- ativo em 0
    signal seg_anodo  : STD_LOGIC_VECTOR (3 downto 0);
    signal seg_catodo : STD_LOGIC_VECTOR (6 downto 0);

begin

    -- Instancia o DUT
    uut: cronometro
        port map (
            clk        => clk,
            reset      => reset,
            start_stop => start_stop,
            seg_anodo  => seg_anodo,
            seg_catodo => seg_catodo
        );

    -- Clock de 50MHz (período de 20ns)
    clk_process : process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    -- Estímulos
    stim_proc: process
    begin
        -- Reset inicial
        reset <= '0';
        wait for 100 ns;
        reset <= '1';

        -- Aguarda alguns ciclos
        wait for 200 ns;

        -- Pressiona Start (bordo de descida)
        start_stop <= '0';
        wait for 50 ns;
        start_stop <= '1';

        -- Simula funcionamento por algum tempo
        wait for 2 ms;

        -- Pressiona Stop
        start_stop <= '0';
        wait for 50 ns;
        start_stop <= '1';

        -- Aguarda um pouco parado
        wait for 1 ms;

        -- Pressiona Start novamente
        start_stop <= '0';
        wait for 50 ns;
        start_stop <= '1';

        -- Roda mais um tempo
        wait for 2 ms;

        -- Reset final
        reset <= '0';
        wait for 100 ns;
        reset <= '1';

        -- Finaliza simulação
        wait for 1 ms;
        wait;
    end process;

end sim;
