library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decodificador_de_prioridade is
end tb_decodificador_de_prioridade;

architecture behavior of tb_decodificador_de_prioridade is

	Component decodificador_de_prioridade
		port( 
			D0 : IN STD_LOGIC;
			D1 : IN STD_LOGIC;
			D2 : IN STD_LOGIC;
			D3 : IN STD_LOGIC;
			X0 : out std_logic;
			X1 : out STD_LOGIC;
			int : OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL D0 : STD_LOGIC := '0';
	SIGNAL D1 : STD_LOGIC := '0';
	SIGNAL D2 : STD_LOGIC := '0';
	SIGNAL D3 : STD_LOGIC := '0';
	SIGNAL X0 : STD_LOGIC;
	SIGNAL X1 : STD_LOGIC;
	SIGNAL int : STD_LOGIC;
	
BEGIN

	uut: decodificador_de_prioridade PORT MAP(
		D0  => D0,
        D1  => D1,
        D2  => D2,
        D3  => D3,
        X0  => X0,
        X1  => X1,
        int => int
    );
            
    stim_proc: PROCESS
    begin
        for i in 0 to 15 loop
            if ((i / 8) mod 2) = 1 then
                D0 <= '1';
            else
                D0 <= '0';
            end if;

            if ((i / 4) mod 2) = 1 then
                D1 <= '1';
            else
                D1 <= '0';
            end if;

            if ((i / 2) mod 2) = 1 then
                D2 <= '1';
            else
                D2 <= '0';
            end if;

            if ((i / 1) mod 2) = 1 then
                D3 <= '1';
            else
                D3 <= '0';
            end if;

            wait for 10 ns;
        end loop;

        wait;
    end process;

end architecture behavior;