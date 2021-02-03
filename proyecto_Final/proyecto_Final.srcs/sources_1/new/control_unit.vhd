library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity control_unit is
    Port ( go : in STD_LOGIC;   --señal de inicio   "go"
           eqflg : in STD_LOGIC;    --señal de igual x=y    "compare"
           ltflg : in STD_LOGIC;    --señal de diferente x/=y   "compare"
           clk : in STD_LOGIC;      --señal de reloj
           clr : in STD_LOGIC;      --señal de reset
           yld : out STD_LOGIC;     --señal de selector de registro y   "yreg"
           xld : out STD_LOGIC;     --señal de selector de registo x     "xreg"
           ysel : out STD_LOGIC;    --señal de selector de multiplexor y    "ymux"    
           xsel : out STD_LOGIC;    --señal de selector de multiplexor x    "xmux"
           gld : out STD_LOGIC;     --señal de selector de registro final "greg" 
           w : in STD_LOGIC;        --variable global de entrada
           z : out STD_LOGIC);      --variable global de salida
    
end control_unit;
 
architecture Behavioral of control_unit is
  type estados_t is (start,input,test1,test2,done,B,A);
  signal estado_actual, estado_siguiente : estados_t; 

begin

  process(w,estado_actual)
  begin
    z <= '0';
    estado_siguiente <= estado_actual;

    case(estado_actual) is
      when start =>
        if(go='0') then estado_siguiente <= start;
        else estado_siguiente <= input;
        end if;
      when input =>
        xsel <= '1';        --En este estado pongo estas 4 señales en alto y 
        ysel <= '1';        --paso al siguiente estado automaticamente
        xld <= '1';
        yld <= '1';
        estado_siguiente <= test1;
        
      when test1 =>
        
        if(eqflg='1') then estado_siguiente <= done;
        else estado_siguiente <= test2;
        end if;
      
      when done =>
        gld <= '1';
        estado_siguiente <= done;
        
      when test2 =>
        yld <= '1';     --Si ltflg sale 1, pasa al estado B y se activan asi las señales
        ysel <= '0';
        if(ltflg='1') then estado_siguiente <= B;
        else xld <='1';     --si ltflg sale 0, pasa al estado A y se activan asi las señales
             xsel <='0';    
            estado_siguiente <= A;
        end if;
      when B =>
        
        estado_siguiente <= test1;
      
      when A =>
         estado_siguiente <= test1;
      
      when others => null;
    end case;
  end process;

  process (clk,clr) begin
    if(clr='1') then
      estado_actual <= start;
    elsif rising_edge(clk) then
      estado_actual <= estado_siguiente; 
    end if;
  end process;
end Behavioral;