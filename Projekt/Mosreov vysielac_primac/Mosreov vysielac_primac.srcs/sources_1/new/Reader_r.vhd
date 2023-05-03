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

entity morse_reader_r is
    Port ( signal_morse_code : in  std_logic;
           morse_code_symbol : out std_logic;
           input_idle : out std_logic;
           
           clk : in std_logic;
           rst : in std_logic
           );   
                          
end morse_reader_r;

architecture Behavioral of morse_reader_r  is

    signal sig_en_10ms : std_logic;
    signal signal_count_HIGH : integer;
    signal signal_count_LOW : integer;

  begin

    clk_en0 : entity work.clock_enable
        generic map (

            g_MAX => 1000000
        )
        port map (
            clk => clk,
            rst => rst,
            ce  => sig_en_10ms
        );
        
    process_read : process (clk) is
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then
                signal_count_HIGH <= 0;
                signal_count_LOW <= 0;
            else if (sig_en_10ms = '1') then
                if (signal_morse_code  = '1') then
                    signal_count_HIGH <= signal_count_HIGH + 1;
                    signal_count_LOW <= 0;
                else 
                    signal_count_LOW <= signal_count_LOW + 1;
                end if;
            end if;
            end if;
        end if;
    

        if (signal_morse_code = '0') then
            if (signal_count_HIGH > 0) then
                if (signal_count_HIGH < 20) then 
                    morse_code_symbol <= '0';
                    signal_count_HIGH <= 0;
                else 
                    morse_code_symbol <= '1';
                    signal_count_HIGH <= 0;
                end if;
            end if;   
                signal_count_HIGH <= 0;
         end if;
        
    end process;
    
    process_idle : process (signal_count_LOW)
    begin
        if (signal_count_LOW > 40) then
            input_idle <= '1';
        else
            input_idle <= '0';
        end if;    
    end process;

end Behavioral;
