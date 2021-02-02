----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.01.2021 13:05:53
-- Design Name: 
-- Module Name: ymux - Behavioral
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

entity ymux is
    Port ( yin : in STD_LOGIC_VECTOR (7 downto 0);
           ysel : in STD_LOGIC;
           yr : in STD_LOGIC_VECTOR (7 downto 0);
           y1 : out STD_LOGIC_VECTOR (7 downto 0));
end ymux;

architecture Behavioral of ymux is

begin
y1 <= yin WHEN ysel ='1' ELSE
            yr;

end Behavioral;
