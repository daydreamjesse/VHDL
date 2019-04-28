LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE FA_pkg IS
-- ENTITY PORT Declaration. 3 inputs(bit), 2 outputs(bit).
	COMPONENT FullAdder IS
		PORT 	(	x, y, c_in	:	IN std_logic;
					s, c_out		:	OUT std_logic);
	END COMPONENT;
-- ENTITY PORT Declaration for Ripple Adder.
	COMPONENT RippleAdder_8bit IS
		PORT	(	X, Y			:	IN std_logic_vector(7 DOWNTO 0);
					S				:	OUT std_logic_vector(7 DOWNTO 0);
					Cin			:	IN std_logic;
					C_out			:	OUT std_logic);
	END COMPONENT;
-- 7-Segment Display
	COMPONENT dec_7seg IS
		PORT	(	hex_digit	: IN	STD_LOGIC_VECTOR(3 downto 0);
					segment_out	: OUT	STD_LOGIC_VECTOR(0 to 6));
	END COMPONENT;
END FA_pkg;