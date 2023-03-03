----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2022 11:58:29 PM
-- Design Name: 
-- Module Name: Stare_AdCifru - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Stare_AdCifru is
   port ( clk, Apas_AdCifru: in std_logic;
   Nr_Apasari: out std_logic_vector( 2 downto 0));
end Stare_AdCifru;

architecture Behavioral of Stare_AdCifru is
signal Q: std_logic_vector( 2 downto 0);
begin
 process (clk, Apas_AdCifru)
 begin 
 if rising_edge(clk) and Apas_AdCifru='1' then Q<=Q+1;
 end if;
 end process;


end Behavioral;
