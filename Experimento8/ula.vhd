-------------------------------------------------------
--|               /TABELA VERDADE U.L.A\              |
--|Operação  | S¹S° | F³F²F¹F° |   Over   |   C_out   |
--|Soma (A,B)|  00  |  A + B   | overflow | carry out |
--|Subt (A,B)|  01  |  A - B   | overflow | carry out |
--|AND  (A,B)|  10  |  A AND B |    X     |     X     |
--|OR   (A,B)|  11  |  A OR B  |    X     |     X     |
-------------------------------------------------------
--Pedro Lucas
--Gabriel Diniz
--Joaquim José
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ula is
    port (
        clk      : in  STD_LOGIC;
        rst      : in  STD_LOGIC;
        A, B     : in  STD_LOGIC;
        SS       : in  STD_LOGIC;

        c_out    : out STD_LOGIC;  
        over     : out STD_LOGIC;  
        oper     : out STD_LOGIC_VECTOR(1 downto 0);  
        display  : out STD_LOGIC_VECTOR(6 downto 0);  
        anode    : out STD_LOGIC_VECTOR(5 downto 0)  
    );
end ula;

architecture akg of ula is
    -- Debounce
    signal A_cnt, B_cnt, SS_cnt : integer range 0 to 10000 := 0;
    signal A_clean, B_clean, SS_clean : std_logic := '0';

    -- Estados dos botões para detecção de borda  
    signal A_reg, A_last   : STD_LOGIC := '0';  
    signal B_reg, B_last   : STD_LOGIC := '0';  
    signal SS_reg, SS_last : STD_LOGIC := '0';  

    -- Estados da ULA  
    signal a_value, b_value : integer range -8 to 7 := 0;  
    signal operation        : integer range 0 to 3 := 0;  
    signal resultado        : integer range -8 to 7 := 0;  
    signal anode_ss         : integer range 0 to 5 := 0;  
    signal digit_value      : integer range 0 to 11 := 0;  
    signal negative         : STD_LOGIC := '0';  
    signal negative_a       : STD_LOGIC := '0';  
    signal negative_b       : STD_LOGIC := '0';  
    signal sum_5bits        : std_logic_vector(4 downto 0);  

    -- Divisor de clock  
    signal clk_div       : integer := 0;  
    signal slow_clk      : STD_LOGIC := '0';

begin

    -- Divisor de Clock para multiplexação  
    process (clk)  
    begin  
        if rising_edge(clk) then  
            if clk_div = 4166 then  
                clk_div  <= 0;  
                slow_clk <= not slow_clk;  
            else  
                clk_div <= clk_div + 1;  
            end if;  
        end if;  
    end process;  

    -- Debounce dos botões  
    process (clk)  
    begin  
        if rising_edge(clk) then  
            -- A  
            if A = A_clean then  
                A_cnt <= 0;  
            else  
                if A_cnt < 10000 then -- evita overflow  
                    A_cnt <= A_cnt + 1;  
                end if;  
                if A_cnt > 5000 then  
                    A_clean <= A;  
                    A_cnt <= 0;  
                end if;  
            end if;  
    
            -- B  
            if B = B_clean then  
                B_cnt <= 0;  
            else  
                if B_cnt < 10000 then  
                    B_cnt <= B_cnt + 1;  
                end if;  
                if B_cnt > 5000 then  
                    B_clean <= B;  
                    B_cnt <= 0;  
                end if;  
            end if;  
    
            -- SS  
            if SS = SS_clean then  
                SS_cnt <= 0;  
            else  
                if SS_cnt < 10000 then  
                    SS_cnt <= SS_cnt + 1;  
                end if;  
                if SS_cnt > 5000 then  
                    SS_clean <= SS;  
                    SS_cnt <= 0;  
                end if;  
            end if;  
    
            -- Atualiza registros de borda  
            A_last   <= A_reg;  
            A_reg    <= A_clean;  
            B_last   <= B_reg;  
            B_reg    <= B_clean;  
            SS_last  <= SS_reg;  
            SS_reg   <= SS_clean;  
        end if;  
    end process;  

-- Lógica principal  
process (clk)  
begin  
    if rising_edge(clk) then  
        if rst = '0' then  
            a_value     <= 0;  
            b_value     <= 0;  
            operation   <= 0;  
            resultado   <= 0;  
            negative    <= '0';  
            negative_a  <= '0';  
            negative_b  <= '0';  
            c_out       <= '0';  
            over        <= '0';  
        else  
            -- Botão A  
            if A_last = '1' and A_reg = '0' then  
                if a_value = 7 then   
                    a_value <= -8;   
                else   
                    a_value <= a_value + 1;  
                end if;  
            end if;  

            -- Botão B  
            if B_last = '1' and B_reg = '0' then  
                if b_value = 7 then   
                    b_value <= -8;   
                else   
                    b_value <= b_value + 1;  
                end if;  
            end if;  

            -- Botão SS  
            if SS_last = '1' and SS_reg = '0' then  
                if operation = 3 then   
                    operation <= 0;  
                else   
                    operation <= operation + 1;  
                end if;  
            end if;  

            -- Operações  
            case operation is  
                when 0 =>  -- Soma  
                    resultado <= a_value + b_value;  
                    sum_5bits <= std_logic_vector(resize(to_signed(a_value, 5), 5) + resize(to_signed(b_value, 5), 5));  
                    c_out <= sum_5bits(4);  
                    if ((a_value >= 0 and b_value >= 0 and resultado < 0) or   
                        (a_value < 0 and b_value < 0 and resultado >= 0)) then  
                        over <= '1';  
                    else  
                        over <= '0';  
                    end if;  

                when 1 =>  -- Subtração  
                    resultado <= a_value - b_value;  
                    c_out <= '0';  
                    if ((a_value >= 0 and b_value < 0 and resultado < 0) or  
                        (a_value < 0 and b_value >= 0 and resultado >= 0)) then  
                        over <= '1';  
                    else  
                        over <= '0';  
                    end if;  

                when 2 =>  -- AND  
                    resultado <= to_integer(signed(to_signed(a_value, 4) and to_signed(b_value, 4)));  
                    c_out <= '0';  
                    over <= '0';  

                when 3 =>  -- OR  
                    resultado <= to_integer(signed(to_signed(a_value, 4) or to_signed(b_value, 4)));  
                    c_out <= '0';  
                    over <= '0';  

                when others =>  
                    resultado <= 0;  
                    c_out <= '0';  
                    over <= '0';  
            end case;  

            -- Sinais negativos (atribuídos com if dentro do processo)  
            if resultado < 0 then  
                negative <= '1';  
            else  
                negative <= '0';  
            end if;  

            if a_value < 0 then  
                negative_a <= '1';  
            else  
                negative_a <= '0';  
            end if;  

            if b_value < 0 then  
                negative_b <= '1';  
            else  
                negative_b <= '0';  
            end if;  
        end if;  
    end if;  
end process;  

-- LEDs  
oper <= std_logic_vector(to_unsigned(operation, 2));  

-- Multiplexação de displays  
process (slow_clk)  
begin  
    if rising_edge(slow_clk) then  
        anode_ss <= (anode_ss + 1) mod 6;  
    end if;  
end process;  

anode <= "111110" when anode_ss = 0 else  
         "111101" when anode_ss = 1 else  
         "111011" when anode_ss = 2 else  
         "110111" when anode_ss = 3 else  
         "101111" when anode_ss = 4 else  
         "011111";  

-- Valor para cada display  
process (anode_ss, negative_a, a_value, negative_b, b_value, negative, resultado)  
begin  
    case anode_ss is  
        when 0 =>  
            if negative_a = '1' then  
                digit_value <= 10;  
            else  
                digit_value <= 11;  
            end if;  

        when 1 =>  
            digit_value <= abs(a_value);  

        when 2 =>  
            if negative_b = '1' then  
                digit_value <= 10;  
            else  
                digit_value <= 11;  
            end if;  

        when 3 =>  
            digit_value <= abs(b_value);  

        when 4 =>  
            if negative = '1' then  
                digit_value <= 10;  
            else  
                digit_value <= 11;  
            end if;  

        when 5 =>  
            digit_value <= abs(resultado);  

        when others =>  
            digit_value <= 0;  
    end case;  
end process;  

-- Decodificação dos dígitos  
process (digit_value)  
begin  
    case digit_value is  
        when 11 =>  
            display <= not "0000000"; -- espaço / nenhum segmento ligado  
        when 10 =>  
            display <= not "0000001"; -- sinal de negativo  
        when 8  =>  
            display <= not "1111111";  
        when 7  =>  
            display <= not "1110000";  
        when 6  =>  
            display <= not "1011111";  
        when 5  =>  
            display <= not "1011011";  
        when 4  =>  
            display <= not "0110011";  
        when 3  =>  
            display <= not "1111001";  
        when 2  =>  
            display <= not "1101101";  
        when 1  =>  
            display <= not "0110000";  
        when 0  =>  
            display <= not "1111110";  
        when others =>  
            display <= "1111110";  
    end case;  
end process;

end akg;

