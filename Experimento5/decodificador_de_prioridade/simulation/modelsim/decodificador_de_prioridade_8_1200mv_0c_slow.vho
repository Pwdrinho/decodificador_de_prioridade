-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "06/04/2025 09:39:14"

-- 
-- Device: Altera EP4CE6F17C8 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	decodificador_de_prioridade IS
    PORT (
	D0 : IN std_logic;
	D1 : IN std_logic;
	D2 : IN std_logic;
	D3 : IN std_logic;
	X0 : OUT std_logic;
	X1 : OUT std_logic;
	int : OUT std_logic
	);
END decodificador_de_prioridade;

-- Design Ports Information
-- X0	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X1	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- int	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D0	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D2	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D1	=>  Location: PIN_M15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D3	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF decodificador_de_prioridade IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_D0 : std_logic;
SIGNAL ww_D1 : std_logic;
SIGNAL ww_D2 : std_logic;
SIGNAL ww_D3 : std_logic;
SIGNAL ww_X0 : std_logic;
SIGNAL ww_X1 : std_logic;
SIGNAL ww_int : std_logic;
SIGNAL \X0~output_o\ : std_logic;
SIGNAL \X1~output_o\ : std_logic;
SIGNAL \int~output_o\ : std_logic;
SIGNAL \D0~input_o\ : std_logic;
SIGNAL \D1~input_o\ : std_logic;
SIGNAL \D2~input_o\ : std_logic;
SIGNAL \X0~0_combout\ : std_logic;
SIGNAL \X1~0_combout\ : std_logic;
SIGNAL \D3~input_o\ : std_logic;
SIGNAL \int~0_combout\ : std_logic;

BEGIN

ww_D0 <= D0;
ww_D1 <= D1;
ww_D2 <= D2;
ww_D3 <= D3;
X0 <= ww_X0;
X1 <= ww_X1;
int <= ww_int;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X18_Y24_N9
\X0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \X0~0_combout\,
	devoe => ww_devoe,
	o => \X0~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\X1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \X1~0_combout\,
	devoe => ww_devoe,
	o => \X1~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\int~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \int~0_combout\,
	devoe => ww_devoe,
	o => \int~output_o\);

-- Location: IOIBUF_X34_Y2_N22
\D0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D0,
	o => \D0~input_o\);

-- Location: IOIBUF_X34_Y12_N15
\D1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D1,
	o => \D1~input_o\);

-- Location: IOIBUF_X34_Y12_N22
\D2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D2,
	o => \D2~input_o\);

-- Location: LCCOMB_X31_Y19_N0
\X0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \X0~0_combout\ = (\D0~input_o\ & ((\D2~input_o\) # (!\D1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D0~input_o\,
	datac => \D1~input_o\,
	datad => \D2~input_o\,
	combout => \X0~0_combout\);

-- Location: LCCOMB_X31_Y19_N2
\X1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \X1~0_combout\ = (\D0~input_o\ & \D1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \D0~input_o\,
	datac => \D1~input_o\,
	combout => \X1~0_combout\);

-- Location: IOIBUF_X34_Y12_N8
\D3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D3,
	o => \D3~input_o\);

-- Location: LCCOMB_X31_Y19_N4
\int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \int~0_combout\ = (((!\D2~input_o\) # (!\D3~input_o\)) # (!\D0~input_o\)) # (!\D1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \D1~input_o\,
	datab => \D0~input_o\,
	datac => \D3~input_o\,
	datad => \D2~input_o\,
	combout => \int~0_combout\);

ww_X0 <= \X0~output_o\;

ww_X1 <= \X1~output_o\;

ww_int <= \int~output_o\;
END structure;


