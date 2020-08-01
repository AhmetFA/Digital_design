
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dlatch is
    Port ( D : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           Qn : inout  STD_LOGIC);
end Dlatch;

architecture Behavioral of Dlatch is
component sr is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q0 : inout  STD_LOGIC;
           Q1 : inout  STD_LOGIC);
end component;
signal S1 : STD_LOGIC;
signal R1 : STD_LOGIC;
begin
S1<= D nand En;		--Next state equations
R1<= (not D) nand En;

a0 : sr port map(S1,R1,Q,Qn);
end Behavioral;

