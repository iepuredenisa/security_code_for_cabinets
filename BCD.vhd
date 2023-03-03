library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DCD_BCD_7seg is
	port(x: in std_logic_vector (3 downto 0); 
		 y: out std_logic_vector (6 downto 0));
end entity;

architecture arh_DCD_BCD_7seg of DCD_BCD_7seg is
begin
	y(6) <= not( (not x(2) and not x(0)) or (not x(3) and x(1)) or (x(3) and not x(0)) or (x(2) and x(1)) or (x(3) and not x(2) and not x(1)) or (not x(3) and x(2) and x(0)) );
	y(5) <= not( (not x(2) and not x(0)) or (not x(3) and not x(2)) or (x(3) and not x(1) and x(0)) or (not x(3) and x(1) and x(0)) );
	y(4) <= not( (x(3) xor x(2)) or (not x(1) and x(0)) or (not x(3) and not x(1)) or (not x(3) and x(0)) );
	y(3) <= not( (x(2) and (x(1) xor x(0))) or (x(3) and not x(1)) or (not x(2) and x(1) and x(0)) or (not x(3) and not x(2) and not x(0)) );
	y(2) <= not( (x(3) and x(1)) or (x(3) and x(2)) or (x(1) and not x(0)) or (not x(2) and not x(0)) );
	y(1) <= not( (not x(1) and not x(0)) or (x(3) and not x(2)) or (x(3) and x(1)) or (not x(3) and x(2) and not x(1)) or (not x(3) and x(2) and not x(0)) ); 
	y(0) <= not( (x(3) and not x(2)) or (x(1) and not x(0)) or (x(3) and x(0)) or (not x(2) and x(1)) or (not x(3) and x(2) and not x(1)) );
end architecture;