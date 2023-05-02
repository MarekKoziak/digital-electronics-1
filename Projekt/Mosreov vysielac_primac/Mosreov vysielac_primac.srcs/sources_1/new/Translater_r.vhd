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

entity Translater_r is
    Port ( morse_alphabet_letter : out character;
    
           signal_morse_code : in  std_logic;
           morse_code_symbol : in std_logic;
           input_idle : in std_logic;
           
           sig : out std_logic_vector (9 downto 0)
           );
end Translater_r;

architecture Behavioral of Translater_r is
    constant DOT : std_logic_vector (1 downto 0) := "00";
    constant DASH : std_logic_vector (1 downto 0) := "11";
    constant SPACE : std_logic_vector (1 downto 0) := "10";

    constant A : std_logic_vector(9 downto 0) := SPACE & SPACE & SPACE & DOT & DASH;
    constant B : std_logic_vector(9 downto 0) := SPACE & DASH & DOT & DOT & DOT;
    constant C : std_logic_vector(9 downto 0) := SPACE & DASH & DOT & DASH & DOT;
    constant D : std_logic_vector(9 downto 0) := SPACE & SPACE & DASH & DOT & DOT;
    constant E : std_logic_vector(9 downto 0) := SPACE & SPACE & SPACE & SPACE & DOT;
    constant F : std_logic_vector(9 downto 0) := SPACE & DOT & DOT & DASH & DOT;
    constant G : std_logic_vector(9 downto 0) := SPACE & SPACE & DASH & DASH & DOT;
    constant H : std_logic_vector(9 downto 0) := SPACE & DOT & DOT & DOT & DOT;
    constant I : std_logic_vector(9 downto 0) := SPACE & SPACE & SPACE & DOT & DOT;
    constant J : std_logic_vector(9 downto 0) := SPACE & DOT & DASH & DASH & DASH;
    constant K : std_logic_vector(9 downto 0) := SPACE & SPACE & DASH & DOT & DASH;
    constant L : std_logic_vector(9 downto 0) := SPACE & DOT & DASH & DOT & DOT;
    constant M : std_logic_vector(9 downto 0) := SPACE & SPACE & SPACE & DASH & DASH;
    constant N : std_logic_vector(9 downto 0) :=  SPACE & SPACE & SPACE & DASH & DOT;
    constant O : std_logic_vector(9 downto 0) := SPACE & SPACE & DASH & DASH & DASH;
    constant P : std_logic_vector(9 downto 0) := SPACE & DOT & DASH & DASH & DOT;
    constant Q : std_logic_vector(9 downto 0) := SPACE & DASH & DASH & DOT & DASH;
    constant R : std_logic_vector(9 downto 0) := SPACE & SPACE & DOT & DASH & DOT;
    constant S : std_logic_vector(9 downto 0) := SPACE & SPACE & DOT & DOT & DOT;
    constant T : std_logic_vector(9 downto 0) := SPACE & SPACE & SPACE & SPACE  & DASH;
    constant U : std_logic_vector(9 downto 0) := SPACE & SPACE & DOT & DOT & DASH;
    constant V : std_logic_vector(9 downto 0) := SPACE & DOT & DOT & DOT & DASH;
    constant W : std_logic_vector(9 downto 0) := SPACE & SPACE & DOT & DASH & DASH;
    constant X : std_logic_vector(9 downto 0) := SPACE & DASH & DOT & DOT & DASH;
    constant Y : std_logic_vector(9 downto 0) := SPACE & DASH & DOT & DASH & DASH;
    constant Z : std_logic_vector(9 downto 0) := SPACE & DASH & DASH & DOT & DOT;
    constant ZERO  : std_logic_vector(9 downto 0) := DASH & DASH & DASH & DASH & DASH;
    constant ONE   : std_logic_vector(9 downto 0) := DOT & DASH & DASH & DASH & DASH;
    constant TWO   : std_logic_vector(9 downto 0) := DOT & DOT & DASH & DASH & DASH;
    constant THREE : std_logic_vector(9 downto 0) := DOT & DOT & DOT & DASH & DASH;
    constant FOUR  : std_logic_vector(9 downto 0) := DOT & DOT & DOT & DOT & DASH;
    constant FIVE  : std_logic_vector(9 downto 0) := DOT & DOT & DOT & DOT & DOT;
    constant SIX   : std_logic_vector(9 downto 0) := DASH & DOT & DOT & DOT & DOT;
    constant SEVEN : std_logic_vector(9 downto 0) := DASH & DASH & DOT & DOT & DOT;
    constant EIGHT : std_logic_vector(9 downto 0) := DASH & DASH & DASH & DOT & DOT;
    constant NINE  : std_logic_vector(9 downto 0) := DASH & DASH & DASH & DASH & DOT;
    
    signal morse_code_letter : std_logic_vector (9 downto 0) := "1010101010";
    
begin

    p_read : process (signal_morse_code ) is
    begin
        if (signal_morse_code = '0') then
            
            morse_code_letter(9) <= morse_code_letter(7);
            morse_code_letter(8) <= morse_code_letter(6);
            morse_code_letter(7) <= morse_code_letter(5);
            morse_code_letter(6) <= morse_code_letter(4);
            morse_code_letter(5) <= morse_code_letter(3);
            morse_code_letter(4) <= morse_code_letter(2);
            morse_code_letter(3) <= morse_code_letter(1);
            morse_code_letter(2) <= morse_code_letter(0);
            morse_code_letter(1) <= signal_morse_code;
            morse_code_letter(0) <= signal_morse_code;
        end if;
        
        sig <= morse_code_letter;
    end process;
    
    p_translate : process (input_idle) is
    begin 
        if (input_idle = '1') then 
            case morse_code_letter is 
                when ZERO => morse_alphabet_letter <= '0';
                when ONE => morse_alphabet_letter <= '1';
                when TWO => morse_alphabet_letter <= '2';
                when THREE => morse_alphabet_letter <= '3';
                when FOUR => morse_alphabet_letter <= '4';
                when FIVE => morse_alphabet_letter <= '5';
                when SIX => morse_alphabet_letter <= '6';
                when SEVEN => morse_alphabet_letter <= '9';
                when EIGHT => morse_alphabet_letter <= '9';
                when NINE => morse_alphabet_letter <= '9';
                when A => morse_alphabet_letter <= 'A';
                when B => morse_alphabet_letter <= 'B';
                when C => morse_alphabet_letter <= 'C';
                when D => morse_alphabet_letter <= 'D';
                when E => morse_alphabet_letter <= 'E';
                when F => morse_alphabet_letter <= 'F';
                when G => morse_alphabet_letter <= 'G';
                when H => morse_alphabet_letter <= 'H';
                when I => morse_alphabet_letter <= 'I';
                when J => morse_alphabet_letter <= 'J';
                when K => morse_alphabet_letter <= 'K';
                when L => morse_alphabet_letter <= 'L';
                when M => morse_alphabet_letter <= 'M';
                when N => morse_alphabet_letter <= 'N';
                when O => morse_alphabet_letter <= 'O';
                when P => morse_alphabet_letter <= 'P';
                when Q => morse_alphabet_letter <= 'Q';
                when R => morse_alphabet_letter <= 'R';
                when S => morse_alphabet_letter <= 'S';
                when T => morse_alphabet_letter <= 'T';
                when U => morse_alphabet_letter <= 'U';
                when V => morse_alphabet_letter <= 'V';
                when W => morse_alphabet_letter <= 'W';
                when X => morse_alphabet_letter <= 'X';
                when Y => morse_alphabet_letter <= 'Y';
                when Z => morse_alphabet_letter <= 'Z';
                when others => morse_alphabet_letter <= '*';
            end case;
            
            morse_code_letter <= "1010101010";
            
        end if;      

    end process;

end Behavioral;
