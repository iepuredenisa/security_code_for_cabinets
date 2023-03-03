----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2022 02:32:59 AM
-- Design Name: 
-- Module Name: Debouncer - Behavioral
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

ENTITY Debouncer IS
   PORT ( clk,buton  : IN STD_LOGIC; 	 
  			enable : OUT STD_LOGIC);
END;
architecture butoane of Debouncer is
signal cnt:std_logic_vector(15 downto 0):=x"0000";
signal en, Q0,Q1,Q2:std_logic:='0';
begin
	numar: process(clk)
	begin
		if(rising_edge(clk))
			then cnt<=cnt+1;
		end if;
	end process;
en<='1'when cnt=x"FFFF" else '0';
et1: process(buton,clk,en)
begin
	if(rising_edge(clk))
		then if(en='1') then Q0<=buton;
		end if; end if; end process;
et2: process(buton,clk,en)
begin
	if(rising_edge(clk))
		then Q1<=Q0;
	end if; end process;
et3: process(buton,clk,en)
begin
	if(rising_edge(clk))
		then Q2<=Q1;
	end if; end process;   
	
enable<=(not (Q2)) and Q1;

	end;