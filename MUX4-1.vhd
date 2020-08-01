library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MUX4 is
    Port ( K0 : in  STD_LOGIC;
           K1 : in  STD_LOGIC;
			  K2 : in  STD_LOGIC;
			  K3 : in  STD_LOGIC;
			  L0 : in  STD_LOGIC;
           L1 : in  STD_LOGIC;
			  M : out  STD_LOGIC);
end MUX4;

architecture Behavioral of MUX4 is
component MUXtwo is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  S : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;
signal X : STD_LOGIC_VECTOR (1 downto 0);
begin
m0: MUXtwo port map(K0,K1,L0,X(0));
m1: MUXtwo port map(K2,K3,L0,X(1));
m2: MUXtwo port map(X(0),X(1),L1,M);
end Behavioral;

