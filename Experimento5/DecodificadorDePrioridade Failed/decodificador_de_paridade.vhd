LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

ENTITY decodificador_de_paridade IS
	Port (
		D0 : in STD_LOGIC; -- MAIOR PRIORIDADE
		D1 : in STD_LOGIC;
		D2 : in STD_LOGIC;
		D3 : in STD_LOGIC; -- MENOR PRIORIDADE
		X0 : out STD_LOGIC; -- Saida codificada (bit menos signficativo)
		X1 : out STD_LOGIC; -- Saida codificada (bit mais significativo)
		int : out STD_LOGIC -- Sinal Interrupção (1 se qualquer entrada estiver ativa)
	);
END decodificador_de_paridade;

ARCHITECTURE behavior of decodificador_de_paridade IS
BEGIN
	PROCESS(D0, D1, D2, D3)
	BEGIN
		-- Sinal de Interrupção
		IF (D0 = '1' or D1 = '1' or D2 = '1' or D3 = '1') THEN
			int <= '1';
		ELSE
			int <= '0';
		END IF;
		
		-- Codificador de Prioridade
		if (D0 = '1') THEN
			X1 <= '0';
			X0 <= '0';
		ELSIF (D1 = '1') THEN
			X1 <= '0';
			X0 <= '1';
		ELSIF (D2 = '1') THEN
			X1 <= '1';
			X0 <= '0';
		ELSIF (D3 = '1') THEN
			X1 <= '1';
			X0 <= '1';
		ELSE
			X1 <= '0';
			X0 <= '0';
		END IF;
	END PROCESS;
END behavior;