----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2022 12:21:35 AM
-- Design Name: 
-- Module Name: Registru_mem - Behavioral
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

entity Registru_mem2 is
	
	port ( clk: in std_logic;
	intrare : in std_logic_vector(3 downto 0);
	q: out std_logic_vector (3 downto 0));
end Registru_mem2;

--}} End of automatically maintained section

architecture Registru_mem of Registru_mem2 is  

begin
	process(  clk, intrare)
	
	begin
		if rising_edge(clk) then

q<=intrare ;
				end if;
			
		end process;
	 -- enter your statements here --

end Registru_mem;
