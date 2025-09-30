### Goal:

Our goal now is to add another layer, and model the effects of lights and machinery use by people occupying the building in question. This will first be done without the additional effects of air-conditioning / heating in mind, making our equation much simpler to start (however, we will look at air conditioning later).

### Technical Approach:

* Again, we shall be approximating a given function utilizing fourth-order Runge-Kutta estimation. This time, our given function to model heat input is $$

H(t) = 7\, \text{sech}\left( \frac{3}{4}(t - 10) \right)

$$
  where H(t) is used to represent lighting and machinery heat. We will manipulate this function to be used in MATLAB with the Runge-Kutta function, to do so we need to solve it analytically, 
  $$
\frac{dy}{dt}​=H(t)=7sech\left( \frac{4}{3}​(t−10) \right), y(t_{0}​)=y_{0}​
$$
  which allows us to then input into our Runge-Kutta solver, with the following steps:
  $$
\begin{align*}
t_j &= t(j), \\
H_j &= H(j), \\[6pt]
k_1 &= \Delta t \cdot 7\,\text{sech}\!\left(\tfrac{3}{4}(t_j - 10)\right), \\
k_2 &= \Delta t \cdot 7\,\text{sech}\!\left(\tfrac{3}{4}\left((t_j + \tfrac{\Delta t}{2}) - 10\right)\right), \\
k_3 &= \Delta t \cdot 7\,\text{sech}\!\left(\tfrac{3}{4}\left((t_j + \tfrac{\Delta t}{2}) - 10\right)\right), \\
k_4 &= \Delta t \cdot 7\,\text{sech}\!\left(\tfrac{3}{4}\left((t_j + \Delta t) - 10\right)\right), \\[6pt]
H_{j+1} &= H_j + \tfrac{1}{6}\left(k_1 + 2k_2 + 2k_3 + k_4\right).
\end{align*}
$$
* Now using this to format our MATLAB code, we can simulate the estimated heating effects of building usage, without temperature control systems. After running this we are left with the output of the following graphs:
![[Figure_1.png]]
  In these two graphs, we can see the overall temperature in the building (top) and the active usage of the building (bottom). On the top we can also see the outputted max temperature of 94.31 F, which is shown to occur right at the 24 hour mark, which is the limit for where we are focused as it is one full day. We can think of the top graph, which shows our estimation for H(t), to represent the total heat buildup within a building, as our model currently only accepts inputs from interior heating and has no way to dissipate that heat. We are later given a constraint that states that equipment inside will be damaged by the heat should it rise above 81 F, so that 'no go' area is shown here as the area above 81 on the y-axis.
  