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

entity transmiter is
    Port ( 
        output : out std_logic_vector (1 downto 0);
        button : in std_logic;
        
        clk : in std_logic;
        rst : std_logic
        
    );
end transmiter;

architecture Behavioral of transmiter is

signal sig_en_10ms : std_logic;

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
    
 signal_transmitng : process (clk) is
     begin
        if (ce)
     end process signal_transmitng;

end Behavioral;
