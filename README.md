# Softmax_CNN
This repository contains full code of Softmax Layer in Verilog using Vivado.

-----------------------------  Each unit Verilog code --------------------------------  

•	exponential.v

This module to calculate exponential of floating point input by using Taylor expansion method. It calls module term.v that multiply input number by its powered then multiply by constant by using mul.v modules and calls addition to sum the calculated 6 terms.



•	division.v

The division module based on Newton Raphson method to calculate reciprocal of divisor in reciporical.v.



•	reciporical.v

By using algorithm of Newton Raphson method to calculate reciprocal of Divisor

The used algorithm TAKEN FROM: 
1-	https://stackoverflow.com/questions/9220498/newtons-method-for-finding-the-reciprocal-of-a-floating-point-number-for-divisi

2-	https://en.wikipedia.org/wiki/Division_algorithm#Newton.E2.80.93Raphson_division

It calls module Xncalculation.v (THIS MODULE FOR CALCULATING Xn value as    X = X * (2-D*X) ) then multiply  reciprocal (Xn) by Dividend.



•	maxValue.v

This module compares between 2 consequative numbers' exponent in array to get larger, but if two exponents equal, it compares two mantissas. (all values of input array are positive as it is output of exponential module no need to check on sign bit)



•	Sofmax_Layer.v

This module take 1D input array and applies exponential.v, then apply Accumlator1.v on the exponential array to get summation, then applies division.v to calculate probability of each element then applies maxValue.v to get largest output.

