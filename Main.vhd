----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2022 02:38:44 AM
-- Design Name: 
-- Module Name: Main - Behavioral
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

entity Main is
    port ( clk , reset: in std_logic;
     Ad_Cifru , Buton_Up, Buton_Down: in std_logic ;
    Anozi : out std_logic_vector(3 downto 0);
    Catozi: out std_logic_vector ( 6 downto 0);
    Introdu_Caractere: out std_logic:='1');
end Main;

architecture Behavioral of Main is
component Numaratorr is
port( UP : in std_logic;
DOWN: in std_logic;	 
RESET: in std_logic;
CLK: in std_logic;
LED: out std_logic_vector(3 downto 0));
end component;

component Debouncer IS
   PORT ( clk,buton  : IN STD_LOGIC; 	 
  			enable : OUT STD_LOGIC);
end component;

component SSD is
    Port ( digit0 : in STD_LOGIC_VECTOR (3 downto 0);
           digit1 : in STD_LOGIC_VECTOR (3 downto 0);
           digit2 : in STD_LOGIC_VECTOR (3 downto 0);
           digit3 : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           Reset1: in std_logic;
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--component SSD is 
--	port(N1, N2, N3, N4: in std_logic_vector(3 downto 0); CLK: in std_logic; 
--	CATOD: out std_logic_vector(6 downto 0); ANOD: out std_logic_vector(3 downto 0));
--end component SSD;


component Numaratorr2 is
port( UP : in std_logic;
DOWN: in std_logic;	 
RESET: in std_logic;
CLK: in std_logic;
LED: out std_logic_vector(3 downto 0));
end component Numaratorr2; 


component Numaratorr3 is
port( UP : in std_logic;
DOWN: in std_logic;	 
RESET: in std_logic;
CLK: in std_logic;
LED: out std_logic_vector(3 downto 0));
end component Numaratorr3;

component Registru_mem is
	
	port ( clk: in std_logic;
	intrare : in std_logic_vector(3 downto 0);
	q: out std_logic_vector (3 downto 0));
end component Registru_mem;

component Registru_mem2 is
	
	port ( clk: in std_logic;
	intrare : in std_logic_vector(3 downto 0);
	q: out std_logic_vector (3 downto 0));
end component Registru_mem2;

component Registru_mem3 is
	
	port ( clk: in std_logic;
	intrare : in std_logic_vector(3 downto 0);
	q: out std_logic_vector (3 downto 0));
end component Registru_mem3;

signal En_Up, En_Down ,En_Ad : std_logic;
signal cresc: std_logic_vector( 2 downto 0):="000";
signal Val1, Val2, Val3, Val4: std_logic_vector ( 3 downto 0):="0000";
signal Val12, Val13, Val14, Val21, Val23,Val24, Val31, Val32, Val34:std_logic_vector( 3 downto 0);
signal  Anozis: std_logic_vector ( 3 downto 0);
signal Catozis: std_logic_vector ( 6 downto 0);
signal  Anozis1: std_logic_vector ( 3 downto 0);
signal Catozis1: std_logic_vector ( 6 downto 0);
signal  Anozis2: std_logic_vector ( 3 downto 0);
signal Catozis2: std_logic_vector ( 6 downto 0);
signal  Anozis3: std_logic_vector ( 3 downto 0);
signal Catozis3: std_logic_vector ( 6 downto 0);

signal Reset_Numarator: std_logic;
signal reset1: std_logic;

signal iesire_reg1, iesire_reg2, iesire_reg3 : std_logic_vector(3 downto 0);
begin

bt1: Debouncer port map ( clk , Buton_Up , En_Up); -- Debouncer buton Up
bt2: Debouncer port map ( clk , Buton_Down , En_Down );  -- Debouncer pt Down 
bt3: Debouncer port map ( clk , Ad_Cifru, En_Ad); -- Debouncer pt Ad_Cifru

Numar1: Numaratorr port map ( En_Up , En_Down , Reset_Numarator , clk  ,Val1);
Numar2: Numaratorr2 port map ( En_Up, En_Down , Reset_Numarator, clk, Val2);
Numar3: Numaratorr3 port map ( En_Up, En_Down , Reset_Numarator, clk,   Val3);

Registru1: Registru_mem port map(clk, Val1, iesire_reg1);
Registru2: Registru_mem2 port map(clk, Val2, iesire_reg2);
Registru3: Registru_mem3 port map(clk, Val3, iesire_reg3);


process (clk, En_Ad)
begin 
 if (rising_edge(clk) and En_Ad='1') then cresc<=cresc+1;
                                    
                                      
 end if;
 end process;
 
 P1: SSD port map (Val1, Val12, Val13, Val14, clk, reset1, Catozis1, Anozis1);
 P2: SSD port map (Val21, Val2, Val23, Val24, clk, reset1, Catozis2, Anozis2);
 P3: SSD port map (Val31, Val32, Val3, Val34, clk, reset1, Catozis3, Anozis3); 




process (En_Ad)
begin 

    if (cresc ="001") then 
              Anozi(0)<= Anozis1(0);
              Catozi<=Catozis1(6 downto 0);
             
             
    elsif (cresc ="010") then 
               Anozi(1)<= Anozis2(1);
              Catozi<=Catozis2(6 downto 0);
          
              
              
    elsif (cresc ="011") then 
              Anozi(2)<= Anozis3(2);
              Catozi<=Catozis3(6 downto 0);
              
    elsif (cresc ="100") then 
               Introdu_Caractere<='0';
              Anozi(2 downto 0)<="111";
     end if;
  end process;  
  
 
  
 end Behavioral;
