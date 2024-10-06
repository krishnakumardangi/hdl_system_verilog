# System Verilog for HDL

Hardware Description Languages (HDL) like Verilog and VHDL are used to describe hardware behavior so that it can be converted to digital blocks made up of combinational gates and sequential elements. In order to verify that the hardware description in HDL is correct, there is a need for a language with more features in OOP that will support complicated testing procedures and is often called a Hardware Verification Language.
SystemVerilog is an extension of Verilog with many such verification features that allow engineers to verify the design using complex testbench structures and random stimuli in simulation.

# Verilog For Hardware Description Language

# Tools
* vim
	- A simple text editor to write and create a verilog file with *.v extension.
* [iverilog](https://steveicarus.github.io/iverilog/index.html)
	- To compile a verilog code. `If all module and test bench are in same file.`
```
$ iverilog fileName.v      
```
`Or by using below.`
```
$ iverilog module1.v module2.v testBench.v
```

* gtkwake
	- For GUI observation using software called gtkwave. `For this, you have to use "$dumpfile("fileName.vcd");" and "$dumpvars(0, testBench);" functions in testBench module of verilog code.`
```
$ gtkwave fileName.vcd
```



# Abstraction in Modern Computing System

* Application
* Algorithm
* Programming Language
* Operating System/vertual Machines
* Instruction Set Architecture
* Micro-architecture
* Register-Transfer Level
* Gates
* Circuits
* Devices
* Physics

And Computer Architecture provide feedback to guide application and technology resesrch directions. That is ISA, Micro-Architecture and RTL.
