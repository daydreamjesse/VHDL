LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- ENTITY PORT Declaration. 3 inputs(bit), 2 outputs(bit).
ENTITY FullAdder IS
	PORT (	x, y, c_in	:	IN std_logic;
				s, c_out		:	OUT std_logic);
END FullAdder;

ARCHITECTURE Behavior OF FullAdder IS
BEGIN
	
	--Implementation of sum logic
	s 		<= 	(x XOR y XOR c_in);
	
	--Implementation of c_out
	c_out <=	(	(x AND y) OR
					(x AND c_in) OR
					(y AND c_in)
					);
END Behavior;