connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B7A80EA" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B7A80EA-13722093-0"}
fpga -file E:/GitHub/zybo-z7-10-Audio-Project/Zybo-Z7-10-DMA/_ide/bitstream/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw E:/GitHub/zybo-z7-10-Audio-Project/system_wrapper/export/system_wrapper/hw/system_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source E:/GitHub/zybo-z7-10-Audio-Project/Zybo-Z7-10-DMA/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow E:/GitHub/zybo-z7-10-Audio-Project/Zybo-Z7-10-DMA/Debug/Zybo-Z7-10-DMA.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
