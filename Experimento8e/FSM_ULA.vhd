library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM_ULA is
    Port (
        CLK    : in  STD_LOGIC;
        RESET  : in  STD_LOGIC;
        KEY    : in  STD_LOGIC_VECTOR(2 downto 0);  -- KEY0=confirma, KEY1=0, KEY2=1
        A_out  : out STD_LOGIC_VECTOR(3 downto 0);
        B_out  : out STD_LOGIC_VECTOR(3 downto 0);
        SS_out : out STD_LOGIC_VECTOR(1 downto 0)
    );
end FSM_ULA;

architecture Behavioral of FSM_ULA is
    type STATE_TYPE is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10);
    signal state : STATE_TYPE := S0;

    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal SS   : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

    signal bit_input : STD_LOGIC := '0';

begin

    process(CLK, RESET)
    begin
        if RESET = '1' then
            state <= S0;
            A <= (others => '0');
            B <= (others => '0');
            SS <= (others => '0');
        elsif rising_edge(CLK) then
            -- Escolhe valor do bit baseado nos botões
            if KEY(1) = '1' then
                bit_input <= '0';
            elsif KEY(2) = '1' then
                bit_input <= '1';
            end if;

            -- Avança para o próximo estado ao pressionar KEY0 (confirma)
            if KEY(0) = '1' then
                case state is
                    when S0 => A(3) <= bit_input; state <= S1;
                    when S1 => A(2) <= bit_input; state <= S2;
                    when S2 => A(1) <= bit_input; state <= S3;
                    when S3 => A(0) <= bit_input; state <= S4;
                    when S4 => B(3) <= bit_input; state <= S5;
                    when S5 => B(2) <= bit_input; state <= S6;
                    when S6 => B(1) <= bit_input; state <= S7;
                    when S7 => B(0) <= bit_input; state <= S8;
                    when S8 => SS(1) <= bit_input; state <= S9;
                    when S9 => SS(0) <= bit_input; state <= S10;
                    when others => state <= S10;
                end case;
            end if;
        end if;
    end process;

    A_out <= A;
    B_out <= B;
    SS_out <= SS;

end Behavioral;