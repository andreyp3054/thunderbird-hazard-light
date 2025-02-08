transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/quartus/laboratory_activities/lab9 {D:/quartus/laboratory_activities/lab9/clk_div.v}
vlog -vlog01compat -work work +incdir+D:/quartus/laboratory_activities/lab9 {D:/quartus/laboratory_activities/lab9/thunderbird.v}
vlog -vlog01compat -work work +incdir+D:/quartus/laboratory_activities/lab9 {D:/quartus/laboratory_activities/lab9/thunderbird_wrapper.v}

