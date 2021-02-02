----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.01.2021 14:06:31
-- Design Name: 
-- Module Name: xreg - Behavioral
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

entity xreg is
    Port ( clr : in STD_LOGIC;
           clk : in STD_LOGIC;
           x1 : in STD_LOGIC_VECTOR (7 downto 0);
           xld : in STD_LOGIC;
           x : out STD_LOGIC_VECTOR (7 downto 0));
end xreg;

architecture Behavioral of xreg is

begin


end Behavioral;
