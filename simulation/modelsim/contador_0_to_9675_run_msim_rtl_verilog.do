transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/contador_0_to_9675 {C:/Users/Madera/Documents/Quartus_Workspace/contador_0_to_9675/counters_controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/contador_0_to_9675 {C:/Users/Madera/Documents/Quartus_Workspace/contador_0_to_9675/counter.v}

vlog -vlog01compat -work work +incdir+C:/Users/Madera/Documents/Quartus_Workspace/contador_0_to_9675/test_bench {C:/Users/Madera/Documents/Quartus_Workspace/contador_0_to_9675/test_bench/tb_counters_controller.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_counters_controller

add wave *
view structure
view signals
run -all
