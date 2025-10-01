## Simplified Model
Initially, we want to start with a simple model for our system that we can build off of as we add more complexity. To do this, we will model the most measurable and consistent parameter affecting the temperature, the outside environment $A(t)$. 
### Methods
From Newton's Cooling Law, we know that the change in temperature of a system out of equilibrium is the difference in temperature multiplied by a coefficient of heat exchange $k$. As such, we can represent the outside temperature as $M(t)$ and define our simplified system as  $A(t)=\frac{dT}{dt}=k(M(t)-T(t))$, the equation for our system ignoring $H(t)$ and $Q(t)$ for now. Additionally, for simplicity, we will generalize the environment $M(t)$ to be a constant, and thus we get the non-homogeneous linear equation: $$\frac{dT}{dt}=k(M-T(t))$$
Before solving, it is useful to analyze if this function has a solution using **Picard's Theorem**, which states that if both $\frac{dT}{dt}$ and $\frac{d^2T}{dt^2}$ are continuous, then the solution can be evaluated and is unique. As the only t dependent parameter, $T(t)$ always exists and is in the numerator, the solution must be unique.  

We solve this equation using the integrating factor method 
![[PartAPlot1_White.jpg]]and get $T(t) = M + (T_{0}-M)e^{kt_{0}}e^{-kt}$
