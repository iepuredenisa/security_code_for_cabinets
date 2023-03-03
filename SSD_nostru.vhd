----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2022 02:36:39 AM
-- Design Name: 
-- Module Name: SSD - Behavioral
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

entity SSD is
    Port ( digit0 : in STD_LOGIC_VECTOR (3 downto 0);
           digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in STD_LOGIC_VECTOR (3 downto 0);
           digit3 : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           Reset1: in std_logic;
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end SSD;

architecture Behavioral of SSD is
signal aux : STD_LOGIC_VECTOR(15 downto 0):="0000000000000000";
signal digit:STD_LOGIC_VECTOR (3 downto 0);
signal  anod_next:std_logic_vector(3 downto 0);
signal anod_aux: std_logic;
begin

process(clk)
begin
if rising_edge(clk) then
aux <= aux + 1;
end if;
end process;

process(clk)
begin
case aux(15 downto 14) is
when "00" => digit <= digit0;
when "01" => digit <= digit1;
when "10" => digit <= digit2;
when "11" => digit <= digit3;
end case;
END PROCESS;

process(clk)
begin
case aux(15 downto 14) is
when "00" => an <= "1110";
when "01" => an <= "1101";
when "10" => an <= "1011";
when "11" => an <= "0111";

an<=anod_next;
  anod_aux<=anod_next(3);
  anod_next( 3 downto 1)<= anod_next( 2 downto 0);
  anod_next(0)<= anod_aux;
end case;
END PROCESS;

--HEX-to-seven-segment decoder
--   HEX:   in    STD_LOGIC_VECTOR (3 downto 0);
--   LED:   out   STD_LOGIC_VECTOR (6 downto 0);

    with digit SELect
   cat<= "1111001" when "0001",   --1
         "0100100" when "0010",   --2
         "0110000" when "0011",   --3
         "0011001" when "0100",   --4
         "0010010" when "0101",   --5
         "0000010" when "0110",   --6
         "1111000" when "0111",   --7
         "0000000" when "1000",   --8
         "0010000" when "1001",   --9
         "0001000" when "1010",   --A
         "0000011" when "1011",   --b
         "1000110" when "1100",   --C
         "0100001" when "1101",   --d
         "0000110" when "1110",   --E
         "0001110" when "1111",   --F
         "1000000" when others;   --0
         
         
  
end Behavioral;