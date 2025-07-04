LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY decodificador_de_prioridade IS
	Port (
		D0 : in STD_LOGIC; -- MAIOR PRIORIDADE
		D1 : in STD_LOGIC;
		D2 : in STD_LOGIC;
		D3 : in STD_LOGIC; -- MENOR PRIORIDADE
		X0 : out STD_LOGIC; -- Saida codificada (bit menos signficativo)
		X1 : out STD_LOGIC; -- Saida codificada (bit mais significativo)
		int : out STD_LOGIC -- Sinal Interrupção (1 se qualquer entrada estiver ativa)
	);
END decodificador_de_prioridade;

ARCHITECTURE behavior of decodificador_de_prioridade IS
BEGIN
	PROCESS(D0, D1, D2, D3)
	BEGIN
		-- Codificador de Prioridade
		if (not D0 = '1') THEN
			X1 <= '0';
			X0 <= '0';
			int <= '1';
		ELSIF (not D1 = '1') THEN
			X1 <= '0';
			X0 <= '1';
			int <= '1';
		ELSIF (not D2 = '1') THEN
			X1 <= '1';
			X0 <= '0';
			int <= '1';
		ELSIF (not D3 = '1') THEN
			X1 <= '1';
			X0 <= '1';
			int <= '1';
		ELSE
			X1 <= '1';
			X0 <= '1';
			int <= '0';
		END IF;
	END PROCESS;
END behavior;