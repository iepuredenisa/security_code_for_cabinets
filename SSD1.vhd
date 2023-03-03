library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SSD is 
	port(N1, N2, N3, N4: in std_logic_vector(3 downto 0); CLK: in std_logic; 
	CATOD: out std_logic_vector(6 downto 0); ANOD: out std_logic_vector(3 downto 0));
end SSD;

architecture arh of SSD is
component num_16 is	  
	port(CLK: in std_logic;
	Q: out std_logic_vector(15 downto 0));
end component;

component MUX4_1 is
	port (N1, N2, N3, N4: in std_logic_vector(3 downto 0); S: in std_logic_vector(1 downto 0); otp: out std_logic_vector(3 downto 0));
end component;	

component DCD_BCD_7seg is
	port(x: in std_logic_vector (3 downto 0); 
		 y: out std_logic_vector (6 downto 0));
end component; 

signal A: std_logic_vector(3 downto 0);
signal B: std_logic_vector(15 downto 0);

begin 
	NUM: num_16 port map(CLK, B);
	MC: MUX4_1 port map(N1, N2, N3, N4, B(15 downto 14), A);
	MA: MUX4_1 port map("1110", "1101", "1011", "0111", B(15 downto 14), ANOD);
	S7: DCD_BCD_7seg port map(A, CATOD);
end architecture;