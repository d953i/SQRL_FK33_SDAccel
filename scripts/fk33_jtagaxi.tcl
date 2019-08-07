run_hw_axi [create_hw_axi_txn Jtag2AXI [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x0000003F -type write -force]


##run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200010000 -data 0x0000000000000044 -type write -size 64 -force]
#run_hw_axi [create_hw_axi_txn Jtag2AXI [get_hw_axis hw_axi_1] -address 0x200000124 -data 0x0000003F00000000 -type write -force]

run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800100 -data 0x00000003 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800108 -data 0x0000012C -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800108 -data 0x00000000 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800108 -data 0x00000044 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800100 -data 0x00000200 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x40800100 -data 0x00000009 -type write -force]

run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000108 -data 0x0000000000000000 -type write -force]

run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000100 -data 0x0000000000000000 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000100 -data 0x0000000100000000 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000100 -data 0x0000000300000000 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000100 -data 0x0000000900000000 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000108 -data 0x0000012C00000000 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000108 -data 0x0000000000000000 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000108 -data 0x0000024400000000 -type write -force]

run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000100 -data 0x0000000D00000000 -type write -force]
run_hw_axi [create_hw_axi_txn setVCCINT [get_hw_axis hw_axi_1] -address 0x200000100 -data 0x0000000900000000 -type write -force]