# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a200tfbg676-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/Softmax_CNN/softmax/softmax.cache/wt [current_project]
set_property parent.project_path D:/Softmax_CNN/softmax/softmax.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:ac701:part0:1.0 [current_project]
read_verilog -library xil_defaultlib {
  D:/Softmax_CNN/softmax/softmax.srcs/sources_1/new/mul.v
  D:/Softmax_CNN/softmax/softmax.srcs/sources_1/new/add.v
  D:/Softmax_CNN/softmax/softmax.srcs/sources_1/new/Xncalculation.v
  D:/Softmax_CNN/softmax/softmax.srcs/sources_1/new/term.v
  D:/Softmax_CNN/softmax/softmax.srcs/sources_1/new/reciporical.v
  D:/Softmax_CNN/softmax/softmax.srcs/sources_1/new/maxValue.v
  D:/Softmax_CNN/softmax/softmax.srcs/sources_1/new/exponential.v
  D:/Softmax_CNN/softmax/softmax.srcs/sources_1/new/Accumulator1.v
  D:/Softmax_CNN/softmax/softmax.srcs/sources_1/new/Softmax_Layer.v
}
synth_design -top Softmax_Layer -part xc7a200tfbg676-2
write_checkpoint -noxdef Softmax_Layer.dcp
catch { report_utilization -file Softmax_Layer_utilization_synth.rpt -pb Softmax_Layer_utilization_synth.pb }
