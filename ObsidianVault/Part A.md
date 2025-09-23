$$
\frac{dT}{dt}=\kappa[M(t)-T(t)] +H(t) +Q(t)
$$
## Goal:
To have an in-depth understanding of the differential equation used to model the temperature of the building, how changing it's components affects the rate of change of temperature, and find it's equilibrium solution, general solutions, and what they imply for the temperature inside this building.

## General DE:
### Analysis:
This is a **linear, constant coefficient, nonhomogeneous equation.** 

If $$Q(t) = tT$$the DE would be a **variable coefficient** equation.

We then determine the existence and uniqueness of solutions. For Picard’s theorem to guarantee the existence of unique solutions, **M(t), H(t) and Q(t) must guarantee continuity for the DE on the predetermined interval (existence)** and$$f_{T}(t,T)$$must be continuous on the interval (uniqueness). This can be interpreted as **the house having a unique flow of temperature as time goes on.**

### Solving the DE for a general solution:
We solve for a general solution using the **Integrating Factor** method, thereby finding a function that determines the temperature at a given point in time: 

We have: $$\mu(t) = e^{\kappa t}$$

Multiplying both sides by the integrating factor: $$ e^{\kappa t}[\frac{dT}{dt}-\kappa T(t)]=e^{\kappa t}[\kappa M(t)+H(t)+Q(t)]$$$$ \frac{d}{dt}[e^{\kappa t}T] = e^{\kappa t}[\kappa M(t)+H(t)+Q(t)]$$
Integrating both sides: 
$$T = \frac{\int{e^{\kappa t}[\kappa M(t)+H(t)+Q(t)]dt + C}}{e^{\kappa t}}$$
## Realistic Situation: The house
### Applying realistic scenario conditions to DE:
“No people in it and the lights and machinery are off:”$$H(t)=0$$“No furnaces or air conditioners are running:”$$ Q(t)=0$$“The outside temperature is constant with the value M:” $$M(t)=M$$Our new DE is $$\frac{dT}{dt}=\kappa[M-T(t)]$$
### Finding the general solution:

### Equilibrium:
#### Finding Equilibrium Solutions:
The DE has equilibrium solutions if $$\frac{dT}{dt}=0$$
Therefore: $$\kappa[M-T(t)]=0$$
This happens if: $$ T(t)=M$$
### Analyzing stability of Equilibrium Solutions:
$$T< M:\frac{dT}{dt}>0$$

$$T> M:\frac{dT}{dt}<0$$
Since $$\lim_{ t \to \infty } T(t) = M $$ for $$ t \in \mathbb{R}$$$$T(t) = M$$is a stable equilibrium solution. 

This implies that **the temperature within the building would eventually be the same as that of the ambient temperature.**
