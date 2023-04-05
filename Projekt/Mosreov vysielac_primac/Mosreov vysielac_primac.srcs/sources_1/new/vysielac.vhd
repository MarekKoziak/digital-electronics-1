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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vysielac is
    Port ( 
        znak : in std_logic_vector (11 downto 0);
        button : in std_logic;
        
        clk : in std_logic;
        rst : std_logic
        
    );
end vysielac;

architecture Behavioral of vysielac is

  -- Internal clock enable
  signal sig_en_10ms : std_logic;
  signal sig_cnt_5bit : std_logic_vector (4 downto 0);
  
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
      cnt_up  => '0',
      cnt     => sig_cnt_5bit
    );


end Behavioral;
