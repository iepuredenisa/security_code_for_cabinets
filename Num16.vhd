library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity num_16 is	  
	port(CLK: in std_logic;
	Q: out std_logic_vector(15 downto 0));
end entity;

architecture arh_num_16 of num_16 is	 

signal x: std_logic_vector(15 downto 0) := (others => '0');
begin	
	process(CLK,x)
	begin
		if CLK'event and CLK = '1' then
			x <= x+1;
		end if;
		
		Q <= x;
	end process;
end architecture;