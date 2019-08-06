run_hw_axi [create_hw_axi_txn Jtag2AXI [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x0000003F -type write -force]


##run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200010000 -data 0x0000000000000044 -type write -size 64 -force]

run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800100 -data 0x00000003 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800108 -data 0x0000002C -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800108 -data 0x00000044 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800100 -data 0x0000000D -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800108 -data 0x00000044 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800100 -data 0x00000009 -type write -force]
