### Goal:
   As our calculations will involve complicated differential equations that need to be graphed, we are attempting to develop a numerics system to properly graph these equations. Our chosen software is MatLab, and we 
### Methods:
* We are going to use the Runge-Kutta fourth order estimation to create our numeric approximation for graphing. This method operates on the principle of estimating the ==slope between two values==  of the differential equation and then moving along that slope to approximate the rough movement of the equation. 
* This is an approximation, but operates off the principles that guide the definition of a derivative: $$\lim_{ h \to 0 } \frac{f(x+h)-f(x)}{h}$$ in that the estimate approaches the actual equation as h approaches 0. Thus, we can achieve more accuracy by decreasing h, at the cost of compute power. Our goal is to balance speed with accuracy, tuning h to meet our criteria and comparing our answers to a solvable differential equation to measure accuracy
*

### Technical Approach
* To look at Runga-Kutta, we first need to understand the Euler Approximation method. It estimates the graph of a differential equation 