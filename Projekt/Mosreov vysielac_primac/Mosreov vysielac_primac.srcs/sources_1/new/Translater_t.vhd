----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.04.2023 07:54:14
-- Design Name: 
-- Module Name: Translater_t - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Translater_t is
    Port ( morse_alphabet_symbol : out std_logic_vector (4 downto 0);
           space_symbol : out std_logic;
    
           signal_morse_code : in  std_logic;
           morse_code_symbol : in std_logic;
           input_idle : in std_logic;
           
           clk : in std_logic;
           rst : in std_logic;
           
           button : in std_logic
           );
end Translater_t;

architecture Behavioral of Translater_t is

    constant A : std_logic_vector(4 downto 0) := "01---";
    constant B : std_logic_vector(4 downto 0) := "1000-";
    constant C : std_logic_vector(4 downto 0) := "1010-";
    constant D : std_logic_vector(4 downto 0) := "100--";
    constant E : std_logic_vector(4 downto 0) := "0----";
    constant F : std_logic_vector(4 downto 0) := "0010-";
    constant G : std_logic_vector(4 downto 0) := "110--";
    constant H : std_logic_vector(4 downto 0) := "0000-";
    constant I : std_logic_vector(4 downto 0) := "00---";
    constant J : std_logic_vector(4 downto 0) := "0111-";
    constant K : std_logic_vector(4 downto 0) := "101--";
    constant L : std_logic_vector(4 downto 0) := "0100-";
    constant M : std_logic_vector(4 downto 0) := "11---";
    constant N : std_logic_vector(4 downto 0) := "10---";
    constant O : std_logic_vector(4 downto 0) := "111--";
    constant P : std_logic_vector(4 downto 0) := "0110";
    constant Q : std_logic_vector(4 downto 0) := "1101-";
    constant R : std_logic_vector(4 downto 0) := "010--";
    constant S : std_logic_vector(4 downto 0) := "000--";
    constant T : std_logic_vector(4 downto 0) := "1----";
    constant U : std_logic_vector(4 downto 0) := "001--";
    constant V : std_logic_vector(4 downto 0) := "0001-";
    constant W : std_logic_vector(4 downto 0) := "011--";
    constant X : std_logic_vector(4 downto 0) := "1001-";
    constant Y : std_logic_vector(4 downto 0) := "1011-";
    constant Z : std_logic_vector(4 downto 0) := "1100-";
    constant ZERO  : std_logic_vector(4 downto 0) := "11111";
    constant ONE   : std_logic_vector(4 downto 0) := "01111";
    constant TWO   : std_logic_vector(4 downto 0) := "00111";
    constant THREE : std_logic_vector(4 downto 0) := "00011";
    constant FOUR  : std_logic_vector(4 downto 0) := "00001";
    constant FIVE  : std_logic_vector(4 downto 0) := "00000";
    constant SIX   : std_logic_vector(4 downto 0) := "10000";
    constant SEVEN : std_logic_vector(4 downto 0) := "11000";
    constant EIGHT : std_logic_vector(4 downto 0) := "11100";
    constant NINE  : std_logic_vector(4 downto 0) := "11110";
    
begin

    transmiter : entity work.morse_reader_t  
        port map (
            signal_morse_code => signal_morse_code,
            
            morse_code_symbol => morse_code_symbol,
            input_idle => input_idle,
            clk => clk,
            rst => rst,   
            button => button 
        );

end Behavioral;
