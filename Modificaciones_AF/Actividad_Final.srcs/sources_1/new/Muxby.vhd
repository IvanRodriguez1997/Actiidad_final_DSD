----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.02.2021 20:57:53
-- Design Name: 
-- Module Name: Mux8by - Behavioral
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

entity Muxby is
    Port ( yin : in STD_LOGIC_VECTOR (7 downto 0);
           yr : in STD_LOGIC_VECTOR (7 downto 0);
           ysel : in STD_LOGIC;
           y1 : out STD_LOGIC_VECTOR (7 downto 0));
end Muxby;

architecture Behavioral of Muxby is

begin
y1 <= yin WHEN ysel= '1' ELSE
            yr;

end Behavioral;
