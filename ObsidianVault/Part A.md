$$
\frac{dT}{dt}=\kappa[M(t)-T(t)] +H(t) +Q(t)
$$
## Goal:
To have an in-depth understanding of the differential equation used to model the temperature of the building at ideal conditions ($H(t) = 0, Q(t) = 0$, and $M(t)$ remains constant, how changing it's components affects the rate of change of temperature, and find it's equilibrium solution, general solutions, and what they imply for the temperature inside this building.

## Methods:
We analyze the DE's linearity, homogeneity, and plot its solutions and equilibriums to verify our calculations and understand how certain properties, like the $\kappa$ constant, affect the rate of change of temperature inside the building, and how to translate the DE's components to the real life scenario.
## General DE:
### Analysis:
We have a **linear, constant coefficient, nonhomogeneous equation.** 

If $Q(t) = tT$, the DE would be a **variable coefficient** equation.

We determine the existence and uniqueness of solutions. For Picard’s theorem to guarantee the existence of unique solutions, **M(t), H(t) and Q(t) must guarantee continuity for the DE on the predetermined interval (existence)** and$f_{T}(t,T)$ must be continuous on the interval (uniqueness). This can be interpreted as **the house having a unique flow of temperature as time goes on.**

### Solving the DE for a general solution:
We solve for a general solution $T(t)$ using the **Integrating Factor** method, thereby finding a function that determines the temperature at a given point in time: 

We have: $$\mu(t) = e^{\kappa t}$$

Multiplying both sides by the integrating factor: $$ e^{\kappa t}[\frac{dT}{dt}-\kappa T(t)]=e^{\kappa t}[\kappa M(t)+H(t)+Q(t)]$$$$ \frac{d}{dt}[e^{\kappa t}T] = e^{\kappa t}[\kappa M(t)+H(t)+Q(t)]$$
Integrating both sides: 
$$T = \frac{\int{e^{\kappa t}[\kappa M(t)+H(t)+Q(t)]dt + C}}{e^{\kappa t}}$$
## Realistic Situation: The house
We apply "ideal" conditions to simplify the DE:
“No people in it and the lights and machinery are off:”$H(t)=0$
“No furnaces or air conditioners are running:”$Q(t)=0$
“The outside temperature is constant with the value M:” $M(t)=M$
Our new DE is $\frac{dT}{dt}=\kappa[M-T(t)]$

We then find the DE's equilibrium solutions to find a baseline temperature to understand how the temperature changes as time goes on.

The DE has equilibrium solutions if $\frac{dT}{dt}=0$
Therefore: $\kappa[M-T(t)]=0$
This happens if: $T(t)=M$

We then analyze the stability of our equilibrium solution to find the behavior of other solutions as time goes on
$$T< M:\frac{dT}{dt}>0$$

$$T> M:\frac{dT}{dt}<0$$
Since $\lim_{ t \to \infty } T(t) = M$ for $t \in \mathbb{R}$, $T(t) = M$ is a stable equilibrium solution. 

This implies that **the temperature within the building would eventually be the same as that of the ambient temperature.**
#### General Solution specific to the building:
We have $H(t) = 0$, $Q(t) = 0$ and $M(t) = M$ 
Plugging in to the general solution we obtain the specific solution: 

$$T(t) = M + (T_{0}-M)e^{kt_{0}}e^{-kt}$$

We verify this solution with MATLAB:
![[ObsidianVault/PartAPlot1.jpg]]
We see that solution curves approaches M as time goes on, therefore M is a stable equilibrium solution, and our specific solution is correct.

#### Effect of 𝜅 on solutions
 
![[ObsidianVault/PartAPlot2.jpg]]
From the graph, we can see that **while changing 𝜅 does not affect the equilibrium solution, the rate of change of temperature is changed: a bigger 𝜅 implies a greater rate of change, and vice versa**. The quality of the building’s insulation could change 𝜅, with quality insulation resulting in a slower heat loss (smaller 𝜅), and poor insulation resulting in a sharper decrease in temperature (larger 𝜅).

#### Time constant
We have the original solution:  $$T(t) = M + (T_{0}-M)e^{kt_{0}}e^{-kt}$$“The difference between the building’s temperature and the outside temperature is $$e^{-1}$$ of the initial difference." Therefore: $$T(t) - M = e^{-1}(T_{0}-M_{0})$$
Using the general solution, we have:$$e^{-1}(T_{0}-M_{0}) = (T_{0}-M)e^{kt_{0}}e^{-kt}$$
Therefore: $$e^{-1} = e^{kt_{0}}e^{-kt}$$
So: $$-1=k\Delta t$$
$$\Delta t = \frac{-1}{k}$$
Since the time constant resembles the change in time, the units should be hours
We saw from our graph that a smaller 𝜅 implies smaller heat loss. Since t is inversely proportional to 𝜅, it can be inferred that a larger t would slow the building’s response to outside temperature; therefore, **we want a larger time constant**
