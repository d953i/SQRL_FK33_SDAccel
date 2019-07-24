
set_property pfm.name fk33 [get_files ...]
set_property dsa.vendor "xilinx" [current_project]
set_property dsa.name "fk33" [current_project]
set_property dsa.board_id "sqrl-fk33" [current_project]

set_property dsa.flash_interface_type “spix4” [current_project]
set_property dsa.version "1.0" [current_project]

set_property dsa.uses_pr true [current_project]
#set_property dsa.static_synth_checkpoint false [current_project]

set_property dsa.pcie_id_vendor "0x10ee" [current_project]
set_property dsa.pcie_id_device "0x8038" [current_project]
set_property dsa.pcie_id_subsystem "0x0011" [current_project]
set_property dsa.board_name "sqrl:fk33:a3" [current_project]
set_property dsa.board_interface_type "gen3x16" [current_project]
set_property dsa.board_memories {{hbm 8GB}} [current_project]
set_property dsa.board_interface_name "PCIe" [current_project]
set_property dsa.board_vendor "squirrelsresearch.com" [current_project]
#set_property board_part "xcvu33p-fsvh2104-2-e" [current_project]

write_dsa sqrl_fk33_2019_1.dsa -include_bit