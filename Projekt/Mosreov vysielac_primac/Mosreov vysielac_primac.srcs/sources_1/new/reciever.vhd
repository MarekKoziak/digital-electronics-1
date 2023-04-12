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

entity vysielac is
    Port ( 
        output : out std_logic_vector (1 downto 0);
        button : in std_logic;
        
        clk : in std_logic;
        rst : std_logic
        
    );
end vysielac;

architecture Behavioral of vysielac is

  -- Internal clock enable
  signal sig_en_10ms : std_logic;
  signal sig_cnt_5bit : std_logic_vector (4 downto 0);
  signal sig_count_0 : unsigned (4 downto 0);
  signal sig_count_1 : unsigned (4 downto 0);
  constant c_DELAY_200ms : unsigned(4 downto 0) := "10100";
  
  begin
  --------------------------------------------------------
  -- Instance (copy) of clock_enable entity generates
  -- an enable pulse every 4 ms
  --------------------------------------------------------
  clk_en0 : entity work.clock_enable
    generic map (

      g_MAX => 1000000
    )
    port map (
      clk => clk,
      rst => rst,
      ce  => sig_en_10ms
    );

 bin_cnt0 : entity work.cnt_up_down
    generic map (
      g_CNT_WIDTH => 5
    )
    port map (
      clk     => clk,
      rst     => rst,
      en      => sig_en_10ms,
      cnt_up  => '1',
      cnt     => sig_cnt_5bit
    );

signal_transmitng : process (clk) is
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then          
                sig_count_1 <= (others => '0');
                sig_count_0 <= (others => '0');
            elsif(ce = 1) then
                if (cnt < c_DELAY_200ms) then                    
                    if (button = 1) then 
                        sig_count_1 <= sig_count_1 + 1;
                    elsif(button = 0) then
                        sig_count_0 <= sig_count_0 + 0;
      
    end process signal_transmitng;

end Behavioral;
