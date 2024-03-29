----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2023 12:41:05 PM
-- Design Name: 
-- Module Name: transmiter - Behavioral
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

entity morse_transmitter is
    Port ( button : in  STD_LOGIC;
           signal_morse_code : out  STD_LOGIC
          );
end morse_transmitter;

architecture Behavioral of morse_transmitter is
    begin
        process(button)
    begin
        if (button = '1') then
            signal_morse_code <= '1';
        else
            signal_morse_code <= '0';
        end if;
    end process;
end Behavioral;
