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

-- DATE "06/24/2025 23:03:16"

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

ENTITY 	ULA IS
    PORT (
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	SS : IN std_logic_vector(1 DOWNTO 0);
	F : BUFFER std_logic_vector(3 DOWNTO 0);
	over : BUFFER std_logic;
	c_out : BUFFER std_logic
	);
END ULA;

-- Design Ports Information
-- F[0]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- F[1]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- F[2]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- F[3]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- over	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c_out	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SS[1]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SS[0]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ULA IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_SS : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_F : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_over : std_logic;
SIGNAL ww_c_out : std_logic;
SIGNAL \SS[1]~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \F[0]~output_o\ : std_logic;
SIGNAL \F[1]~output_o\ : std_logic;
SIGNAL \F[2]~output_o\ : std_logic;
SIGNAL \F[3]~output_o\ : std_logic;
SIGNAL \over~output_o\ : std_logic;
SIGNAL \c_out~output_o\ : std_logic;
SIGNAL \SS[1]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \SS[0]~input_o\ : std_logic;
SIGNAL \Add0|auto_generated|_~0_combout\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[0]~1_cout\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[1]~2_combout\ : std_logic;
SIGNAL \SS[1]~inputclkctrl_outclk\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \Add0|auto_generated|_~1_combout\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[1]~3\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[2]~4_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \Add0|auto_generated|_~2_combout\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[2]~5\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[3]~6_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \Add0|auto_generated|_~3_combout\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[3]~7\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[4]~8_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Add1~1_cout\ : std_logic;
SIGNAL \Add1~3_cout\ : std_logic;
SIGNAL \Add1~5_cout\ : std_logic;
SIGNAL \Add1~7_cout\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Add0~1_cout\ : std_logic;
SIGNAL \Add0~3_cout\ : std_logic;
SIGNAL \Add0~5_cout\ : std_logic;
SIGNAL \Add0~7_cout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[4]~9\ : std_logic;
SIGNAL \Add0|auto_generated|result_int[5]~10_combout\ : std_logic;
SIGNAL \c_out~0_combout\ : std_logic;
SIGNAL result : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_Mux7~2_combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_SS <= SS;
F <= ww_F;
over <= ww_over;
c_out <= ww_c_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\SS[1]~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \SS[1]~input_o\);
\ALT_INV_Mux7~2_combout\ <= NOT \Mux7~2_combout\;

-- Location: IOOBUF_X0_Y21_N9
\F[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~1_combout\,
	devoe => ww_devoe,
	o => \F[0]~output_o\);

-- Location: IOOBUF_X16_Y24_N23
\F[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~1_combout\,
	devoe => ww_devoe,
	o => \F[1]~output_o\);

-- Location: IOOBUF_X3_Y24_N16
\F[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~1_combout\,
	devoe => ww_devoe,
	o => \F[2]~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\F[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~1_combout\,
	devoe => ww_devoe,
	o => \F[3]~output_o\);

-- Location: IOOBUF_X3_Y24_N9
\over~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux7~2_combout\,
	devoe => ww_devoe,
	o => \over~output_o\);

-- Location: IOOBUF_X13_Y24_N2
\c_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \c_out~0_combout\,
	devoe => ww_devoe,
	o => \c_out~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\SS[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SS(1),
	o => \SS[1]~input_o\);

-- Location: IOIBUF_X13_Y24_N22
\A[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: IOIBUF_X9_Y24_N22
\B[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: IOIBUF_X11_Y24_N22
\SS[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SS(0),
	o => \SS[0]~input_o\);

-- Location: LCCOMB_X16_Y20_N4
\Add0|auto_generated|_~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|_~0_combout\ = \B[0]~input_o\ $ (\SS[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B[0]~input_o\,
	datad => \SS[0]~input_o\,
	combout => \Add0|auto_generated|_~0_combout\);

-- Location: LCCOMB_X16_Y20_N6
\Add0|auto_generated|result_int[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|result_int[0]~1_cout\ = CARRY(\SS[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS[0]~input_o\,
	datad => VCC,
	cout => \Add0|auto_generated|result_int[0]~1_cout\);

-- Location: LCCOMB_X16_Y20_N8
\Add0|auto_generated|result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|result_int[1]~2_combout\ = (\A[0]~input_o\ & ((\Add0|auto_generated|_~0_combout\ & (\Add0|auto_generated|result_int[0]~1_cout\ & VCC)) # (!\Add0|auto_generated|_~0_combout\ & (!\Add0|auto_generated|result_int[0]~1_cout\)))) # 
-- (!\A[0]~input_o\ & ((\Add0|auto_generated|_~0_combout\ & (!\Add0|auto_generated|result_int[0]~1_cout\)) # (!\Add0|auto_generated|_~0_combout\ & ((\Add0|auto_generated|result_int[0]~1_cout\) # (GND)))))
-- \Add0|auto_generated|result_int[1]~3\ = CARRY((\A[0]~input_o\ & (!\Add0|auto_generated|_~0_combout\ & !\Add0|auto_generated|result_int[0]~1_cout\)) # (!\A[0]~input_o\ & ((!\Add0|auto_generated|result_int[0]~1_cout\) # 
-- (!\Add0|auto_generated|_~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \Add0|auto_generated|_~0_combout\,
	datad => VCC,
	cin => \Add0|auto_generated|result_int[0]~1_cout\,
	combout => \Add0|auto_generated|result_int[1]~2_combout\,
	cout => \Add0|auto_generated|result_int[1]~3\);

-- Location: CLKCTRL_G2
\SS[1]~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \SS[1]~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \SS[1]~inputclkctrl_outclk\);

-- Location: LCCOMB_X16_Y20_N28
\result[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- result(0) = (GLOBAL(\SS[1]~inputclkctrl_outclk\) & ((result(0)))) # (!GLOBAL(\SS[1]~inputclkctrl_outclk\) & (\Add0|auto_generated|result_int[1]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0|auto_generated|result_int[1]~2_combout\,
	datac => \SS[1]~inputclkctrl_outclk\,
	datad => result(0),
	combout => result(0));

-- Location: LCCOMB_X16_Y20_N24
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\SS[0]~input_o\ & ((\B[0]~input_o\) # (\A[0]~input_o\))) # (!\SS[0]~input_o\ & (\B[0]~input_o\ & \A[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS[0]~input_o\,
	datac => \B[0]~input_o\,
	datad => \A[0]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X16_Y20_N26
\Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\SS[1]~input_o\ & ((\Mux6~0_combout\))) # (!\SS[1]~input_o\ & (result(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS[1]~input_o\,
	datab => result(0),
	datad => \Mux6~0_combout\,
	combout => \Mux6~1_combout\);

-- Location: IOIBUF_X9_Y24_N15
\B[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: LCCOMB_X16_Y20_N22
\Add0|auto_generated|_~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|_~1_combout\ = \B[1]~input_o\ $ (\SS[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B[1]~input_o\,
	datad => \SS[0]~input_o\,
	combout => \Add0|auto_generated|_~1_combout\);

-- Location: IOIBUF_X13_Y24_N8
\A[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: LCCOMB_X16_Y20_N10
\Add0|auto_generated|result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|result_int[2]~4_combout\ = ((\Add0|auto_generated|_~1_combout\ $ (\A[1]~input_o\ $ (!\Add0|auto_generated|result_int[1]~3\)))) # (GND)
-- \Add0|auto_generated|result_int[2]~5\ = CARRY((\Add0|auto_generated|_~1_combout\ & ((\A[1]~input_o\) # (!\Add0|auto_generated|result_int[1]~3\))) # (!\Add0|auto_generated|_~1_combout\ & (\A[1]~input_o\ & !\Add0|auto_generated|result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add0|auto_generated|_~1_combout\,
	datab => \A[1]~input_o\,
	datad => VCC,
	cin => \Add0|auto_generated|result_int[1]~3\,
	combout => \Add0|auto_generated|result_int[2]~4_combout\,
	cout => \Add0|auto_generated|result_int[2]~5\);

-- Location: LCCOMB_X16_Y20_N30
\result[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- result(1) = (GLOBAL(\SS[1]~inputclkctrl_outclk\) & ((result(1)))) # (!GLOBAL(\SS[1]~inputclkctrl_outclk\) & (\Add0|auto_generated|result_int[2]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0|auto_generated|result_int[2]~4_combout\,
	datac => result(1),
	datad => \SS[1]~inputclkctrl_outclk\,
	combout => result(1));

-- Location: LCCOMB_X16_Y20_N20
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\SS[0]~input_o\ & ((\A[1]~input_o\) # (\B[1]~input_o\))) # (!\SS[0]~input_o\ & (\A[1]~input_o\ & \B[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS[0]~input_o\,
	datab => \A[1]~input_o\,
	datac => \B[1]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X16_Y20_N2
\Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\SS[1]~input_o\ & ((\Mux5~0_combout\))) # (!\SS[1]~input_o\ & (result(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SS[1]~input_o\,
	datac => result(1),
	datad => \Mux5~0_combout\,
	combout => \Mux5~1_combout\);

-- Location: IOIBUF_X16_Y24_N8
\A[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: IOIBUF_X11_Y24_N1
\B[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: LCCOMB_X16_Y20_N0
\Add0|auto_generated|_~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|_~2_combout\ = \B[2]~input_o\ $ (\SS[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[2]~input_o\,
	datad => \SS[0]~input_o\,
	combout => \Add0|auto_generated|_~2_combout\);

-- Location: LCCOMB_X16_Y20_N12
\Add0|auto_generated|result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|result_int[3]~6_combout\ = (\A[2]~input_o\ & ((\Add0|auto_generated|_~2_combout\ & (\Add0|auto_generated|result_int[2]~5\ & VCC)) # (!\Add0|auto_generated|_~2_combout\ & (!\Add0|auto_generated|result_int[2]~5\)))) # (!\A[2]~input_o\ & 
-- ((\Add0|auto_generated|_~2_combout\ & (!\Add0|auto_generated|result_int[2]~5\)) # (!\Add0|auto_generated|_~2_combout\ & ((\Add0|auto_generated|result_int[2]~5\) # (GND)))))
-- \Add0|auto_generated|result_int[3]~7\ = CARRY((\A[2]~input_o\ & (!\Add0|auto_generated|_~2_combout\ & !\Add0|auto_generated|result_int[2]~5\)) # (!\A[2]~input_o\ & ((!\Add0|auto_generated|result_int[2]~5\) # (!\Add0|auto_generated|_~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \Add0|auto_generated|_~2_combout\,
	datad => VCC,
	cin => \Add0|auto_generated|result_int[2]~5\,
	combout => \Add0|auto_generated|result_int[3]~6_combout\,
	cout => \Add0|auto_generated|result_int[3]~7\);

-- Location: LCCOMB_X10_Y20_N24
\result[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- result(2) = (GLOBAL(\SS[1]~inputclkctrl_outclk\) & ((result(2)))) # (!GLOBAL(\SS[1]~inputclkctrl_outclk\) & (\Add0|auto_generated|result_int[3]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0|auto_generated|result_int[3]~6_combout\,
	datac => \SS[1]~inputclkctrl_outclk\,
	datad => result(2),
	combout => result(2));

-- Location: LCCOMB_X12_Y23_N24
\Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\A[2]~input_o\ & ((\B[2]~input_o\) # (\SS[0]~input_o\))) # (!\A[2]~input_o\ & (\B[2]~input_o\ & \SS[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \B[2]~input_o\,
	datac => \SS[0]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X12_Y23_N26
\Mux4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\SS[1]~input_o\ & ((\Mux4~0_combout\))) # (!\SS[1]~input_o\ & (result(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SS[1]~input_o\,
	datac => result(2),
	datad => \Mux4~0_combout\,
	combout => \Mux4~1_combout\);

-- Location: IOIBUF_X7_Y24_N15
\A[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: IOIBUF_X11_Y24_N15
\B[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: LCCOMB_X16_Y20_N18
\Add0|auto_generated|_~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|_~3_combout\ = \B[3]~input_o\ $ (\SS[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B[3]~input_o\,
	datad => \SS[0]~input_o\,
	combout => \Add0|auto_generated|_~3_combout\);

-- Location: LCCOMB_X16_Y20_N14
\Add0|auto_generated|result_int[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|result_int[4]~8_combout\ = ((\A[3]~input_o\ $ (\Add0|auto_generated|_~3_combout\ $ (!\Add0|auto_generated|result_int[3]~7\)))) # (GND)
-- \Add0|auto_generated|result_int[4]~9\ = CARRY((\A[3]~input_o\ & ((\Add0|auto_generated|_~3_combout\) # (!\Add0|auto_generated|result_int[3]~7\))) # (!\A[3]~input_o\ & (\Add0|auto_generated|_~3_combout\ & !\Add0|auto_generated|result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[3]~input_o\,
	datab => \Add0|auto_generated|_~3_combout\,
	datad => VCC,
	cin => \Add0|auto_generated|result_int[3]~7\,
	combout => \Add0|auto_generated|result_int[4]~8_combout\,
	cout => \Add0|auto_generated|result_int[4]~9\);

-- Location: LCCOMB_X12_Y18_N12
\result[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- result(3) = (GLOBAL(\SS[1]~inputclkctrl_outclk\) & ((result(3)))) # (!GLOBAL(\SS[1]~inputclkctrl_outclk\) & (\Add0|auto_generated|result_int[4]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0|auto_generated|result_int[4]~8_combout\,
	datac => \SS[1]~inputclkctrl_outclk\,
	datad => result(3),
	combout => result(3));

-- Location: LCCOMB_X12_Y23_N0
\Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\B[3]~input_o\ & ((\A[3]~input_o\) # (\SS[0]~input_o\))) # (!\B[3]~input_o\ & (\A[3]~input_o\ & \SS[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	datac => \SS[0]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X12_Y18_N24
\Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\SS[1]~input_o\ & ((\Mux3~0_combout\))) # (!\SS[1]~input_o\ & (result(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => result(3),
	datac => \SS[1]~input_o\,
	datad => \Mux3~0_combout\,
	combout => \Mux3~1_combout\);

-- Location: LCCOMB_X12_Y23_N4
\Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~1_cout\ = CARRY((\A[0]~input_o\) # (!\B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \B[0]~input_o\,
	datad => VCC,
	cout => \Add1~1_cout\);

-- Location: LCCOMB_X12_Y23_N6
\Add1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~3_cout\ = CARRY((\A[1]~input_o\ & (\B[1]~input_o\ & !\Add1~1_cout\)) # (!\A[1]~input_o\ & ((\B[1]~input_o\) # (!\Add1~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Add1~1_cout\,
	cout => \Add1~3_cout\);

-- Location: LCCOMB_X12_Y23_N8
\Add1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~5_cout\ = CARRY((\A[2]~input_o\ & ((!\Add1~3_cout\) # (!\B[2]~input_o\))) # (!\A[2]~input_o\ & (!\B[2]~input_o\ & !\Add1~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Add1~3_cout\,
	cout => \Add1~5_cout\);

-- Location: LCCOMB_X12_Y23_N10
\Add1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~7_cout\ = CARRY((\B[3]~input_o\ & ((!\Add1~5_cout\) # (!\A[3]~input_o\))) # (!\B[3]~input_o\ & (!\A[3]~input_o\ & !\Add1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	datad => VCC,
	cin => \Add1~5_cout\,
	cout => \Add1~7_cout\);

-- Location: LCCOMB_X12_Y23_N12
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = \Add1~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add1~7_cout\,
	combout => \Add1~8_combout\);

-- Location: LCCOMB_X12_Y23_N28
\Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\SS[1]~input_o\) # ((\SS[0]~input_o\ & (\A[3]~input_o\ $ (!\Add1~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS[0]~input_o\,
	datab => \SS[1]~input_o\,
	datac => \A[3]~input_o\,
	datad => \Add1~8_combout\,
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X12_Y23_N14
\Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~1_cout\ = CARRY((\A[0]~input_o\ & \B[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \B[0]~input_o\,
	datad => VCC,
	cout => \Add0~1_cout\);

-- Location: LCCOMB_X12_Y23_N16
\Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~3_cout\ = CARRY((\A[1]~input_o\ & (!\B[1]~input_o\ & !\Add0~1_cout\)) # (!\A[1]~input_o\ & ((!\Add0~1_cout\) # (!\B[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \B[1]~input_o\,
	datad => VCC,
	cin => \Add0~1_cout\,
	cout => \Add0~3_cout\);

-- Location: LCCOMB_X12_Y23_N18
\Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~5_cout\ = CARRY((\A[2]~input_o\ & ((\B[2]~input_o\) # (!\Add0~3_cout\))) # (!\A[2]~input_o\ & (\B[2]~input_o\ & !\Add0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \B[2]~input_o\,
	datad => VCC,
	cin => \Add0~3_cout\,
	cout => \Add0~5_cout\);

-- Location: LCCOMB_X12_Y23_N20
\Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~7_cout\ = CARRY((\B[3]~input_o\ & (!\A[3]~input_o\ & !\Add0~5_cout\)) # (!\B[3]~input_o\ & ((!\Add0~5_cout\) # (!\A[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \A[3]~input_o\,
	datad => VCC,
	cin => \Add0~5_cout\,
	cout => \Add0~7_cout\);

-- Location: LCCOMB_X12_Y23_N22
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = !\Add0~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add0~7_cout\,
	combout => \Add0~8_combout\);

-- Location: LCCOMB_X12_Y23_N2
\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\SS[0]~input_o\ & (\A[3]~input_o\ $ (((!\B[3]~input_o\))))) # (!\SS[0]~input_o\ & ((\A[3]~input_o\ & ((\Add0~8_combout\) # (!\B[3]~input_o\))) # (!\A[3]~input_o\ & ((\B[3]~input_o\) # (!\Add0~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100101100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SS[0]~input_o\,
	datab => \A[3]~input_o\,
	datac => \Add0~8_combout\,
	datad => \B[3]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X12_Y23_N30
\Mux7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (\Mux7~1_combout\) # (\Mux7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux7~1_combout\,
	datad => \Mux7~0_combout\,
	combout => \Mux7~2_combout\);

-- Location: LCCOMB_X16_Y20_N16
\Add0|auto_generated|result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0|auto_generated|result_int[5]~10_combout\ = \Add0|auto_generated|result_int[4]~9\ $ (\SS[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \SS[0]~input_o\,
	cin => \Add0|auto_generated|result_int[4]~9\,
	combout => \Add0|auto_generated|result_int[5]~10_combout\);

-- Location: LCCOMB_X12_Y18_N6
\result[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- result(4) = (GLOBAL(\SS[1]~inputclkctrl_outclk\) & ((result(4)))) # (!GLOBAL(\SS[1]~inputclkctrl_outclk\) & (\Add0|auto_generated|result_int[5]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0|auto_generated|result_int[5]~10_combout\,
	datac => \SS[1]~inputclkctrl_outclk\,
	datad => result(4),
	combout => result(4));

-- Location: LCCOMB_X12_Y18_N2
\c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \c_out~0_combout\ = (!\SS[1]~input_o\ & result(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SS[1]~input_o\,
	datad => result(4),
	combout => \c_out~0_combout\);

ww_F(0) <= \F[0]~output_o\;

ww_F(1) <= \F[1]~output_o\;

ww_F(2) <= \F[2]~output_o\;

ww_F(3) <= \F[3]~output_o\;

ww_over <= \over~output_o\;

ww_c_out <= \c_out~output_o\;
END structure;


