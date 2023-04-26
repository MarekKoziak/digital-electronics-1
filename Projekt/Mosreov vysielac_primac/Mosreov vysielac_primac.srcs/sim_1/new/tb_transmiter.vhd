----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 19:42:39
-- Design Name: 
-- Module Name: tb_transmiter - Behavioral
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

entity tb_transmiter is
--  Port ( );
end tb_transmiter;

architecture Behavioral of tb_transmiter is

    signal sig_button : std_logic;
    signal sig_signal_out : std_logic;

begin

    transmiter : entity work.morse_transmitter 
        port map (
            button => sig_button,
            signal_out => sig_signal_out
        );


    p_transmiter : process is
    begin
        wait for 10 ms;
        sig_button <= '1';
        wait for 300 ms;
        sig_button <= '0';
        wait for 300 ms;
        sig_button <= '1';
        wait for 300 ms;
        sig_button <= '0';
        wait;
    end process p_transmiter ;


end Behavioral;
