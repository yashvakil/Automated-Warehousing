# CSE 579 Warehousing Problem

- The following is our implementation for the Automated Warehouse Scenario, details about which can be found in the [ASP challenge 2019](https://sites.google.com/view/aspcomp2019/problem-domains)
- We have succesfully completed the project, please find below the directory structure

	- simpleInstances
	**It contains the various initialization files for checking the working of the system.**
		+ inst1.asp
		+ inst2.asp
		+ inst3.asp
		+ inst4.asp
		+ inst5.asp
    
	- convert_input.asp
	**It changes the input file schema to an easily readable and understanble form that we used to implement the constraints of the project.**
	
	- parsing.asp
	**This file contains code for obtaining various values for the number of objects and their type in the system.**
	
	- demo.asp
	**The main file where the code for all the constraints resides including**
	
  - description.pdf
  **The pdf containing the problem statement and description of the system.**
  
	- script.py
	**A python file for easier execution of the program.**

## How to Run
1. Make sure you have **python** configured on the system.
2. Make sure you have **clingo** configured on the system.
3. Download the project into a suitable folder on your local computer.
4. Run the **script.py** file to test the project.

## Command Lines and Outputs of all the instances

#### Instance 1
C:\Users\Anish\Desktop\Master\CSE579Warehouseing>python script.py

 | code   |  Instance File    |
 |--------:|:----------------:|
 | 1      |  inst1.asp        |
 | 2      |  inst2.asp        |
 | 3      |  inst3.asp        |
 | 4      |  inst4.asp        |
 | 5      |  inst5.asp        |

Please enter the code for the instance file: 1


---------- RUNNING ----------


clingo version 5.4.0
Reading from demo.asp ...
Solving...
Answer: 1
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),move(0,1),5) occurs(object(robot,1),move(0,-1),6) occurs(object(robot,2),move(0,-1),7) occurs(object(robot,1),move(0,1),8) occurs(object(robot,2),pickup,0) occurs(object(robot,1),pickup,2) occurs(object(robot,2),pickup,6) occurs(object(robot,1),pickup,7) occurs(object(robot,2),putdown,4) occurs(object(robot,1),putdown,5) occurs(object(robot,2),deliver(2,2,1),3) occurs(object(robot,1),deliver(1,1,1),4) occurs(object(robot,1),deliver(1,3,4),9) occurs(object(robot,2),deliver(3,4,1),9) timeTaken(9) numActions(19)
Optimization: 64
OPTIMUM FOUND

Models       : 1
  Optimum    : yes
Optimization : 64
Calls        : 1
Time         : 0.377s (Solving: 0.25s 1st Model: 0.13s Unsat: 0.13s)
CPU Time     : 0.375s


#### Instance 2
C:\Users\Anish\Desktop\Master\CSE579Warehouseing>python script.py

 | code   |  Instance File    |
 |--------:|:----------------:|
 | 1      |  inst1.asp        |
 | 2      |  inst2.asp        |
 | 3      |  inst3.asp        |
 | 4      |  inst4.asp        |
 | 5      |  inst5.asp        |


Please enter the code for the instance file: 2


---------- RUNNING ----------


clingo version 5.4.0
Reading from demo.asp ...
Solving...
Answer: 1
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,1),move(0,-1),2) occurs(object(robot,2),move(0,1),3) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(-1,0),4) occurs(object(robot,1),move(-1,0),5) occurs(object(robot,2),move(-1,0),5) occurs(object(robot,1),move(0,1),6) occurs(object(robot,1),move(0,-1),7) occurs(object(robot,1),move(1,0),8) occurs(object(robot,2),move(1,0),8) occurs(object(robot,1),move(1,0),9) occurs(object(robot,2),move(-1,0),10) occurs(object(robot,2),pickup,2) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,9) occurs(object(robot,2),putdown,7) occurs(object(robot,2),deliver(1,3,2),6) occurs(object(robot,1),deliver(2,2,1),10) occurs(object(robot,2),deliver(1,1,1),11) timeTaken(11) numActions(22)
Optimization: 88
Answer: 2
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(1,0),1) occurs(object(robot,1),move(-1,0),2) occurs(object(robot,1),move(0,-1),3) occurs(object(robot,2),move(0,1),3) occurs(object(robot,2),move(-1,0),4) occurs(object(robot,1),move(0,-1),5) occurs(object(robot,2),move(-1,0),5) occurs(object(robot,1),move(1,0),6) occurs(object(robot,2),move(1,0),8) occurs(object(robot,1),move(-1,0),9) occurs(object(robot,1),move(1,0),10) occurs(object(robot,2),move(-1,0),10) occurs(object(robot,2),pickup,2) occurs(object(robot,1),pickup,4) occurs(object(robot,2),pickup,9) occurs(object(robot,2),putdown,7) occurs(object(robot,1),putdown,8) occurs(object(robot,2),deliver(1,3,2),6) occurs(object(robot,1),deliver(2,2,1),7) occurs(object(robot,2),deliver(1,1,1),11) timeTaken(11) numActions(21)
Optimization: 87
Answer: 3
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,1),move(0,-1),2) occurs(object(robot,2),move(0,1),3) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(-1,0),4) occurs(object(robot,1),move(1,0),5) occurs(object(robot,2),move(-1,0),5) occurs(object(robot,2),move(1,0),8) occurs(object(robot,1),move(-1,0),9) occurs(object(robot,2),move(-1,0),10) occurs(object(robot,2),pickup,2) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,9) occurs(object(robot,2),putdown,7) occurs(object(robot,2),deliver(1,3,2),6) occurs(object(robot,1),deliver(2,2,1),7) occurs(object(robot,2),deliver(1,1,1),11) timeTaken(11) numActions(19)
Optimization: 85
Answer: 4
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,1),move(0,-1),2) occurs(object(robot,2),move(0,1),3) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(-1,0),4) occurs(object(robot,1),move(1,0),5) occurs(object(robot,2),move(-1,0),5) occurs(object(robot,2),move(1,0),8) occurs(object(robot,2),move(-1,0),10) occurs(object(robot,2),pickup,2) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,9) occurs(object(robot,2),putdown,7) occurs(object(robot,2),deliver(1,3,2),6) occurs(object(robot,1),deliver(2,2,1),7) occurs(object(robot,2),deliver(1,1,1),11) timeTaken(11) numActions(18)
Optimization: 84
Answer: 5
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(1,0),1) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,1),move(-1,0),5) occurs(object(robot,2),move(0,1),5) occurs(object(robot,1),move(1,0),7) occurs(object(robot,2),move(0,1),7) occurs(object(robot,1),move(0,-1),8) occurs(object(robot,2),move(-1,0),8) occurs(object(robot,2),move(-1,0),9) occurs(object(robot,1),move(1,0),10) occurs(object(robot,2),pickup,0) occurs(object(robot,1),pickup,4) occurs(object(robot,2),pickup,6) occurs(object(robot,2),putdown,4) occurs(object(robot,1),putdown,9) occurs(object(robot,2),deliver(2,2,1),3) occurs(object(robot,1),deliver(1,1,1),6) occurs(object(robot,2),deliver(1,3,2),10) timeTaken(10) numActions(20)
Optimization: 75
Answer: 6
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(1,0),1) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,1),move(-1,0),5) occurs(object(robot,2),move(0,1),5) occurs(object(robot,1),move(1,0),7) occurs(object(robot,2),move(0,1),7) occurs(object(robot,1),move(0,-1),8) occurs(object(robot,2),move(-1,0),8) occurs(object(robot,2),move(-1,0),9) occurs(object(robot,2),pickup,0) occurs(object(robot,1),pickup,4) occurs(object(robot,2),pickup,6) occurs(object(robot,2),putdown,4) occurs(object(robot,1),putdown,9) occurs(object(robot,2),deliver(2,2,1),3) occurs(object(robot,1),deliver(1,1,1),6) occurs(object(robot,2),deliver(1,3,2),10) timeTaken(10) numActions(19)
Optimization: 74
Answer: 7
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(1,0),1) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,1),move(-1,0),5) occurs(object(robot,2),move(0,1),5) occurs(object(robot,1),move(1,0),7) occurs(object(robot,2),move(0,1),7) occurs(object(robot,1),move(0,-1),8) occurs(object(robot,2),move(-1,0),8) occurs(object(robot,2),move(-1,0),9) occurs(object(robot,2),pickup,0) occurs(object(robot,1),pickup,4) occurs(object(robot,2),pickup,6) occurs(object(robot,2),putdown,4) occurs(object(robot,2),deliver(2,2,1),3) occurs(object(robot,1),deliver(1,1,1),6) occurs(object(robot,2),deliver(1,3,2),10) timeTaken(10) numActions(18)
Optimization: 73
Answer: 8
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(0,-1),1) occurs(object(robot,2),move(1,0),2) occurs(object(robot,1),move(-1,0),4) occurs(object(robot,2),move(0,1),5) occurs(object(robot,1),move(1,0),6) occurs(object(robot,2),move(-1,0),7) occurs(object(robot,2),move(-1,0),8) occurs(object(robot,2),move(0,1),9) occurs(object(robot,2),pickup,0) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,6) occurs(object(robot,2),putdown,4) occurs(object(robot,2),deliver(2,2,1),3) occurs(object(robot,1),deliver(1,1,1),5) occurs(object(robot,2),deliver(1,3,2),10) timeTaken(10) numActions(17)
Optimization: 72
OPTIMUM FOUND

Models       : 8
  Optimum    : yes
Optimization : 72
Calls        : 1
Time         : 0.886s (Solving: 0.77s 1st Model: 0.14s Unsat: 0.31s)
CPU Time     : 0.891s


#### Instance 3
C:\Users\Anish\Desktop\Master\CSE579Warehouseing>python script.py

 | code   |  Instance File    |
 |--------:|:----------------:|
 | 1      |  inst1.asp        |
 | 2      |  inst2.asp        |
 | 3      |  inst3.asp        |
 | 4      |  inst4.asp        |
 | 5      |  inst5.asp        |

Please enter the code for the instance file: 3


---------- RUNNING ----------


clingo version 5.4.0
Reading from demo.asp ...
Solving...
Answer: 1
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(0,1),0) occurs(object(robot,1),move(0,-1),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,1),move(-1,0),2) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(0,-1),4) occurs(object(robot,2),move(0,1),7) occurs(object(robot,1),move(1,0),8) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,3) occurs(object(robot,2),putdown,8) occurs(object(robot,2),deliver(2,4,1),6) occurs(object(robot,1),deliver(1,2,1),9) timeTaken(8) numActions(15)
Optimization: 55
Answer: 2
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(0,1),0) occurs(object(robot,1),move(0,-1),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,1),move(-1,0),2) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(0,-1),4) occurs(object(robot,2),move(0,1),7) occurs(object(robot,1),move(1,0),8) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,3) occurs(object(robot,2),deliver(2,4,1),6) occurs(object(robot,1),deliver(1,2,1),9) timeTaken(8) numActions(14)
Optimization: 54
Answer: 3
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(0,1),0) occurs(object(robot,1),move(0,-1),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,1),move(-1,0),2) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(0,-1),4) occurs(object(robot,1),move(1,0),8) occurs(object(robot,2),move(0,1),8) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,3) occurs(object(robot,2),deliver(2,4,1),6) occurs(object(robot,1),deliver(1,2,1),9) timeTaken(7) numActions(14)
Optimization: 47
Answer: 4
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(0,-1),1) occurs(object(robot,1),move(1,0),3) occurs(object(robot,2),move(1,0),3) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(0,-1),4) occurs(object(robot,1),move(-1,0),8) occurs(object(robot,2),move(0,1),8) occurs(object(robot,2),pickup,1) occurs(object(robot,1),pickup,2) occurs(object(robot,2),deliver(1,2,1),5) occurs(object(robot,1),deliver(2,4,1),9) timeTaken(7) numActions(12)
Optimization: 44
Answer: 5
occurs(object(robot,1),move(0,-1),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(0,1),1) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(0,-1),4) occurs(object(robot,1),move(1,0),7) occurs(object(robot,2),move(1,0),7) occurs(object(robot,1),pickup,2) occurs(object(robot,2),pickup,3) occurs(object(robot,1),deliver(2,4,1),6) occurs(object(robot,2),deliver(1,2,1),8) timeTaken(7) numActions(12)
Optimization: 43
Answer: 6
occurs(object(robot,1),move(-1,0),1) occurs(object(robot,1),move(0,-1),2) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(0,-1),4) occurs(object(robot,1),move(1,0),7) occurs(object(robot,2),move(1,0),7) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,3) occurs(object(robot,1),deliver(2,4,1),6) occurs(object(robot,2),deliver(1,2,1),9) timeTaken(6) numActions(10)
Optimization: 42
Answer: 7
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(0,-1),2) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(0,-1),4) occurs(object(robot,1),move(1,0),7) occurs(object(robot,2),move(1,0),7) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,3) occurs(object(robot,1),deliver(2,4,1),6) occurs(object(robot,2),deliver(1,2,1),9) timeTaken(6) numActions(10)
Optimization: 41
Answer: 8
occurs(object(robot,1),move(0,-1),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(0,-1),4) occurs(object(robot,1),move(1,0),7) occurs(object(robot,2),move(1,0),7) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,3) occurs(object(robot,1),deliver(2,4,1),6) occurs(object(robot,2),deliver(1,2,1),9) timeTaken(6) numActions(10)
Optimization: 40
Answer: 9
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(0,-1),1) occurs(object(robot,1),move(0,-1),4) occurs(object(robot,2),move(0,-1),4) occurs(object(robot,1),move(1,0),7) occurs(object(robot,2),move(1,0),7) occurs(object(robot,1),pickup,3) occurs(object(robot,2),pickup,3) occurs(object(robot,1),deliver(2,4,1),6) occurs(object(robot,2),deliver(1,2,1),8) timeTaken(6) numActions(10)
Optimization: 39
Answer: 10
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(0,-1),1) occurs(object(robot,1),move(0,-1),3) occurs(object(robot,2),move(0,-1),3) occurs(object(robot,1),move(0,1),5) occurs(object(robot,2),move(1,0),5) occurs(object(robot,1),move(1,0),6) occurs(object(robot,2),pickup,1) occurs(object(robot,1),pickup,2) occurs(object(robot,1),deliver(2,4,1),4) occurs(object(robot,2),deliver(1,2,1),6) timeTaken(6) numActions(11)
Optimization: 32
Answer: 11
occurs(object(robot,1),move(0,-1),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,1),move(0,-1),3) occurs(object(robot,2),move(0,-1),3) occurs(object(robot,1),move(0,1),5) occurs(object(robot,2),move(1,0),5) occurs(object(robot,2),pickup,1) occurs(object(robot,1),pickup,2) occurs(object(robot,1),deliver(2,4,1),4) occurs(object(robot,2),deliver(1,2,1),6) timeTaken(6) numActions(10)
Optimization: 31
OPTIMUM FOUND

Models       : 11
  Optimum    : yes
Optimization : 31
Calls        : 1
Time         : 0.273s (Solving: 0.21s 1st Model: 0.00s Unsat: 0.07s)
CPU Time     : 0.281s


#### Instance 4
C:\Users\Anish\Desktop\Master\CSE579Warehouseing>python script.py

 | code   |  Instance File    |
 |--------:|:----------------:|
 | 1      |  inst1.asp        |
 | 2      |  inst2.asp        |
 | 3      |  inst3.asp        |
 | 4      |  inst4.asp        |
 | 5      |  inst5.asp        |

Please enter the code for the instance file: 4


---------- RUNNING ----------


clingo version 5.4.0
Reading from demo.asp ...
Solving...
Answer: 1
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),pickup,0) occurs(object(robot,1),pickup,2) occurs(object(robot,2),deliver(3,2,1),3) occurs(object(robot,2),deliver(3,2,1),5) occurs(object(robot,1),deliver(1,1,1),9) occurs(object(robot,2),deliver(2,2,1),9) timeTaken(5) numActions(11)
Optimization: 31
Answer: 2
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),pickup,0) occurs(object(robot,1),pickup,2) occurs(object(robot,2),deliver(3,2,1),3) occurs(object(robot,2),deliver(3,2,1),4) occurs(object(robot,1),deliver(1,1,1),9) occurs(object(robot,2),deliver(2,2,1),9) timeTaken(5) numActions(11)
Optimization: 30
Answer: 3
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),move(0,-1),3) occurs(object(robot,2),pickup,1) occurs(object(robot,1),pickup,2) occurs(object(robot,2),deliver(2,2,1),5) occurs(object(robot,1),deliver(1,1,1),7) occurs(object(robot,2),deliver(3,2,2),7) timeTaken(5) numActions(10)
Optimization: 28
Answer: 4
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),move(0,-1),3) occurs(object(robot,2),pickup,1) occurs(object(robot,1),pickup,2) occurs(object(robot,2),deliver(2,2,1),4) occurs(object(robot,1),deliver(1,1,1),7) occurs(object(robot,2),deliver(3,2,2),7) timeTaken(5) numActions(10)
Optimization: 27
Answer: 5
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),pickup,0) occurs(object(robot,1),pickup,2) occurs(object(robot,2),deliver(2,2,1),3) occurs(object(robot,1),deliver(1,1,1),7) occurs(object(robot,2),deliver(3,2,2),7) timeTaken(4) numActions(10)
Optimization: 23
Answer: 6
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,2),move(0,-1),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),pickup,0) occurs(object(robot,1),pickup,2) occurs(object(robot,2),deliver(2,2,1),3) occurs(object(robot,1),deliver(1,1,1),4) occurs(object(robot,2),deliver(3,2,2),4) timeTaken(4) numActions(10)
Optimization: 20
OPTIMUM FOUND

Models       : 6
  Optimum    : yes
Optimization : 20
Calls        : 1
Time         : 0.300s (Solving: 0.18s 1st Model: 0.01s Unsat: 0.10s)
CPU Time     : 0.313s


#### Instance 5
C:\Users\Anish\Desktop\Master\CSE579Warehouseing>python script.py

 | code   |  Instance File    |
 |--------:|:----------------:|
 | 1      |  inst1.asp        |
 | 2      |  inst2.asp        |
 | 3      |  inst3.asp        |
 | 4      |  inst4.asp        |
 | 5      |  inst5.asp        |

Please enter the code for the instance file: 5


---------- RUNNING ----------


clingo version 5.4.0
Reading from demo.asp ...
Solving...
Answer: 1
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(-1,0),0) occurs(object(robot,1),move(0,1),2) occurs(object(robot,2),move(0,1),2) occurs(object(robot,2),move(1,0),6) occurs(object(robot,2),move(-1,0),8) occurs(object(robot,2),pickup,1) occurs(object(robot,2),pickup,7) occurs(object(robot,2),putdown,5) occurs(object(robot,2),deliver(1,3,3),3) occurs(object(robot,2),deliver(1,3,1),4) occurs(object(robot,2),deliver(1,1,1),9) timeTaken(9) numActions(12)
Optimization: 57
Answer: 2
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(-1,0),0) occurs(object(robot,2),move(0,1),2) occurs(object(robot,2),move(1,0),6) occurs(object(robot,2),move(-1,0),8) occurs(object(robot,2),pickup,1) occurs(object(robot,2),pickup,7) occurs(object(robot,2),putdown,5) occurs(object(robot,2),deliver(1,3,3),3) occurs(object(robot,2),deliver(1,3,1),4) occurs(object(robot,2),deliver(1,1,1),9) timeTaken(9) numActions(11)
Optimization: 56
Answer: 3
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(-1,0),2) occurs(object(robot,2),move(1,0),3) occurs(object(robot,1),move(-1,0),4) occurs(object(robot,2),move(-1,0),4) occurs(object(robot,1),move(1,0),6) occurs(object(robot,2),move(0,1),6) occurs(object(robot,1),pickup,2) occurs(object(robot,2),pickup,5) occurs(object(robot,1),putdown,7) occurs(object(robot,2),putdown,8) occurs(object(robot,1),deliver(1,1,1),5) occurs(object(robot,2),deliver(1,3,4),7) timeTaken(8) numActions(14)
Optimization: 50
Answer: 4
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(-1,0),0) occurs(object(robot,2),move(0,1),2) occurs(object(robot,1),move(0,-1),3) occurs(object(robot,2),move(1,0),5) occurs(object(robot,2),move(-1,0),8) occurs(object(robot,2),pickup,1) occurs(object(robot,2),pickup,6) occurs(object(robot,2),putdown,4) occurs(object(robot,2),deliver(1,3,4),3) occurs(object(robot,2),deliver(1,1,1),9) timeTaken(8) numActions(11)
Optimization: 49
Answer: 5
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(-1,0),0) occurs(object(robot,2),move(0,1),2) occurs(object(robot,2),move(1,0),5) occurs(object(robot,2),move(-1,0),8) occurs(object(robot,2),pickup,1) occurs(object(robot,2),pickup,6) occurs(object(robot,2),putdown,4) occurs(object(robot,2),deliver(1,3,4),3) occurs(object(robot,2),deliver(1,1,1),9) timeTaken(8) numActions(10)
Optimization: 48
Answer: 6
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(-1,0),0) occurs(object(robot,2),move(0,1),2) occurs(object(robot,2),move(1,0),4) occurs(object(robot,1),move(-1,0),5) occurs(object(robot,2),move(0,1),5) occurs(object(robot,1),move(-1,0),7) occurs(object(robot,2),pickup,1) occurs(object(robot,1),pickup,6) occurs(object(robot,2),deliver(1,3,4),3) occurs(object(robot,1),deliver(1,1,1),8) timeTaken(8) numActions(11)
Optimization: 47
Answer: 7
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,2),move(-1,0),0) occurs(object(robot,2),move(0,1),2) occurs(object(robot,2),move(1,0),5) occurs(object(robot,2),move(-1,0),7) occurs(object(robot,2),pickup,1) occurs(object(robot,2),pickup,6) occurs(object(robot,2),putdown,4) occurs(object(robot,2),deliver(1,3,4),3) occurs(object(robot,2),deliver(1,1,1),8) timeTaken(8) numActions(10)
Optimization: 46
Answer: 8
occurs(object(robot,1),move(0,-1),0) occurs(object(robot,2),move(0,1),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,1),move(-1,0),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),move(-1,0),3) occurs(object(robot,1),move(0,1),6) occurs(object(robot,2),move(1,0),6) occurs(object(robot,2),pickup,2) occurs(object(robot,1),pickup,5) occurs(object(robot,2),putdown,5) occurs(object(robot,2),deliver(1,1,1),4) occurs(object(robot,1),deliver(1,3,4),8) timeTaken(7) numActions(13)
Optimization: 42
Answer: 9
occurs(object(robot,1),move(0,-1),0) occurs(object(robot,2),move(0,1),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,1),move(-1,0),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),move(-1,0),3) occurs(object(robot,1),move(0,1),6) occurs(object(robot,2),move(0,1),6) occurs(object(robot,2),pickup,1) occurs(object(robot,1),pickup,5) occurs(object(robot,2),putdown,5) occurs(object(robot,2),deliver(1,1,1),4) occurs(object(robot,1),deliver(1,3,4),7) timeTaken(7) numActions(13)
Optimization: 41
Answer: 10
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),move(-1,0),3) occurs(object(robot,1),move(0,1),5) occurs(object(robot,2),move(0,1),5) occurs(object(robot,1),pickup,2) occurs(object(robot,2),pickup,4) occurs(object(robot,2),putdown,7) occurs(object(robot,1),deliver(1,1,1),4) occurs(object(robot,2),deliver(1,3,4),6) timeTaken(7) numActions(11)
Optimization: 39
Answer: 11
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,2),move(1,0),1) occurs(object(robot,2),move(-1,0),2) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),move(-1,0),3) occurs(object(robot,1),move(1,0),5) occurs(object(robot,2),move(0,1),5) occurs(object(robot,1),pickup,2) occurs(object(robot,2),pickup,4) occurs(object(robot,1),deliver(1,1,1),4) occurs(object(robot,2),deliver(1,3,4),6) timeTaken(6) numActions(12)
Optimization: 33
Answer: 12
occurs(object(robot,1),move(-1,0),0) occurs(object(robot,1),move(-1,0),1) occurs(object(robot,1),move(-1,0),3) occurs(object(robot,2),move(-1,0),3) occurs(object(robot,1),move(1,0),5) occurs(object(robot,2),move(0,1),5) occurs(object(robot,1),pickup,2) occurs(object(robot,2),pickup,4) occurs(object(robot,1),deliver(1,1,1),4) occurs(object(robot,2),deliver(1,3,4),6) timeTaken(6) numActions(10)
Optimization: 31
OPTIMUM FOUND

Models       : 12
  Optimum    : yes
Optimization : 31
Calls        : 1
Time         : 0.388s (Solving: 0.28s 1st Model: 0.02s Unsat: 0.17s)
CPU Time     : 0.391s
