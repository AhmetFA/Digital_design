library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier is
    Port ( X : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : in  STD_LOGIC_VECTOR (2 downto 0);
           Z : out  STD_LOGIC_VECTOR (5 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is
component Fulladder is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           S1 : out  STD_LOGIC;
           C1 : out  STD_LOGIC);
end component;
signal G : STD_LOGIC_VECTOR(7 downto 0);
signal S : STD_LOGIC_VECTOR(7 downto 0);
signal C : STD_LOGIC_VECTOR(7 downto 0);
begin

Z(0) <= X(0) AND Y(0);

G(0) <= X(1) AND Y(0);
G(1) <= X(0) AND Y(1); 
G(2) <= X(2) AND Y(0); 
G(3) <= X(1) AND Y(1); 
G(4) <= X(0) AND Y(2);
G(5) <= X(2) AND Y(1);
G(6) <= X(1) AND Y(2);
G(7) <= X(2) AND Y(2);

f1 : Fulladder port map (G(0),G(1),'0',Z(1),C(0)) ;        
f2 : Fulladder port map (G(4),G(2),G(3),S(0),C(1));      
f3 : Fulladder port map (S(0),C(0),'0',Z(2),C(2)); 
f4 : Fulladder port map ('0',C(1),C(2),C(3),C(4));								
f5 : Fulladder port map (C(3),G(5),G(6),Z(3),C(5));
f6 : Fulladder port map (C(5),C(4),G(7),Z(4),Z(5));

end Behavioral;

