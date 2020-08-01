
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seqdet is
    Port ( X   : in  STD_LOGIC;
	   clk : in  STD_LOGIC;
           Y   : out  STD_LOGIC);
end seqdet;

architecture Behavioral of seqdet is
component JKFF is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           Qn : inout  STD_LOGIC);
end component;
Signal J : STD_LOGIC_VECTOR(2 downto 0);
Signal K : STD_LOGIC_VECTOR(2 downto 0);
Signal Q : STD_LOGIC_VECTOR(2 downto 0);
Signal nQ : STD_LOGIC_VECTOR(2 downto 0);
begin
J0 : JKFF port map (J(0),K(0),clk,Q(0),nQ(0));
J1 : JKFF port map (J(1),K(1),clk,Q(1),nQ(1));
J2 : JKFF port map (J(2),K(2),clk,Q(2),nQ(2));

J(0) <= Q(1) and Q(2) and not X ;
K(0) <= '1' ;

J(1) <= (nQ(0) and Q(2) and X) or (Q(0)and nQ(2) and X);
K(1) <= not (nQ(0) and nQ(2) and X);

J(2) <= (nQ(0) and not X) or (nQ(0) and Q(1)) or (nQ(1) and not X) or (nQ(0) and nQ(1) and not X and Q(2));
K(2) <= '1' ;

Y <= Q(0) and nQ(1) and nQ(2);
end Behavioral;

