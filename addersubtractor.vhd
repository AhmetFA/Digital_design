----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:10:33 11/15/2016 
-- Design Name: 
-- Module Name:    addersubtractor - Behavioral 
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

entity addersubtractor is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           B : in  STD_LOGIC_VECTOR (2 downto 0);
           M : in  STD_LOGIC;
           T : out  STD_LOGIC_VECTOR (2 downto 0);
           V : out  STD_LOGIC;
			  F : out  STD_LOGIC);
end addersubtractor;

architecture Behavioral of addersubtractor is
Component Fulladder is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           S1 : out  STD_LOGIC;
           C1 : out  STD_LOGIC);
End Component;
signal F0,F1,F2,H0,H1,H2 : STD_LOGIC;
begin
H0<= B(0) xor M ;
H1<= B(1) xor M ;
H2<= B(2) xor M ;

FA1 : Fulladder port map (M,A(0),H0,T(0),F0);
FA2 : Fulladder port map (F0,A(1),H1,T(1),F1);
FA3 : Fulladder port map (F1,A(2),H2,T(2),F2);
F<= F2 ;
V<= F2 xor F1 ;
end Behavioral;

