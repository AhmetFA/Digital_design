
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sr is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q0 : inout  STD_LOGIC;
           Q1 : inout  STD_LOGIC);
end sr;

architecture Behavioral of sr is

begin
--nand SR latch Q1=Q' Q0=Q
Q1<= R nand Q0;
Q0<= S nand Q1;

end Behavioral;

