
set ::env(OCL_BLOCK_ADVANCED) 1
set ::env(XIL_IFX_SC_PIPELINE_EXPERIMENT_LEVEL) 0

set_property pfm_name {sqrl.com:fk33:sqrl_fk33:2019.1} [get_files {./fk33_sdaccel/fk33_sdaccel.srcs/sources_1/bd/bd/bd.bd}]
set_property dsa.name {sqrl_fk33} [current_project]
set_property dsa.vendor "sqrl.com" [current_project]
set_property dsa.board_id "fk33" [current_project]
set_property dsa.version {2019.1} [current_project]

set_property dsa.uses_pr true [current_project]
set_property dsa.flash_interface_type "spix4" [current_project]
#set_property dsa.flash_offset_address "0x4000000" [current_project]

#set_property pfm_name fk33platform [get_files ./fk33_sdaccel/fk33_sdaccel.srcs/sources_1/bd/bd/bd.bd}]
#set_property dsa.vendor "sqrl" [current_project]
#set_property dsa.name "fk33platform" [current_project]
#set_property dsa.board_id "fk33" [current_project]
#set_property dsa.static_synth_checkpoint false [current_project]
set_property dsa.pcie_id_vendor "0x10ee" [current_project]
set_property dsa.pcie_id_device "0x8038" [current_project]
set_property dsa.pcie_id_subsystem "0x0011" [current_project]
set_property dsa.board_name "sqrl_fk33" [current_project]
set_property dsa.board_interface_type "gen3x1" [current_project]
#set_property dsa.board_memories {{hbm 4GB}} [current_project]
set_property dsa.board_memories {{ddr4 4GB}} [current_project]
set_property dsa.board_interface_name "PCIe" [current_project]
set_property dsa.board_vendor "sqrl.com" [current_project]
##set_property board_part "xcvu33p-fsvh2104-2-e" [current_project]


set_property PFM.CLOCK {axi_aclk {id "0" is_default "true" proc_sys_reset "/xdma_reset"}} [get_bd_cells /xdma]
#set_property PFM.MEMSS {HBM {  HBM_MEM00 "auto preferred"  HBM_MEM01 "auto true"  HBM_MEM02 "auto true"  HBM_MEM03 "auto true"  HBM_MEM04 "auto true"  HBM_MEM05 "auto true"  HBM_MEM06 "auto true"  HBM_MEM07 "auto true"  HBM_MEM08 "auto true"  HBM_MEM09 "auto true"  HBM_MEM10 "auto true"  HBM_MEM11 "auto true"  HBM_MEM12 "auto true"  HBM_MEM13 "auto true"  HBM_MEM14 "auto true"  HBM_MEM15 "auto true"  HBM_MEM16 "auto true"  HBM_MEM17 "auto true"  HBM_MEM18 "auto true"  HBM_MEM19 "auto true"  HBM_MEM20 "auto true"  HBM_MEM21 "auto true"  HBM_MEM22 "auto true"  HBM_MEM23 "auto true"  HBM_MEM24 "auto true"  HBM_MEM25 "auto true"  HBM_MEM26 "auto true"  HBM_MEM27 "auto true"  HBM_MEM28 "auto true"  HBM_MEM29 "auto true"  HBM_MEM30 "auto true"  HBM_MEM31 "auto true"  } } [get_bd_cells hbm]
set_property PFM.AXI_PORT {S02_AXI {memport "MIG" sptag "" memory ""} S03_AXI {memport "MIG" sptag "" memory ""} S04_AXI {memport "MIG" sptag "" memory ""} S05_AXI {memport "MIG" sptag "" memory ""} S06_AXI {memport "MIG" sptag "" memory ""} S07_AXI {memport "MIG" sptag "" memory ""} M02_AXI {memport "MIG" sptag "" memory ""} M03_AXI {memport "MIG" sptag "" memory ""} M04_AXI {memport "MIG" sptag "" memory ""} M05_AXI {memport "MIG" sptag "" memory ""} M06_AXI {memport "MIG" sptag "" memory ""} M07_AXI {memport "MIG" sptag "" memory ""}} [get_bd_cells /axi2pr]
set_property PFM.AXI_PORT {S02_AXI {memport "MIG" sptag "" memory ""} S03_AXI {memport "MIG" sptag "" memory ""} S04_AXI {memport "MIG" sptag "" memory ""} S05_AXI {memport "MIG" sptag "" memory ""} S06_AXI {memport "MIG" sptag "" memory ""} S07_AXI {memport "MIG" sptag "" memory ""} M02_AXI {memport "MIG" sptag "" memory ""} M03_AXI {memport "MIG" sptag "" memory ""} M04_AXI {memport "MIG" sptag "" memory ""} M05_AXI {memport "MIG" sptag "" memory ""} M06_AXI {memport "MIG" sptag "" memory ""} M07_AXI {memport "MIG" sptag "" memory ""}} [get_bd_cells /pr2axi]



#validate_bd_design -include_pfm -force
#open_run impl_1

write_dsa sqrl_fk33_xdma_2019_1.dsa -include_bit -force
