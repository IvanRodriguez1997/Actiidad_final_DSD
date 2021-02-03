----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.02.2021 15:04:40
-- Design Name: 
-- Module Name: yreg - Behavioral
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

entity yreg is
    Port ( clr : in STD_LOGIC;
           clk : in STD_LOGIC;
           y1 : in STD_LOGIC_VECTOR (7 downto 0);
           yld : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (7 downto 0));
end yreg;

architecture Behavioral of yreg is

begin
    process (yld)
    begin
        if (yld'event and yld='1') then
            y <= y1;
        end if;
    end process;

end Behavioral;
