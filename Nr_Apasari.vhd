----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2022 01:49:28 AM
-- Design Name: 
-- Module Name: Nr_Apasari - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Nr_Apasari is
   port( CLK, Ad_Cifru: in std_logic;
   Nr_Apasari: out std_logic_vector( 2 downto 0));
end Nr_Apasari;

architecture Behavioral of Nr_Apasari is
signal Q: std_logic_vector ( 2 downto 0);
begin
  process( clk, Ad_Cifru)
  begin
  if rising_edge(clk) and Ad_Cifru='1'     then Q<=Q + 1;
  end if;
  end process;
  Nr_Apasari<=Q;

end Behavioral;
