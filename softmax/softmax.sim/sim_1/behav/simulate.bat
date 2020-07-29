@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim Softmax_Layer_tb_behav -key {Behavioral:sim_1:Functional:Softmax_Layer_tb} -tclbatch Softmax_Layer_tb.tcl -view D:/Softmax_CNN/softmax/Softmax_Layer_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
