LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.FA_pkg.all;

ENTITY RippleAdder_32bit IS
	PORT	(	X, Y	:	IN std_logic_vector(31 DOWNTO 0);
				S		:	OUT std_logic_vector(31 DOWNTO 0);
				Cin	:	IN std_logic;
				Cout	:	OUT std_logic);
END RippleAdder_32bit;

ARCHITECTURE Behavior OF RippleAdder_32bit IS
SIGNAL C1, C2, C3	:	std_logic;
BEGIN
	step1: RippleAdder_8bit PORT MAP(X(7 DOWNTO 0) => X(7 DOWNTO 0), -- First section of 8 bits
												Y(7 DOWNTO 0) => Y(7 DOWNTO 0), 
												Cin => Cin, 
												S(7 DOWNTO 0) => S(7 DOWNTO 0), 
												C_out => C1);
	step2: RippleAdder_8bit PORT MAP(X(7 DOWNTO 0) => X(15 DOWNTO 8), -- Second section 8 bits
												Y(7 DOWNTO 0) => Y(15 DOWNTO 8), 
												Cin => C1, 
												S(7 DOWNTO 0) => S(15 DOWNTO 8), 
												C_out => C2);
	step3: RippleAdder_8bit PORT MAP(X(7 DOWNTO 0) => X(23 DOWNTO 16), -- Third section 8 bits
												Y(7 DOWNTO 0) => Y(23 DOWNTO 16), 
												Cin => C2, 
												S(7 DOWNTO 0) => S(23 DOWNTO 16), 
												C_out => C3);
	step4: RippleAdder_8bit PORT MAP(X(7 DOWNTO 0) => X(31 DOWNTO 24), -- Fourth section of 8 bits
												Y(7 DOWNTO 0) => Y(31 DOWNTO 24),
												Cin => C3, 
												S(7 DOWNTO 0) => S(31 DOWNTO 24),
												C_out => Cout);
END Behavior;