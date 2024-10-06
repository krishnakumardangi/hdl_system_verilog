# System Verilog for HDL

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
