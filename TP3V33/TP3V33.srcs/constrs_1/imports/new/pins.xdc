#clock
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN W5 [get_ports clk]
create_clock -add -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports {salida[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {salida[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {salida[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {salida[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {salida[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {salida[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {salida[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {salida[0]}]
##set_property IOSTANDARD LVCMOS33 [get_ports alu_ready2rd]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports finish_prog]
set_property PACKAGE_PIN U16 [get_ports {salida[0]}]
set_property PACKAGE_PIN E19 [get_ports {salida[1]}]
set_property PACKAGE_PIN U19 [get_ports {salida[2]}]
set_property PACKAGE_PIN V19 [get_ports {salida[3]}]
set_property PACKAGE_PIN W18 [get_ports {salida[4]}]
set_property PACKAGE_PIN U15 [get_ports {salida[5]}]
set_property PACKAGE_PIN U14 [get_ports {salida[6]}]
set_property PACKAGE_PIN V14 [get_ports {salida[7]}]
set_property PACKAGE_PIN L1 [get_ports finish_prog]
set_property PACKAGE_PIN B18 [get_ports rx]
set_property PACKAGE_PIN T18 [get_ports rst]



## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]