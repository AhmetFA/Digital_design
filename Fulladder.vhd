----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:41:56 11/15/2016 
-- Design Name: 
-- Module Name:    Fulladder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fulladder is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           S1 : out  STD_LOGIC;
           C1 : out  STD_LOGIC);
end Fulladder;

architecture Behavioral of Fulladder is
component halfadder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : out  STD_LOGIC;
           C : out  STD_LOGIC);
end component;
signal S0,C0,C2 : STD_LOGIC;
begin
h1 : halfadder port map (X,Y,S0,C0) ;
h2 : halfadder port map (S0,Z,S1,C2) ;

C1<= C2 or C0 ;

end Behavioral;

