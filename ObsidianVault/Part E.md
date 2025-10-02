### Goal:

Adding onto the models we have so far built up, we now need to introduce the effects of Repti Cooling and heat lamps, we will just call this 'temperature control'. This will be again, calculated separately from other heating elements (outdoor temperature and human produced heating). We want to build this final model to then integrate all our heating and cooling models into one.

### Technical Approach
* We are given the equation $Q(t) = \kappa_{d}(T_{d} - T)$ to model our temperature control effects, where $Q(t)$ represents the effects air conditioners and furnaces on our buildings heat. $T_{d}$ is our thermostats set temperature, and will be constant, $T$ is the buildings overall temperature at any given moment.
* We can use our Rungee-Kutta solver to model this equation, which when setting up will look like: $$\begin{align*}
t_j &= t(j), \\
Q_j &= Q(j), \\[6pt]
k_1 &= \Delta t \,\kappa d\bigl(T_d - T(t_j)\bigr), \\
k_2 &= \Delta t \,\kappa d\bigl(T_d - T(t_j + \tfrac{\Delta t}{2})\bigr), \\
k_3 &= \Delta t \,\kappa d\bigl(T_d - T(t_j + \tfrac{\Delta t}{2})\bigr), \\
k_4 &= \Delta t \,\kappa d\bigl(T_d - T(t_j + \Delta t)\bigr), \\[6pt]
Q_{j+1} &= Q_j + \tfrac{1}{6}\bigl(k_1 + 2k_2 + 2k_3 + k_4\bigr).
\end{align*}$$
* Using MATLAB, we now want to model four different scenarios for our input values: $T(0)=65,\kappa_{d}=0.2)$ , $T(0)=65,\kappa_{d}=2.0)$ , $T(0)=95,\kappa_{d}=0.2)$ , $T(0)=95,\kappa_{d}=2.0)$ with $T_{d}=77$ to model different initial temperatures, and different rates of cooling/heating will impact the overall heat in the building over time. We can now run our MATLAB script to get the following figure plotting all four variations over a 24 hour interval:
![[Figure_2.png]]
We can make the observation that all functions will approach our thermostats set point of 77 degrees, denoted by the black asymptote line. Case a and c in the figure will take far longer to reach our desired temperature, while case b and d will reach 77 degrees in less than 5 hours. Or $\kappa_{d}$ value is what changes the rates of heating / cooling in this scenario, and with a larger $\kappa_{d}$ we see a much more rapid change in air temperature. This value could represent either the quantity of furnaces and air conditioners present in the building, or the efficiency of those devices, where installing more or better devices will change the ability to effectively cool or heat the air.
