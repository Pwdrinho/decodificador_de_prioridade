-------------------------------------------------------
--|               /TABELA VERDADE U.L.A\              |
--|Operação  | S¹S° | F³F²F¹F° |   Over   |   C_out   |
--|Soma (A,B)|  00  |  A + B   | overflow | carry out |
--|Subt (A,B)|  01  |  A - B   | overflow | carry out |
--|AND  (A,B)|  10  |  A AND B |    X     |     X     |
--|OR   (A,B)|  11  |  A OR B  |    X     |     X     |
-------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ULA is
    Port (
        A      : in  STD_LOGIC_VECTOR(3 downto 0);
        B      : in  STD_LOGIC_VECTOR(3 downto 0);
        SS     : in  STD_LOGIC_VECTOR(1 downto 0);
        F      : out STD_LOGIC_VECTOR(3 downto 0);
        over   : out STD_LOGIC;
        c_out  : out STD_LOGIC
    );
end ULA;

architecture Behavioral of ULA is
    signal result        : STD_LOGIC_VECTOR(4 downto 0); -- resultado com carry
    signal signed_result : SIGNED(4 downto 0);
begin

    process(A, B, SS)
        variable signed_A : SIGNED(3 downto 0);
        variable signed_B : SIGNED(3 downto 0);
        variable temp_result : SIGNED(4 downto 0);
    begin
        signed_A := SIGNED(A);
        signed_B := SIGNED(B);

        case SS is
            when "00" =>  -- Soma
                temp_result := ('0' & signed_A) + ('0' & signed_B);
                signed_result <= temp_result;
                result <= STD_LOGIC_VECTOR(temp_result);
                F <= result(3 downto 0);
                c_out <= result(4);
                if (signed_A(3) = signed_B(3)) and (temp_result(4) /= signed_A(3)) then
                    over <= '1';
                else
                    over <= '0';
                end if;

            when "01" =>  -- Subtração
                temp_result := ('0' & signed_A) - ('0' & signed_B);
                signed_result <= temp_result;
                result <= STD_LOGIC_VECTOR(temp_result);
                F <= result(3 downto 0);
                c_out <= result(4);
                if (signed_A(3) /= signed_B(3)) and (temp_result(4) /= signed_A(3)) then
                    over <= '1';
                else
                    over <= '0';
                end if;

            when "10" =>  -- AND
                F <= A and B;
                over <= '0';
                c_out <= '0';

            when "11" =>  -- OR
                F <= A or B;
                over <= '0';
                c_out <= '0';

            when others =>
                F <= (others => '0');
                over <= '0';
                c_out <= '0';
        end case;
    end process;
end Behavioral;