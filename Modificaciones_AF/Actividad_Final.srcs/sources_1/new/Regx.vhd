----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.02.2021 20:57:53
-- Design Name: 
-- Module Name: Regx - Behavioral
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

entity Regx is
 port (
        Entrada : in std_logic_vector (7 downto 0);
        Salida : out std_logic_vector (7 downto 0);
        reset, clock : in std_logic;
        xld : in std_logic
    );
end Regx;

architecture Behavioral of Regx is
begin
   xreg: process (clock)
     begin
        if (rising_edge(clock)) then
         if (xld = '1') then
             Salida <= Entrada;
             end if;
        end if;     
    end process;
end Behavioral;




    