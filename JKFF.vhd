
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JKFF is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           Qn : inout  STD_LOGIC);
end JKFF;

architecture Behavioral of JKFF is

component DFF is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
			  notQ : inout  STD_LOGIC);
end component;
Signal A : STD_LOGIC;
begin
--input equations
A<=(J and Qn) or (not K and Q);
D0 : DFF port map (A,clk,Q,Qn);
end Behavioral;

