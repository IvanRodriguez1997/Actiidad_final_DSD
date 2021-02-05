library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Muxbx is
Port (  xin : in STD_LOGIC_VECTOR (7 downto 0);
        xr : in STD_LOGIC_VECTOR (7 downto 0);
        xsel : in STD_LOGIC;
        x1 : out STD_LOGIC_VECTOR (7 downto 0));
end Muxbx;

architecture Behavioral of Muxbx is
begin
 x1<= xin WHEN xsel = '1' ELSE
            xr;
end Behavioral;


