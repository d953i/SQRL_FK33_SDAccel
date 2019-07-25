
set_property pfm_name {squirrelsresearch.com:fk33:fk33platform:2019.1} [get_files {./fk33_sdaccel/fk33_sdaccel.srcs/sources_1/bd/bd/bd.bd}]
set_property dsa.name {fk33platform} [current_project]
set_property dsa.vendor "squirrelsresearch.com" [current_project]
set_property dsa.board_id "fk33" [current_project]
set_property dsa.version {2019.1} [current_project]

#set_property pfm_name fk33platform [get_files ./fk33_sdaccel/fk33_sdaccel.srcs/sources_1/bd/bd/bd.bd}]
#set_property dsa.vendor "sqrl" [current_project]
#set_property dsa.name "fk33platform" [current_project]
#set_property dsa.board_id "fk33" [current_project]

#set_property dsa.flash_interface_type “spix4” [current_project]
#set_property dsa.version "1.0" [current_project]

set_property PFM.CLOCK {axi_aclk {id "1" is_default "true" proc_sys_reset "/xdma_reset"}} [get_bd_cells /xdma]
set_property PFM.AXI_PORT {M02_AXI {memport "MIG" sptag "" memory ""} M03_AXI {memport "MIG" sptag "" memory ""} M04_AXI {memport "MIG" sptag "" memory ""} M05_AXI {memport "MIG" sptag "" memory ""} M06_AXI {memport "MIG" sptag "" memory ""} M07_AXI {memport "MIG" sptag "" memory ""}} [get_bd_cells /axi2pr]
set_property PFM.AXI_PORT {S02_AXI {memport "MIG" sptag "" memory ""} S03_AXI {memport "MIG" sptag "" memory ""} S04_AXI {memport "MIG" sptag "" memory ""} S05_AXI {memport "MIG" sptag "" memory ""} S06_AXI {memport "MIG" sptag "" memory ""} S07_AXI {memport "MIG" sptag "" memory ""}} [get_bd_cells /pr2axi]

#set_property dsa.uses_pr true [current_project]
#set_property dsa.static_synth_checkpoint false [current_project]

#set_property dsa.pcie_id_vendor "0x10ee" [current_project]
#set_property dsa.pcie_id_device "0x8038" [current_project]
#set_property dsa.pcie_id_subsystem "0x0011" [current_project]
#set_property dsa.board_name "sqrl:fk33" [current_project]
#set_property dsa.board_interface_type "gen3x1" [current_project]
#set_property dsa.board_memories {{hbm 4GB}} [current_project]
#set_property dsa.board_interface_name "PCIe" [current_project]
#set_property dsa.board_vendor "squirrelsresearch.com" [current_project]
##set_property board_part "xcvu33p-fsvh2104-2-e" [current_project]

validate_bd_design -include_pfm -force

write_dsa sqrl_fk33_xdma_2019_1.dsa -include_bit
