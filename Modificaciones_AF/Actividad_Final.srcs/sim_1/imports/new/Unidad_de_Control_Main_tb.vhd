library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity tb_Unidad_de_Control_Main is
end tb_Unidad_de_Control_Main;

architecture Behavioral of tb_Unidad_de_Control_Main is

    component Unidad_de_Control_Main
        port (GO  : in std_logic;
              CLR : in std_logic;
              CLK : in std_logic;
              XIN : in std_logic_vector (7 downto 0);
              YIN : in std_logic_vector (7 downto 0);
              GCD : out std_logic_vector (7 downto 0));
    end component;

    signal GO  : std_logic;
    signal CLR : std_logic;
    signal CLK : std_logic;
    signal XIN : std_logic_vector (7 downto 0);
    signal YIN : std_logic_vector (7 downto 0);
    signal GCD : std_logic_vector (7 downto 0);

constant clock_period : time :=20 ns;
signal stop_the_clock: boolean;

begin

    uut : Unidad_de_Control_Main
    port map (GO  => GO,
              CLR => CLR,
              CLK => CLK,
              XIN => XIN,
              YIN => YIN,
              GCD => GCD);

    stimuli : process
    begin
        XIN <= "00001111";
        YIN <= "01000110";
        CLR <='1';
        GO <= '0';
        wait for 20ns;
        CLR <='0';
        GO <= '1';
        wait;
        end process;
        
   clocking: process     
   begin
        while not stop_the_clock loop
        CLK <= '0', '1' after clock_period/2;
        wait for clock_period;
        end loop;
        wait;
    end process;

end Behavioral;