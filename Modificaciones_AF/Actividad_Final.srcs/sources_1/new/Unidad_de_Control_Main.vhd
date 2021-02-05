library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Unidad_de_Control_Main is
Port (  GO : in STD_LOGIC;
        CLR : in STD_LOGIC;
        CLK : in STD_LOGIC;
        XIN : in STD_LOGIC_VECTOR (7 downto 0);
        YIN : in STD_LOGIC_VECTOR (7 downto 0); 
        GCD : out STD_LOGIC_VECTOR (7 downto 0));

end Unidad_de_Control_Main;

architecture Behavioral of Unidad_de_Control_Main is

Signal X1 :STD_LOGIC_VECTOR (7 downto 0);
Signal Y1 :STD_LOGIC_VECTOR (7 downto 0);
Signal Cable1 : STD_LOGIC;
Signal Cable2 : STD_LOGIC;
Signal YLD: STD_LOGIC;
Signal XLD: STD_LOGIC;
Signal GLD: STD_LOGIC;
Signal XSEL : STD_LOGIC;
Signal YSEL : STD_LOGIC;
Signal YR : STD_LOGIC_VECTOR (7 downto 0);
Signal XR : STD_LOGIC_VECTOR (7 downto 0);
Signal X : STD_LOGIC_VECTOR (7 downto 0);
Signal Y : STD_LOGIC_VECTOR (7 downto 0);

begin
inst_uni_de_control: entity work.Uni_de_control port map(
go => GO, eqflg => Cable1, ltflg => Cable2, clk => CLK, clr => CLR, yld => YLD, xld => XLD, ysel => YSEL , xsel =>XSEL, gld => GLD);

inst_xmux: entity work.Muxbx port map(
xsel => XSEL, xin => XIN, xr => XR, x1 => X1);

inst_xreg: entity work.Regx port map(
Entrada => X1, reset => CLR, Salida => X, clock => CLK, xld => XLD);

inst_ymux: entity work.Muxby port map(
yin => YIN, yr => YR, ysel => YSEL, y1 => Y1);

inst_yreg: entity work.Regy port map(
Entrada => Y1, reset => CLR, Salida => Y, clock => CLK, yld => YLD);

inst_greg: entity work.Regg port map(
Entrada => X, reset => CLR, Salida => GCD, clock => CLK, gld => GLD);

inst_comp: entity work.Comp port map(
x => X, y => Y, EQFLG => Cable1, LTFLG => Cable2);

inst_xres: entity work.Resx port map(
f => X, g => Y, xrr => XR);

inst_yres: entity work.Resty port map(
c => X, d => Y, yrr => YR);

end Behavioral;
