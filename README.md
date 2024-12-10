# Discrete-Time-Control-System

Question Overview
The problem presents a discrete-time system defined by the state equation and two cost functions, J1 and J2. The task is to formulate a dynamic programming approach to compute the optimal control inputs by minimizing these cost functions. Specifically, the question involves the following key aspects:

1. Deriving Matrices: Calculate the values of R,H,and Q as per the given cost function, and derive the state matrices A and B from the discrete-time system.
2. Dynamic Programming Steps: Implement a recursive solution method for time N=3 and N=200 to evaluate control inputs across time steps.
3. Initial Conditions: Establish initial values for the states and set P(0)=H for the optimization process


Answer Overview
The solution involves applying dynamic programming to iteratively compute the optimal control actions that minimize the defined cost functions. Through backward induction, the method evaluates the cost-to-go function at each time step, considering immediate costs and future contributions to total cost. The answer details the procedures for calculating matrices and deriving inputs systematically, ensuring effective optimization of the control system.

Overall, this approach not only addresses the computational requirements but also emphasizes the importance of initializing the system correctly for accurate optimization results.
