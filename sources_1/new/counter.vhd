----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/29/2024 11:54:08 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    Port ( 
        i_clk : in  STD_LOGIC;
       -- i_reset : in  STD_LOGIC;
        i_count : in STD_LOGIC;
        o_LED_0 : out STD_LOGIC
       -- o_LED_1 : out STD_LOGIC;
       -- o_LED_2 : out STD_LOGIC;
       -- o_LED_3 : out STD_LOGIC
    );
end counter;

architecture Behavioral of counter is
    signal r_count : STD_LOGIC := '0';
    signal r_LED_0 : STD_LOGIC := '0';
    --signal r_LED_1 : STD_LOGIC := '0';
    --signal r_LED_2 : STD_LOGIC := '0';
    --signal r_LED_3 : STD_LOGIC := '0';

begin

    process(i_clk)
    begin
        if rising_edge(i_clk) then
            r_count <= i_count;
            if r_count = '1' and i_count = '0' then
                r_LED_0 <= not r_LED_0;
            end if;
        end if;
    end process;

    o_LED_0 <= r_LED_0;

end Behavioral;
