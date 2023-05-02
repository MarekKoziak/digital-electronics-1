----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 20:34:33
-- Design Name: 
-- Module Name: tb_reciever - Behavioral
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

entity tb_translater is
--  Port ( );
end tb_translater;

architecture Behavioral of tb_translater is
    signal sig_morse_alphabet_letter : character;
    signal sig_signal_morse_code : std_logic;
    signal sig_morse_code_symbol : std_logic;
    signal sig_input_idle : std_logic;
    signal sig : std_logic_vector (9 downto 0);
    
begin

    translater : entity work.Translater_r  
        port map (
            morse_alphabet_letter => sig_morse_alphabet_letter,
            signal_morse_code => sig_signal_morse_code,
            morse_code_symbol => sig_morse_code_symbol,
            input_idle => sig_input_idle,
            sig => sig
        );
        
    p_translater : process is 
    begin
        
        wait for 10ms;
        sig_signal_morse_code <= '0';
        wait for 20ms;
        
        sig_signal_morse_code <= '1';
        wait for 100ms;
        
        sig_signal_morse_code <= '0';
        sig_morse_code_symbol <= '0';
        wait for 30ms;
        
        sig_signal_morse_code <= '1';
        wait for 250ms;
        
        sig_signal_morse_code <= '0';
        sig_morse_code_symbol <= '1';
        wait for 1000ms;
        
        sig_input_idle <= '1';
        
        wait;
        
        
        
    end process; 

end Behavioral;
