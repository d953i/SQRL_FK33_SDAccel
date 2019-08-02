create_hw_axi_txn write0 [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x00000000 -type write -force
create_hw_axi_txn write1 [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x00000001 -type write -force
create_hw_axi_txn write2 [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x00000002 -type write -force
create_hw_axi_txn write3 [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x00000003 -type write -force
create_hw_axi_txn write4 [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x00000004 -type write -force
create_hw_axi_txn write5 [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x00000005 -type write -force
create_hw_axi_txn write6 [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x00000006 -type write -force
create_hw_axi_txn write7 [get_hw_axis hw_axi_1] -address 0x40000000 -data 0x00000007 -type write -force

run_hw_axi write1
