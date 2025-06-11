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

-- DATE "06/11/2025 09:26:18"

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

ENTITY 	Alarme_Automotivo IS
    PORT (
	Porta : IN std_logic;
	Ignicao : IN std_logic;
	Farol : IN std_logic;
	Alarme : OUT std_logic
	);
END Alarme_Automotivo;

-- Design Ports Information
-- Alarme	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Porta	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Farol	=>  Location: PIN_M15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ignicao	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Alarme_Automotivo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Porta : std_logic;
SIGNAL ww_Ignicao : std_logic;
SIGNAL ww_Farol : std_logic;
SIGNAL ww_Alarme : std_logic;
SIGNAL \Alarme~output_o\ : std_logic;
SIGNAL \Porta~input_o\ : std_logic;
SIGNAL \Farol~input_o\ : std_logic;
SIGNAL \Ignicao~input_o\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;

BEGIN

ww_Porta <= Porta;
ww_Ignicao <= Ignicao;
ww_Farol <= Farol;
Alarme <= ww_Alarme;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X23_Y24_N2
\Alarme~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \process_0~0_combout\,
	devoe => ww_devoe,
	o => \Alarme~output_o\);

-- Location: IOIBUF_X34_Y12_N8
\Porta~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Porta,
	o => \Porta~input_o\);

-- Location: IOIBUF_X34_Y12_N15
\Farol~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Farol,
	o => \Farol~input_o\);

-- Location: IOIBUF_X34_Y12_N22
\Ignicao~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ignicao,
	o => \Ignicao~input_o\);

-- Location: LCCOMB_X33_Y12_N8
\process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\Ignicao~input_o\ & (\Porta~input_o\)) # (!\Ignicao~input_o\ & ((\Farol~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Porta~input_o\,
	datab => \Farol~input_o\,
	datad => \Ignicao~input_o\,
	combout => \process_0~0_combout\);

ww_Alarme <= \Alarme~output_o\;
END structure;


