
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Q : inout  STD_LOGIC);
end DFF;

architecture Behavioral of DFF is
component Dlatch is
    Port ( D : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           Qn : inout  STD_LOGIC);
end component;
signal Y : STD_LOGIC;
signal A : STD_LOGIC;
begin
L1 : Dlatch port map (D,(not clk),Y);
L2 : Dlatch port map (Y,clk,A);
Q<= not Reset and A;
end Behavioral;

