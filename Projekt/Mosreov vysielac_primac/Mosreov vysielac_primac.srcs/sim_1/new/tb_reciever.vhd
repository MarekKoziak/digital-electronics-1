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

entity tb_reciever is
--  Port ( );
end tb_reciever;

architecture Behavioral of tb_reciever is
    signal sig_input : std_logic;
    signal sig_signal_morse_code : std_logic;
begin

    reciever : entity work.morse_receiver 
        port map (
            input => sig_input,
            signal_morse_code => sig_signal_morse_code
        );
        
    p_reciever : process is 
    begin
        sig_input <= '0';
        wait for 20ms;
        sig_input <= '1';
        wait for 100ms;
        sig_input <= '0';
        wait for 50ms;
        sig_input <= '1';
        wait for 300ms;
        sig_input <= '0';
        wait for 20ms;
        
    end process; 

end Behavioral;
