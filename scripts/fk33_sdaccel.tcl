
set ProjectName fk33_sdaccel
set ProjectFolder ./$ProjectName

#Remove unnecessary files.
set file_list [glob -nocomplain webtalk*.*]
foreach name $file_list {
    file delete $name
}

#Delete old project if folder already exists.
if {[file exists .Xil]} { 
    file delete -force .Xil
}

#Delete old project if folder already exists.
if {[file exists "$ProjectFolder"]} { 
    file delete -force $ProjectFolder
}

set scriptPath [file dirname [file normalize [info script]]]
#puts stdout $scriptPath
#puts stdout [file dirname [info script]]
#return -code 1

create_project $ProjectName ./$ProjectName -part xcvu33p-fsvh2104-2-e

create_bd_design "bd"


create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 xdma
set_property -dict [list CONFIG.cfg_mgmt_if {false}] [get_bd_cells xdma]
set_property -dict [list CONFIG.pl_link_cap_max_link_speed {8.0_GT/s} CONFIG.axisten_freq {250}] [get_bd_cells xdma]
set_property -dict [list CONFIG.plltype {QPLL1}] [get_bd_cells xdma]
set_property -dict [list CONFIG.pf0_device_id {9031} CONFIG.PF0_DEVICE_ID_mqdma {9031} CONFIG.PF2_DEVICE_ID_mqdma {9031} CONFIG.PF3_DEVICE_ID_mqdma {9031}] [get_bd_cells xdma]
set_property -dict [list CONFIG.xdma_pcie_64bit_en {true} CONFIG.pf0_msix_cap_table_bir {BAR_1:0} CONFIG.pf0_msix_cap_pba_bir {BAR_1:0}] [get_bd_cells xdma]
set_property -dict [list CONFIG.pcie_blk_locn {PCIE4C_X1Y0} CONFIG.axisten_freq {250} CONFIG.select_quad {GTY_Quad_227}] [get_bd_cells xdma]

create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 xdma_reset
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins xdma_reset/slowest_sync_clk]
connect_bd_net [get_bd_pins xdma/axi_aresetn] [get_bd_pins xdma_reset/ext_reset_in]

create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 sys_reset
connect_bd_net [get_bd_pins xdma/axi_aresetn] [get_bd_pins sys_reset/ext_reset_in]

create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0
set_property -dict [list CONFIG.C_BUF_TYPE {IBUFDSGTE}] [get_bd_cells util_ds_buf_0]

#create_bd_cell -type ip -vlnv xilinx.com:ip:axi_apb_bridge:3.0 axi_apb_bridge_0
#set_property -dict [list CONFIG.C_APB_NUM_SLAVES {1}] [get_bd_cells axi_apb_bridge_0]

create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0
set_property CONFIG.RESET_TYPE ACTIVE_LOW [get_bd_cells /clk_wiz_0]
set_property -dict [list CONFIG.PRIM_IN_FREQ.VALUE_SRC USER] [get_bd_cells clk_wiz_0]
set_property -dict [list CONFIG.PRIM_IN_FREQ {200}] [get_bd_cells clk_wiz_0]
set_property -dict [list CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100}] [get_bd_cells clk_wiz_0]

#connect_bd_net [get_bd_pins xdma/axi_aresetn] [get_bd_pins sys_reset/ext_reset_in]

make_bd_intf_pins_external  [get_bd_intf_pins xdma/pcie_mgt]
set_property name pcie [get_bd_intf_ports pcie_mgt_0]

make_bd_intf_pins_external  [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
set_property name pcie_ref [get_bd_intf_ports CLK_IN_D_0]
connect_bd_net [get_bd_pins util_ds_buf_0/IBUF_DS_ODIV2] [get_bd_pins xdma/sys_clk]
connect_bd_net [get_bd_pins util_ds_buf_0/IBUF_OUT] [get_bd_pins xdma/sys_clk_gt]

make_bd_pins_external  [get_bd_pins xdma/sys_rst_n]
set_property CONFIG.POLARITY ACTIVE_LOW [get_bd_ports sys_rst_n_0]
set_property name pcie_resetn [get_bd_ports sys_rst_n_0]


create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0
set_property name axi2pr [get_bd_cells axi_interconnect_0]
set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI {2}] [get_bd_cells axi2pr]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1
set_property name pr2axi [get_bd_cells axi_interconnect_1]
set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI {1}] [get_bd_cells pr2axi]

connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi2pr/M01_AXI] [get_bd_intf_pins pr2axi/S00_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi2pr/S00_AXI] [get_bd_intf_pins xdma/M_AXI]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
make_bd_pins_external  [get_bd_pins xlconstant_0/dout]
set_property name pcie_clkreq [get_bd_ports dout_0]

create_bd_cell -type ip -vlnv xilinx.com:ip:hbm:1.0 hbm
set_property -dict [list CONFIG.USER_CLK_SEL_LIST0 {AXI_00_ACLK} CONFIG.USER_MC0_EN_DATA_MASK {true} CONFIG.USER_MC1_EN_DATA_MASK {true} CONFIG.USER_MC2_EN_DATA_MASK {true} CONFIG.USER_MC3_EN_DATA_MASK {true} CONFIG.USER_MC4_EN_DATA_MASK {true} CONFIG.USER_MC5_EN_DATA_MASK {true} CONFIG.USER_MC6_EN_DATA_MASK {true} CONFIG.USER_MC7_EN_DATA_MASK {true} CONFIG.USER_MC8_EN_DATA_MASK {true} CONFIG.USER_MC9_EN_DATA_MASK {true} CONFIG.USER_MC10_EN_DATA_MASK {true} CONFIG.USER_MC11_EN_DATA_MASK {true} CONFIG.USER_MC12_EN_DATA_MASK {true} CONFIG.USER_MC13_EN_DATA_MASK {true} CONFIG.USER_MC14_EN_DATA_MASK {true} CONFIG.USER_MC15_EN_DATA_MASK {true} CONFIG.USER_SAXI_01 {false} CONFIG.USER_SAXI_02 {false} CONFIG.USER_SAXI_03 {false} CONFIG.USER_SAXI_04 {false} CONFIG.USER_SAXI_05 {false} CONFIG.USER_SAXI_06 {false} CONFIG.USER_SAXI_07 {false} CONFIG.USER_SAXI_08 {false} CONFIG.USER_SAXI_09 {false} CONFIG.USER_SAXI_10 {false} CONFIG.USER_SAXI_11 {false} CONFIG.USER_SAXI_12 {false} CONFIG.USER_SAXI_13 {false} CONFIG.USER_SAXI_14 {false} CONFIG.USER_SAXI_15 {false}] [get_bd_cells hbm]
set_property -dict [list CONFIG.USER_HBM_REF_CLK_0 {200}] [get_bd_cells hbm]
set_property -dict [list CONFIG.USER_AXI_CLK_FREQ {250} CONFIG.USER_AXI_INPUT_CLK_FREQ {250} CONFIG.USER_AXI_INPUT_CLK_NS {4.000} CONFIG.USER_AXI_INPUT_CLK_PS {4000} CONFIG.USER_AXI_INPUT_CLK_XDC {4.000} CONFIG.HBM_MMCM_FBOUT_MULT0 {80}] [get_bd_cells hbm]
set_property CONFIG.USER_APB_EN false [get_bd_cells /hbm]
#make_bd_pins_external  [get_bd_pins hbm/HBM_REF_CLK_0]
#set_property name hbm_ref [get_bd_ports HBM_REF_CLK_0_0]
connect_bd_intf_net [get_bd_intf_pins hbm/SAXI_00] -boundary_type upper [get_bd_intf_pins pr2axi/M00_AXI]
#connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi2pr/M02_AXI] [get_bd_intf_pins axi_apb_bridge_0/AXI4_LITE]
#connect_bd_intf_net [get_bd_intf_pins axi_apb_bridge_0/APB_M] [get_bd_intf_pins hbm/SAPB_0]
set_property -dict [list CONFIG.FREQ_HZ {200000000}] [get_bd_pins hbm/HBM_REF_CLK_0]
                                                                                                      
create_bd_cell -type ip -vlnv xilinx.com:ip:ocl_block:1.0 ocl_block
set_property -dict [list CONFIG.M_ADDR_WIDTH {64}] [get_bd_cells ocl_block]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi2pr/M00_AXI] [get_bd_intf_pins ocl_block/S_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins pr2axi/S01_AXI] [get_bd_intf_pins ocl_block/M_AXI]

create_bd_cell -type ip -vlnv xilinx.com:ip:jtag_axi:1.2 jtag_axi
set_property -dict [list CONFIG.M_AXI_DATA_WIDTH {32} CONFIG.M_AXI_ADDR_WIDTH {64}] [get_bd_cells jtag_axi]

connect_bd_intf_net [get_bd_intf_pins jtag_axi/M_AXI] -boundary_type upper [get_bd_intf_pins axi2pr/S01_AXI]

make_bd_pins_external  [get_bd_pins xdma/pcie_linkup]

create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_1
set_property -dict [list CONFIG.C_BUF_TYPE {IBUFDS}] [get_bd_cells util_ds_buf_1]
connect_bd_net [get_bd_pins util_ds_buf_1/IBUF_OUT] [get_bd_pins hbm/HBM_REF_CLK_0]
make_bd_intf_pins_external  [get_bd_intf_pins util_ds_buf_1/CLK_IN_D]
set_property name hbm_ref [get_bd_intf_ports CLK_IN_D_0]
set_property -dict [list CONFIG.FREQ_HZ {200000000}] [get_bd_intf_ports hbm_ref]

connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins axi2pr/ACLK]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins axi2pr/S00_ACLK]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins axi2pr/M00_ACLK]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins axi2pr/M01_ACLK]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins axi2pr/S01_ACLK]

connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins pr2axi/ACLK]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins pr2axi/S00_ACLK]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins pr2axi/M00_ACLK]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins pr2axi/S01_ACLK]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins jtag_axi/aclk]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins ocl_block/ACLK]
connect_bd_net [get_bd_pins xdma/axi_aclk] [get_bd_pins hbm/AXI_00_ACLK]

connect_bd_net [get_bd_pins xdma_reset/interconnect_aresetn] [get_bd_pins axi2pr/ARESETN]
connect_bd_net [get_bd_pins xdma_reset/interconnect_aresetn] [get_bd_pins pr2axi/ARESETN]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins jtag_axi/aresetn]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins clk_wiz_0/resetn]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins axi2pr/S00_ARESETN]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins axi2pr/M00_ARESETN]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins axi2pr/M01_ARESETN]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins axi2pr/S01_ARESETN]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins pr2axi/S00_ARESETN]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins pr2axi/M00_ARESETN]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins pr2axi/S01_ARESETN]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins hbm/AXI_00_ARESET_N]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins ocl_block/ARESET]

connect_bd_net [get_bd_pins util_ds_buf_1/IBUF_OUT] [get_bd_pins clk_wiz_0/clk_in1]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins hbm/APB_0_PCLK]
connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins sys_reset/slowest_sync_clk]
connect_bd_net [get_bd_pins clk_wiz_0/locked] [get_bd_pins sys_reset/dcm_locked]
connect_bd_net [get_bd_pins sys_reset/peripheral_aresetn] [get_bd_pins hbm/APB_0_PRESET_N]

set_property CONFIG.ENABLE_ADVANCED_OPTIONS 1 [get_bd_cells ocl_block]
set_property -dict [list CONFIG.USE_PR {true} CONFIG.S_HAS_REGSLICE {4}] [get_bd_cells ocl_block]


#Add AXI GPIO to control LED's
set_property -dict [list CONFIG.NUM_MI {2}] [get_bd_cells pr2axi]
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
connect_bd_intf_net [get_bd_intf_pins axi_gpio_0/S_AXI] -boundary_type upper [get_bd_intf_pins pr2axi/M01_AXI]
connect_bd_net [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins xdma/axi_aclk]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn]
connect_bd_net [get_bd_pins pr2axi/M01_ACLK] [get_bd_pins xdma/axi_aclk]
connect_bd_net [get_bd_pins xdma_reset/peripheral_aresetn] [get_bd_pins pr2axi/M01_ARESETN]
set_property -dict [list CONFIG.C_GPIO_WIDTH {6} CONFIG.C_ALL_OUTPUTS {1}] [get_bd_cells axi_gpio_0]
make_bd_intf_pins_external  [get_bd_intf_pins axi_gpio_0/GPIO]
set_property name led [get_bd_intf_ports GPIO_0]


assign_bd_address

#group_bd_cells static_region [get_bd_cells jtag_axi] [get_bd_cells util_ds_buf_0] [get_bd_cells xdma] [get_bd_cells sys_reset] [get_bd_cells axi_gpio_0] [get_bd_cells axi_apb_bridge_0] [get_bd_cells hbm] [get_bd_cells clk_wiz_0] [get_bd_cells xlconstant_0] [get_bd_cells axi2pr] [get_bd_cells pr2axi]
#group_bd_cells dynamic_region [get_bd_cells ocl_block]
regenerate_bd_layout
save_bd_design

#set_property PR_FLOW 1 [current_project]

add_files -fileset constrs_1 -norecurse $scriptPath/fk33_sdaccel.xdc
import_files -fileset constrs_1 $scriptPath/fk33_sdaccel.xdc

#make_wrapper -files [get_files ./$ProjectName/$ProjectName.srcs/sources_1/bd/bd/bd.bd] -top
#add_files -norecurse ./$ProjectName/$ProjectName.srcs/sources_1/bd/bd/hdl/bd_wrapper.v
#update_compile_order -fileset sources_1


# Write BD wrapper HDL
set_property generate_synth_checkpoint true [get_files ./$ProjectName/$ProjectName.srcs/sources_1/bd/bd/bd.bd]
add_files -norecurse [make_wrapper -files [get_files ./$ProjectName/$ProjectName.srcs/sources_1/bd/bd/bd.bd] -top]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
