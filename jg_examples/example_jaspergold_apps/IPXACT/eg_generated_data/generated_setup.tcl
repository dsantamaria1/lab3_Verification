#IPK Setup    ------------------------------------------------------------------

if ![info exists ipk_directory] {
    set ipk_directory ""
}
ipk -jdb $ipk_directory/jasper_amba_ahb.jdb

#Design Setup ------------------------------------------------------------------

analyze -sv ./usbhostslave/hostSlaveMuxBI.v ./usbhostslave/slaveSendPacket.v ./usbhostslave/slaveRxStatusMonitor.v ./usbhostslave/SIETransmitter.v ./usbhostslave/speedCtrlMux.v ./usbhostslave/readUSBWireData.v ./usbhostslave/slaveDirectControl.v ./usbhostslave/lineControlUpdate.v ./usbhostslave/processRxBit.v ./usbhostslave/USBSlaveControlBI.v ./usbhostslave/sendPacketCheckPreamble.v ./usbhostslave/USBTxWireArbiter.v ./usbhostslave/updateCRC5.v ./usbhostslave/directControl.v ./usbhostslave/slavecontroller.v ./usbhostslave/RxFifo.v ./usbhostslave/usbSerialInterfaceEngine.v ./usbhostslave/TxFifo.v ./usbhostslave/SOFController.v ./usbhostslave/usbhost.v ./usbhostslave/fifoRTL.v ./usbhostslave/hostSlaveMux.v ./usbhostslave/USBHostControlBI.v ./usbhostslave/hostcontroller.v ./usbhostslave/processTxByte.v ./usbhostslave/SIEReceiver.v ./usbhostslave/fifoMux.v ./usbhostslave/updateCRC16.v ./usbhostslave/getPacket.v ./usbhostslave/SCTxPortArbiter.v ./usbhostslave/usbHostControl.v ./usbhostslave/sendPacket.v ./usbhostslave/usbSlaveControl.v ./usbhostslave/dpMem_dc.v ./usbhostslave/usbhostslave.v ./usbhostslave/wishBoneBI.v ./usbhostslave/SOFTransmit.v ./usbhostslave/TxfifoBI.v ./usbhostslave/endpMux.v ./usbhostslave/processRxByte.v ./usbhostslave/slaveGetPacket.v ./usbhostslave/writeUSBWireData.v ./usbhostslave/usbslave.v ./usbhostslave/sendPacketArbiter.v ./usbhostslave/HCTxPortArbiter.v ./usbhostslave/rxStatusMonitor.v ./usbhostslave/RxfifoBI.v ./simple_spi/simple_spi.v ./simple_spi/fifo4.v ./cfi_ctrl/cfi_ctrl_engine.v ./cfi_ctrl/cfi_ctrl.v ./i2c_master_slave/i2c_master_slave.v ./i2c_master_slave/i2c_master_byte_ctrl.v ./i2c_master_slave/i2c_master_bit_ctrl.v ./clkgen/clkgen.v ./ram_wb/ram_wb_b3.v ./ram_wb/ram_wb.v ./arbiter/arbiter_dbus.v ./arbiter/arbiter_ibus.v ./arbiter/arbiter_bytebus.v ./dbg_if/dbg_cpu_registers.v ./dbg_if/dbg_register.v ./dbg_if/dbg_if.v ./dbg_if/dbg_cpu.v ./dbg_if/dbg_wb.v ./dbg_if/dbg_crc32_d1.v ./intgen/intgen.v ./ethmac/xilinx_dist_ram_16x32.v ./ethmac/eth_outputcontrol.v ./ethmac/eth_miim.v ./ethmac/eth_clockgen.v ./ethmac/eth_transmitcontrol.v ./ethmac/eth_maccontrol.v ./ethmac/eth_rxcounters.v ./ethmac/eth_fifo.v ./ethmac/eth_rxaddrcheck.v ./ethmac/eth_wishbone.v ./ethmac/eth_crc.v ./ethmac/eth_txstatem.v ./ethmac/eth_shiftreg.v ./ethmac/eth_txcounters.v ./ethmac/ethmac.v ./ethmac/eth_rxethmac.v ./ethmac/eth_receivecontrol.v ./ethmac/eth_spram_256x32.v ./ethmac/eth_register.v ./ethmac/eth_macstatus.v ./ethmac/eth_registers.v ./ethmac/eth_txethmac.v ./ethmac/eth_rxstatem.v ./ethmac/eth_random.v ./orpsoc_top/orpsoc_top.v ./wb_ram_b3/wb_ram_b3.v ./uart16550/uart_receiver.v ./uart16550/uart16550.v ./uart16550/uart_regs.v ./uart16550/raminfr.v ./uart16550/uart_debug_if.v ./uart16550/uart_tfifo.v ./uart16550/uart_transmitter.v ./uart16550/uart_sync_flops.v ./uart16550/uart_wb.v ./uart16550/uart_rfifo.v ./wb_switch_b3/wb_switch_b3.v ./smii/smii.v ./smii/smii_if.v ./smii/smii_sync.v ./rom/rom.v ./jtag_tap/jtag_tap.v +incdir+verilog +incdir+include
analyze -sv ./or1200/or1200_pic.v ./or1200/or1200_fpu_post_norm_intfloat_conv.v ./or1200/or1200_spram_64x22.v ./or1200/or1200_tt.v ./or1200/or1200_top.v ./or1200/or1200_spram_64x24.v ./or1200/or1200_wb_biu.v ./or1200/or1200_alu.v ./or1200/or1200_dc_fsm.v ./or1200/or1200_dpram_256x32.v ./or1200/or1200_spram_1024x8.v ./or1200/or1200_mem2reg.v ./or1200/or1200_fpu_post_norm_div.v ./or1200/or1200_fpu_pre_norm_addsub.v ./or1200/or1200_dc_tag.v ./or1200/or1200_spram_2048x32_bw.v ./or1200/or1200_dpram_32x32.v ./or1200/or1200_spram_1024x32.v ./or1200/or1200_wbmux.v ./or1200/or1200_freeze.v ./or1200/or1200_cpu.v ./or1200/or1200_fpu_addsub.v ./or1200/or1200_operandmuxes.v ./or1200/or1200_dc_top.v ./or1200/or1200_qmem_top.v ./or1200/or1200_fpu_div.v ./or1200/or1200_ic_tag.v ./or1200/or1200_spram_32_bw.v ./or1200/or1200_rf.v ./or1200/or1200_sb.v ./or1200/or1200_except.v ./or1200/or1200_if.v ./or1200/or1200_fpu_post_norm_mul.v ./or1200/or1200_reg2mem.v ./or1200/or1200_fpu_fcmp.v ./or1200/or1200_spram_256x21.v ./or1200/or1200_sb_fifo.v ./or1200/or1200_dpram.v ./or1200/or1200_rfram_generic.v ./or1200/or1200_fpu_intfloat_conv_except.v ./or1200/or1200_gmultp2_32x32.v ./or1200/or1200_spram_512x20.v ./or1200/or1200_amultp2_32x32.v ./or1200/or1200_dmmu_top.v ./or1200/or1200_fpu_mul.v ./or1200/or1200_ic_fsm.v ./or1200/or1200_fpu.v ./or1200/or1200_spram.v ./or1200/or1200_genpc.v ./or1200/or1200_fpu_pre_norm_mul.v ./or1200/or1200_fpu_post_norm_addsub.v ./or1200/or1200_immu_tlb.v ./or1200/or1200_fpu_arith.v ./or1200/or1200_spram_2048x32.v ./or1200/or1200_spram_32x24.v ./or1200/or1200_dc_ram.v ./or1200/or1200_immu_top.v ./or1200/or1200_fpu_pre_norm_div.v ./or1200/or1200_spram_1024x32_bw.v ./or1200/or1200_spram_64x14.v ./or1200/or1200_du.v ./or1200/or1200_lsu.v ./or1200/or1200_ic_top.v ./or1200/or1200_fpu_intfloat_conv.v ./or1200/or1200_dmmu_tlb.v ./or1200/or1200_tpram_32x32.v ./or1200/or1200_spram_2048x8.v ./or1200/or1200_sprs.v ./or1200/or1200_xcv_ram32x8d.v ./or1200/or1200_cfgr.v ./or1200/or1200_pm.v ./or1200/or1200_ctrl.v ./or1200/or1200_ic_ram.v ./or1200/or1200_mult_mac.v ./or1200/or1200_spram_128x32.v +incdir+verilog
analyze -sv ahb/ahb2wb.v +incdir+verilog

elaborate -top orpsoc_top  -bbox_m ram_wb_b3

#Proofkit Setup ----------------------------------------------------------------

#Note: The proofkit files must be loaded before the monitors can be instantiated.

connect -bind {jasper_amba_ahb_sv} {orpsoc_top_ahb}  \
	-parameter {VERIFY_BLK} {2} \
    -connect {HCLK} {clk_pad_i} \
    -connect {HRESETn} {rst_n_pad_i} \
    -connect {HADDR} {haddr[17:2]} \
    -connect {HTRANS} {htrans} \
    -connect {HWRITE} {hwrite} \
    -connect {HSIZE} {hsize} \
    -connect {HBURST} {hburst} \
    -connect {HSEL} {hsel} \
    -connect {HWDATA} {hwdata} \
    -connect {HRDATA} {hrdata} \
    -connect {HRESP} {hresp} \
    -connect {HREADY} {hready} \
    -connect {HPROT} {hprot} \
    -connect {HREADYOUT} {1'b1} \

connect -elaborate
