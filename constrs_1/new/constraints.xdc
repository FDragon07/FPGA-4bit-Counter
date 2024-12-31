#CLOCK
set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports { i_clk }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 4} [get_ports { i_clk }];#set

#BUTTONS
set_property -dict { PACKAGE_PIN D19 IOSTANDARD LVCMOS33 } [get_ports { i_reset }]; #IO_L12N_T1_MRCC_35 Sch=ck_io[1]
set_property -dict { PACKAGE_PIN D20 IOSTANDARD LVCMOS33 } [get_ports { i_count }]; #IO_L13P_T2_MRCC_35 Sch=ck_io[2]

#LEDs
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports { o_LED_0 }]; #IO_L14P_T2_SRCC_35 Sch=led[0]
set_property -dict { PACKAGE_PIN V13 IOSTANDARD LVCMOS33 } [get_ports { o_LED_1 }]; #IO_L14N_T2_SRCC_35 Sch=led[1]
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports { o_LED_2 }]; #IO_L15P_T2_SRCC_35 Sch=led[2]
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports { o_LED_3 }]; #IO_L15N_T2_SRCC_35 Sch=led[3]