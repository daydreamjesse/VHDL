LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.FA_pkg.all; -- Package containing FullAdder

ENTITY RippleAdder_8bit IS
	PORT(	X, Y	:	IN std_logic_vector(7 DOWNTO 0);
		S	:	OUT std_logic_vector(7 DOWNTO 0);
		Cin	:	IN std_logic;
		C_out	:	OUT std_logic);
END RippleAdder_8bit;

 -- Ripple from first bit to last bit
ARCHITECTURE Behavior OF RippleAdder_8bit IS
SIGNAL Cout	: std_logic_vector(7 DOWNTO 0);
BEGIN
	step1: FullAdder PORT MAP(X => X(0), Y => Y(0), c_in => Cin, s => S(0), c_out => Cout(0));
	step2: FullAdder PORT MAP(X => X(1), Y => Y(1), c_in => Cout(0), s => S(1), c_out => Cout(1));
	step3: FullAdder PORT MAP(X => X(2), Y => Y(2), c_in => Cout(1), s => S(2), c_out => Cout(2));
	step4: FullAdder PORT MAP(X => X(3), Y => Y(3), c_in => Cout(2), s => S(3), c_out => Cout(3));
	step5: FullAdder PORT MAP(X => X(4), Y => Y(4), c_in => Cout(3), s => S(4), c_out => Cout(4));
	step6: FullAdder PORT MAP(X => X(5), Y => Y(5), c_in => Cout(4), s => S(5), c_out => Cout(5));
	step7: FullAdder PORT MAP(X => X(6), Y => Y(6), c_in => Cout(5), s => S(6), c_out => Cout(6));
	step8: FullAdder PORT MAP(X => X(7), Y => Y(7), c_in => Cout(6), s => S(7), c_out => Cout(7));
	step9: C_out <= Cout(7);
END Behavior;
