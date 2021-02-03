----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.02.2021 21:34:17
-- Design Name: 
-- Module Name: Unidad_de_Control_Main - Behavioral
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

entity Unidad_de_Control_Main is
Port (  GO : in STD_LOGIC;
        CLR : in STD_LOGIC;
        CLK : in STD_LOGIC;
        XIN : in STD_LOGIC_VECTOR (7 downto 0);
        YIN : in STD_LOGIC_VECTOR (7 downto 0); 
        GCD : out STD_LOGIC_VECTOR (7 downto 0);
        XSEL : in STD_LOGIC;
        YSEL : in STD_LOGIC;
        XR : in STD_LOGIC_VECTOR (7 downto 0);
        X : out STD_LOGIC_VECTOR (7 downto 0));
        
end Unidad_de_Control_Main;

architecture Behavioral of Unidad_de_Control_Main is

Signal X1 : STD_LOGIC_VECTOR (7 downto 0);

begin 

inst_xmux: entity work.Muxbx port map(
xsel => XSEL, xin => XIN, xr => XR, x1 => X1);

inst_xreg: entity work.Regx port map(
Entrada => X1, reset => CLR, Salida => X, clock => CLK); 

end Behavioral;
