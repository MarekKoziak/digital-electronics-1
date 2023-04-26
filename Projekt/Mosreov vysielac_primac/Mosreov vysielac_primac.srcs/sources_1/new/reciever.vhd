----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2023 11:47:21 AM
-- Design Name: 
-- Module Name: vysielac - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity morse_receiver is
    Port ( input : in std_logic;
           signal_morse_code : out  STD_LOGIC   
           );   
     
end morse_receiver;

architecture Behavioral of morse_receiver is
  begin
    process(input)
    begin
        if (input = '1') then
            signal_morse_code <= '1';
        else
            signal_morse_code <= '0';
        end if;
    end process;
end Behavioral;
