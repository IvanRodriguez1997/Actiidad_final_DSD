library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity Uni_de_control is
    Port ( go : in STD_LOGIC;       --señal de inicio   "go"
           eqflg : in STD_LOGIC;    --señal de igual x=y    "compare"
           ltflg : in STD_LOGIC;    --señal de diferente x/=y   "compare"
           clk : in STD_LOGIC;      --señal de reloj
           clr : in STD_LOGIC;      --señal de reset
           yld : out STD_LOGIC;     --señal de selector de registro y   "yreg"
           xld : out STD_LOGIC;     --señal de selector de registo x     "xreg"
           ysel : out STD_LOGIC;    --señal de selector de multiplexor y    "ymux"    
           xsel : out STD_LOGIC;    --señal de selector de multiplexor x    "xmux"
           gld : out STD_LOGIC);     --señal de selector de registro final "greg" 
end Uni_de_control;

architecture Behavioral of Uni_de_control is

  type state_type is (start,input,test1,test2,done,B,A);
  signal present_state, next_state : state_type; 
begin

--sequencial process
    state_register: process(clk,clr)
    begin
        if(clr = '1') then
            present_state <= start;
    elsif (rising_edge(clk)) then
       present_state <= next_state; 
    end if;            
    end process state_register;
--combinational block C1
    C1: process(present_state)
    begin
        case present_state is
            when start =>
                if (go = '1') then
                    next_state <= input;
            else
                    next_state <= start;
                end if;
            when input =>
                  xsel <= '1';        --En este estado pongo estas 4 señales en alto y 
                  ysel <= '1';        --paso al siguiente estado automaticamente
                  xld <= '1';
                  yld <= '1';
                next_state <= test1;

            when test1 =>
                if (eqflg = '1') then
                    next_state <= done;
                else
                    next_state <= test2;
                end if;
            
            when done =>
               gld <= '1';
               next_state <= done;
           
	    when test2 =>
                if (ltflg = '1') then
                    next_state <= A;
                else
                    next_state <= B;
                end if;

         when A =>
            yld <= '1';    
            ysel <= '0';
         next_state <= test1;
         when B =>
            xld <= '1';    
            xsel <= '0';
          next_state <= test1;

       when others =>
                null;
        end case;
    end process C1;     
end Behavioral;