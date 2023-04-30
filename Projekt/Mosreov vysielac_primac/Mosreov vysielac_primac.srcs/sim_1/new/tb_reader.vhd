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

entity tb_reader is
--  Port ( );
end tb_reader;

architecture Behavioral of tb_reader is

    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    signal sig_signal_morse_code : std_logic;
    signal sig_morse_code_symbol : std_logic;
    signal sig_input_idle : std_logic;
    signal sig_clk : std_logic;
    signal sig_rst : std_logic;   

begin

    reciever : entity work.morse_reader_r
        port map (
            signal_morse_code => sig_signal_morse_code,
            morse_code_symbol => sig_morse_code_symbol,
            input_idle  => sig_input_idle, 
            clk => sig_clk,
            rst => sig_rst
        );
        
        p_clk_gen : process is
  begin

    while now < 3000 ms loop             -- 75 periods of 100MHz clock

      sig_clk <= '0';
      wait for c_CLK_100MHZ_PERIOD / 2;
      sig_clk <= '1';
      wait for c_CLK_100MHZ_PERIOD / 2;

    end loop;
    wait;                               -- Process is suspended forever

  end process p_clk_gen;

        p_reciever : process
  begin
  
    sig_signal_morse_code <= '0';
    wait for 10 ms;
    
    sig_signal_morse_code <= '1';
    wait for 50 ms;
    
    sig_rst <= '1';
    wait for 100ms;
    sig_rst <= '0';
    
    sig_signal_morse_code <= '0';
    wait for 50 ms;
    
    sig_signal_morse_code <= '1';
    wait for 100 ms;
    
    sig_signal_morse_code <= '0';
    wait for 50 ms;
    
    sig_signal_morse_code <= '1';
    wait for 30 ms;
    
    sig_signal_morse_code <= '1';
    wait for 300 ms;
    
    sig_signal_morse_code <= '0';
    wait for 200 ms;
    
    sig_signal_morse_code <= '1';
    wait for 100 ms;
    
    sig_signal_morse_code <= '0';
    wait for 50 ms;
    
    sig_signal_morse_code <= '1';
    wait for 100 ms;
    
    sig_signal_morse_code <= '0';
    wait for 50 ms;
    
    sig_signal_morse_code <= '1';
    wait for 5 ms;
    
    sig_signal_morse_code <= '1';
    wait for 20 ms;
    
    sig_signal_morse_code <= '1';
    wait for 500 ms;
    
    sig_signal_morse_code <= '0';    
    wait;
    
  end process;

end Behavioral;
