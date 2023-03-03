----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2022 02:26:42 AM
-- Design Name: 
-- Module Name: Numaratorr - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Numaratorr2 is
port( UP : in std_logic;
DOWN: in std_logic;	 
RESET: in std_logic;
CLK: in std_logic;
LED: out std_logic_vector(3 downto 0));
end Numaratorr2; 


architecture count of Numaratorr2 is  

signal CNT: std_logic_vector(3 downto 0):=	"0000";
begin
	process(CLK, RESET, UP, DOWN)
	begin
		if (RESET = '1') then CNT <= "0000";
		elsif (CLK'event and CLK='1') then
			if(UP= '1' and DOWN= '0' AND CNT<"1111") then CNT<= CNT+1;	 
			elsif ( UP= '0' and DOWN ='1' and CNT >"0000" ) then CNT<= CNT-1; 
			ELSIF ( UP='1' AND DOWN ='0' AND CNT="1111") THEN CNT<="0000";	 
		    
			end if;
			end if;	 
			
		end process;
		LED<=CNT; 
end count ;