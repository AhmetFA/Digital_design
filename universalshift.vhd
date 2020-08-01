library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity universalshift is
    Port ( I : in  STD_LOGIC_VECTOR (3 downto 0);
           SIR : in  STD_LOGIC;
           SIL : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0);
			  A : out  STD_LOGIC_VECTOR (3 downto 0));
end universalshift;

architecture Behavioral of universalshift is
component MUX4 is
    Port ( K0 : in  STD_LOGIC;
           K1 : in  STD_LOGIC;
			  K2 : in  STD_LOGIC;
			  K3 : in  STD_LOGIC;
			  L0 : in  STD_LOGIC;
           L1 : in  STD_LOGIC;
			  M : out  STD_LOGIC);
end component;
component D_FF is
Port ( D : in STD_LOGIC;
clock : in STD_LOGIC;
reset : in STD_LOGIC;
Q : out STD_LOGIC);
end component;
signal Y : STD_LOGIC_VECTOR (3 downto 0);
begin
M0 : MUX4 port map (I(0),I(1),SIL ,I(0),S(0),S(1),Y(0));
M1 : MUX4 port map (I(1),I(2),I(0),I(1),S(0),S(1),Y(1));
M2 : MUX4 port map (I(2),I(3),I(1),I(2),S(0),S(1),Y(2));
M3 : MUX4 port map (I(3),SIR ,I(2),I(3),S(0),S(1),Y(3));
D0 : D_FF port map(Y(0),clk,reset,A(0));
D1 : D_FF port map(Y(1),clk,reset,A(1));
D2 : D_FF port map(Y(2),clk,reset,A(2));
D3 : D_FF port map(Y(3),clk,reset,A(3));
end Behavioral;

