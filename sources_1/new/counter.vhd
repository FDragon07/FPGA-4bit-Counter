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
use IEEE.NUMERIC_STD.ALL;

entity counter is
    Port ( 
        i_clk : in  STD_LOGIC;
        i_reset : in  STD_LOGIC;
        i_count : in STD_LOGIC;
        o_LED_0 : out STD_LOGIC;
        o_LED_1 : out STD_LOGIC;
        o_LED_2 : out STD_LOGIC;
        o_LED_3 : out STD_LOGIC
    );
end counter;

architecture Behavioral of counter is
    -- Variables aka signals in VHDL
    signal r_count : STD_LOGIC := '0';
    signal r_reset : STD_LOGIC := '0';
    signal r_Shift : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal r_debounce_counter : INTEGER range 0 to 10000000;

begin

    process(i_clk)
    begin
        if rising_edge(i_clk) then
            -- Debounce counter for both buttons because I am lazy and don't want to write two separate processes for each button
            if r_debounce_counter > 0 then
                r_debounce_counter <= r_debounce_counter - 1;
            end if;

            -- Count up button
            r_count <= i_count;
            if r_count = '1' and i_count = '0' and r_debounce_counter = 0 then
                r_debounce_counter <= 10000000;
                if r_Shift(0) = '1' then
                    if r_Shift(1) = '1' then
                        if r_Shift(2) = '1' then
                            if r_Shift(3) = '1' then
                                r_Shift <= "0000";
                            else
                                r_Shift(3) <= not r_Shift(3);
                            end if;
                        end if;
                        r_Shift(2) <= not r_Shift(2);
                    end if;
                    r_Shift(1) <= not r_Shift(1);
                end if;
                r_Shift(0) <= not r_Shift(0);
            end if;
            
            -- Reset button
            r_reset <= i_reset;
            if r_reset = '1' and i_reset = '0' and r_debounce_counter = 0 then
                r_debounce_counter <= 10000000;
                r_Shift <= "0000";
            end if;
        end if;
    end process;

    o_LED_0 <= r_Shift(0);
    o_LED_1 <= r_Shift(1);
    o_LED_2 <= r_Shift(2);
    o_LED_3 <= r_Shift(3);

end Behavioral;
