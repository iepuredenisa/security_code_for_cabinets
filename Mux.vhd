library IEEE;
use IEEE.STD_LOGIC_1164.all;
--pentru constructia anodului si a catodului
entity MUX4_1 is
	port (N1, N2, N3, N4: in std_logic_vector(3 downto 0); S: in std_logic_vector(1 downto 0); otp: out std_logic_vector(3 downto 0));
end entity;	   

architecture arh_MUX4_1 of MUX4_1 is
begin
	process(S, N1, N2, N3, N4)
	begin
		case(S) is
			when "00" => otp <= N1;
			when "01" => otp <= N2;
			when "10" => otp <= N3;
			when others => otp <= N4;
		end case;
	end process;
end architecture;