## Authors: Carson Gano, Gabriel Ohnstad, Nghi Tran

# Introduction
   In 2023 AFRLP Inc. won the contract for the new 10 billion dollar Meta Compound in Boulder, CO, enclosing multiple datacenters, cubicles, and Mark Zuckerberg's -*REDACTED*-. Our team of AFRLP Engineers has been tasked with the very important task of ensuring the correct temperature ranges. We will need to evaluate our models for heat affects order to maintain the 71-85$^{\circ}F$ temperature range necessary for -*REDACTED*- according to Pet-Smart's Lizard Ownership Manual. 

   We will need to account for the affects of the ambient temperature outside $A(t)$, the datacenters and -*REDACTED*- guests $H(t)$, as well as our provisioned HVAC systems $Q(t)$. We can model these affects in a differential equation, $\frac{dT}{dt}= A(t) + H(t) + Q(t)$, and monitor the affects they have on temperature to evaluate the functionality of our system. 
  
   As our calculations will involve complicated differential equations that need to be graphed, we are attempting to develop a numerical system to properly graph these equations. Our chosen software is MATLAB.
# Simplified Model 
   Initially, we want to start with a simple model for our system that we can build off of as we add more complexity. To do this, we will model the most measurable and consistent parameter affecting the temperature, the outside environment $A(t)$. 
### Methods
   From Newton's Cooling Law, we know that the change in temperature of a system out of equilibrium is the difference in temperature multiplied by a coefficient of heat exchange $k$. As such, we can represent the outside temperature as $M(t)$ and define our simplified system as  $A(t)=\frac{dT}{dt}=k(M(t)-T(t))$, the equation for our system ignoring $H(t)$ and $Q(t)$ for now. Additionally, for simplicity, we will generalize the environment $M(t)$ to be a constant, and thus we get the non-homogeneous linear equation: *(see Appendix A4 - part a.)*  $$\frac{dT}{dt}=k(M-T(t))$$
   Before solving, it is useful to analyze if this function has a solution using **Picard's Theorem**, which states that if both $\frac{dT}{dt}$ and $\frac{d^2T}{dt^2}$ are continuous, then the solution can be evaluated and is unique. As the only t dependent parameter, $T(t)$ always exists and is in the numerator, the solution must be unique. *(see Appendix A2)*

We solve this equation using the integrating factor method 	![[PartAPlot1_White.jpg]]
*Figure A.1: Temperature inside compound without considering other elements*
and get $T(t) = M + (T_{0}-M)e^{kt_{0}}e^{-kt}$ *(see Appendix A3 - A4)*

   We also examined how the heating properties of our compound affect its internal temperature to determine which material would be best to build the compound and ensure its functionality.

![[PartAPlot2_White.jpg]]
*Figure A.2: How different construction materials affect the compound's temperature changes*

From *Figure A.2*, we can see that while changing 𝜅 does not affect the equilibrium solution, the rate of change of temperature is changed: a bigger 𝜅 implies a greater rate of change, and vice versa. The quality of the compound’s insulation could change 𝜅, with quality insulation resulting in a slower heat loss (smaller 𝜅), and poor insulation resulting in a sharper decrease in temperature (larger 𝜅).
# Numerical Calculator 
### Methods:
   We are going to use the Runge-Kutta fourth order estimation to create our numeric approximation for graphing. This method operates on the principle of estimating the **slope between two values**  of the differential equation and then moving along that slope to approximate the rough movement of the equation. 
   
   This is an approximation, but operates off the principles that guide the definition of a derivative: $$\lim_{ h \to 0 } \frac{f(x+h)-f(x)}{h}$$in that the estimate approaches the actual equation as our intervals (h) approach 0. We can cut down h by simply calculating more steps over the same interval, getting higher accuracy at the cost of compute power. Think of it like if you stretched out a human costume over the rough shape of a human and then had a lizard person climb into it, it would roughly approximate a human with an imperceptible error. Our goal is to balance speed with accuracy, tuning $h$ to meet our criteria and comparing our answers to a solvable differential equation to measure accuracy

### Technical Approach
   First, we need a test differential equation in MATLAB to test our code against. We are using $\frac{dT}{dt}=0.25(75-T), T(0)=50$ as this sample equation. We are given the rk4.m function to work with as well, which takes in $t_{0},t_{f},n,y_{0},f(t)$ as variables. As such, the only function we really need to introduce is $\frac{dT}{dt}$ .  After completion, we get a full graph (*Figure B.1*) of the estimation of the equation.
   
   After this, we need to compare the error to the actual solution of the differential equation. Luckily our original equation is very easily differentiable, so we can compare a graph of it directly. Plotting $T=75-25e^{-\frac{t}{4}}$ alongside our graph, we get: ![[PartBGraphV.png]] *Figure B.1: Testing Numerical Calculator's accuracy based on Estimates and Errors*
   At this scale the values look almost entirely identical. Looking at the % deviation of the estimate from the actual value gives a closer view of the actual error, where the error is on the order of $10^{-8}$%, almost entirely negligible.
### Results
   The rk4.m estimation method has proven incredibly proficient, and certainly suitable for usage in our calculations. We were surprised with the shape of the error graph, since we assumed that the error would increase over time, but it seems to spike only initially before climbing back down, seemingly correcting itself. Quite impressive!
# Improving our model 

## Accounting for Daily Weather Cycles

   In part A, our model simplified $M(t)$ to be a constant value. In actuality, ambient temperature varies by season and time of day, and we need to model this fluctuation to get a proper estimation. 
   
   Now that our initial function has been solved and our numerical calculator is ready, we can transform $M(t)$ into a sinusoidal function to illustrate daily temperature ranges, as well as testing summer and winter average temperatures to ensure we don't end up with a frozen or overheated Zucc. 
### Methods:

  Using the measured temperature fluctuations of a given day in Boulder, we will assume a sinusoidal oscillation with a peak to valley amplitude of 24 degrees, and a variable starting temperature $M_{0}$, being 75 in the summer and 35 in the winter. We can then plug in this variable temperature $T_{out}(t)$ to our initial equation $\frac{dT}{dt}(t)=0.25(T_{out}-T)$ and solve to get our complimentary internal temperature. 
  
  We would also like to find our maximum values of our graphs to the minute precision, so that in the case of Colorado randomly forgetting which season it is and dropping to -20, we can rush Zuckerberg to his -*Redacted*- before the coldest time of the day to prevent him from turning into a pop-sickle. 

### Technical Approach:

   For our main model, $T_{out}(t)=M_{0}-12\cos\left( \frac{\pi(t-f)}{12} \right), T(0)=65$. In our summer system, plugging in $M_{0}=75$, and solving the differential equation (proof in appendix  $Fig C_{1}$), we get the equation $T(t)=75-14.3e^{-t/4}-\frac{36}{9+\pi^{2}}(3\cos(\theta)+\pi \cos(\theta))$, where $\theta=\frac{\pi(t-5)}{12}$. From plotting these two equations in MATLAB, we get: ![[Images/PartCPlot2.png]]
	*Figure C.1: Comparison of external & internal temperatures of the compound within a 24-hour time frame in the summer*
	
   By plotting over a range of $24hours*60min$, we get a precision of minutes, and can output our max and min values from the range with the function, getting:   *Inside temperature: Minimums and Maxs of 64.56$^{\circ}F$ and 83.19$^{\circ}F$ at 6:58 and 20:08  Outside temperature: Minimums and Maxs of 63.00$^{\circ}F$ and 87.00$^{\circ}F$ at 5:00 and 16:59* 
   
   We want to also get a representation of this data in the winter, so we resolve with $M_{0}=35$. We modified the matlab code to be flexible, taking in any $M_{0}$ as a perameter of the equation, and then inputted C into our $T(t)$ equation (work in $FigC_{2}$ appendix) to get![[Images/PartCPlot1.png]]![[PartCScreenshot.png]]
	*Figure C.2: Comparison of external & internal temperatures of the compound within a 24-hour time frame in the winter*
### Results

   We can observe that the inside temperature is slightly out of phase with the out, in addition to having a lower amplitude. Its minimums and maximums also occur at intersections with the outside temperature, as $T_{out}-T_{in}=0=\frac{dT}{dt}$. 
   
   In both cases, $F(t)$ trends towards $M(t)$ initially, before reaching a sort of phase equilibrium with it after the first few hours. You can see this especially well with the graph extending up to a week ![[Images/PartCPlot3.png]] *Figure C.3: Comparison of external & internal temperatures of the compound over a 180 hours time-frame*
   as over time the wave of internal temperature stabilizes. This results from the fact that as $t\to \infty, Ce^{-t/4}\to 0$, and as a result $$T(t,C)=M_{0}-Ce^{-t/4}-\frac{36}{9+\pi^{2}}(3\cos(\theta)+\pi \cos(\theta))$$ approaches $$T(t)=M_{0}-\frac{36}{9+\pi^{2}}(3\cos(\theta)+\pi \cos(\theta))$$which is a constantly oscillating function. This also means that the initial value of T becomes irrelevant over time, and no matter how hot it is it will eventually reach the same posture. 
   
   We can see that our current model would allow the Zucc to be outside of his habitat requirements, and we must introduce more heat-generating elements to keep Mark toasty. 
## Effects of Human Interaction with System
### Goal:

Our goal now is to add another layer, and model the effects of people occupying the compound in question. This will first be done without the additional effects of  Repti Coolers $^{TM}$ & heat lamps in mind, making our equation much simpler to start (however, we will look at air conditioning later).

### Technical Approach:

Again, we shall be approximating a given function utilizing fourth-order Runge-Kutta estimation. This time, our given function to model heat input is $$

H(t) = 7\, \text{sech}\left( \frac{3}{4}(t - 10) \right)

$$
  where H(t) is used to represent lighting and data center heat. We will manipulate this function to be used in MATLAB with the Runge-Kutta function, to do so we need to solve it analytically, 
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
Now using this to format our MATLAB code, we can simulate the estimated heating effects of compound usage, without temperature control systems. After running this we are left with the output of the following graphs:
![[TaskDFigure1.png]]
  *Figure D.1: Overall temperature in the compound in a day from internal heat sources, without temperature control*
  
  In *Figure D.1*, we can see the overall temperature in the compound (top) and the active usage of the compound (bottom). On the top we can also see the outputted max temperature of 94.31$^{\circ}F$, which is shown to occur right at the 24 hour mark, which is the limit for where we are focused as it is one full day. We can think of the top graph, which shows our estimation for $H(t)$, to represent the total heat buildup within a compound, as our model currently only accepts inputs from interior heating and has no way to dissipate that heat. We are later given a constraint that states that equipment inside will be damaged by the heat should it rise above 8$^{\circ}F$, so that 'no go' area is shown here as the area above 81$^{\circ}F$ on the y-axis.
## Effects of HVAC
### Goal:

Adding onto the models we have so far built up, we now need to introduce the effects of Repti Coolers $^{TM}$ and heat lamps, we will just call this "temperature control". This will be again, calculated separately from other heating elements (outdoor temperature and human produced heating). We want to build this final model to then integrate all our heating and cooling models into one.

### Technical Approach
We are given the equation $Q(t) = \kappa_{d}(T_{d} - T)$ to model our temperature control effects, where $Q(t)$ represents the effects air conditioners and furnaces on our buildings heat. $T_{d}$ is our thermostats set temperature, and will be constant, $T$ is the buildings overall temperature at any given moment, and $\kappa_{d}$ is either the quantity of furnaces and air conditioners present in the building, or the efficiency of those devices, where installing more or better devices will change the ability to effectively cool or heat the air.

We can use our Runge-Kutta solver to model this equation, which when setting up will look like: $$\begin{align*}
t_j &= t(j), \\
Q_j &= Q(j), \\[6pt]
k_1 &= \Delta t \,\kappa d\bigl(T_d - T(t_j)\bigr), \\
k_2 &= \Delta t \,\kappa d\bigl(T_d - T(t_j + \tfrac{\Delta t}{2})\bigr), \\
k_3 &= \Delta t \,\kappa d\bigl(T_d - T(t_j + \tfrac{\Delta t}{2})\bigr), \\
k_4 &= \Delta t \,\kappa d\bigl(T_d - T(t_j + \Delta t)\bigr), \\[6pt]
Q_{j+1} &= Q_j + \tfrac{1}{6}\bigl(k_1 + 2k_2 + 2k_3 + k_4\bigr).
\end{align*}$$
Using MATLAB, we now want to model four different scenarios for our input values: $T(0)=65,\kappa_{d}=0.2)$ , $T(0)=65,\kappa_{d}=2.0)$ , $T(0)=95,\kappa_{d}=0.2)$ , $T(0)=95,\kappa_{d}=2.0)$ with $T_{d}=77$ to model different initial temperatures, and different rates of cooling/heating will impact the overall heat in the building over time. We can now run our MATLAB script to get the following figure plotting all four variations over a 24 hour interval:
![[TaskEFigure1.png]]
*Figure E.1: Effects of temperature control measures on the internal temperature of the compound, observed with different internal temperatures and control strengths*

We can make the observation that all functions will approach our thermostats set point of 77$^{\circ}F$, denoted by the black asymptote line. With a larger $\kappa_{d}$ , we see a much more rapid change in air temperature. 
# Full Model
   We will now take into consideration the effects of of outside temperature, $A(t)$, people, lights and our Meta AI Slop Datacenters, $H(t)$, and heat lamps/Repti Coolers $^{TM}$, $Q(t)$. We achieve this by including each function in $\frac{dT}{dt}$ to understand how each affects $T$, and finally adding everything in a single DE to obtain an accurate model for the temperature inside the building. Our goal is to burn enough rain forests to keep Mark warm until his mind is uploaded to the Metaverse.

## Effects of lights & AI Slop Datacenters $H(t)$
   We are provided an IVP to find $\frac{dT}{dt}$ with $H(t)$ considered: $\frac{dT}{dt} = 7\,\operatorname{sech}\!\left[\frac{3}{4}(t-10)\right]+2(77-T)$,    

![[PartFPlot1_White.jpg]]   
*Figure F.1: Temperature change within the compound under the effects of temperature control measures*
  From *Figure F.1*, we find that the maximum temperature within the building is 80.32F at 10:24AM, after which the temperature drops and is maintained at approximately 77F for the rest of the day. Our damage threshold is 81F, and since $T_{max}<81$, we narrowly avoid overheating Zuck.

   Repti Coolers$^{TM}$ are critical to ensure the equipment within the building functioning smoothly. We prove this by simulating the same compound on a hot weekend day, but without any Datacenters or Repti Coolers$^{TM}$, which means $H(t)=Q(t)=0$. We model this using our given IVP: $\frac{dT}{dt}=0.25{85-10\cos[\frac{\pi(t-5)}{12}]-T}$, $T(0)=75$ 

![[PartFPlot2_White.jpg]]
*Figure F.2: *Heat accumulating within the building from external heat, without regulation of Repti Coolers$^{TM}$* 

   In *Figure F.2*, we see that the temperature crosses the threshold 81 at 12:09PM, and remains above the threshold throughout the day, with the highest temperature being 91.82$^{\circ}F$ at 8:06PM. So Repti Coolers  is definitely important!
## Including Devices (ACs & Furnaces)
   With active Repti Coolers $^{TM}$ & heat lamps, the maximum temperature inside the compound depends on how powerful these devices are. 

   We use another MATLAB code to model how these devices affect the compounds temperature

![[PartFPlot3_White.jpg]]
*Figure F.3: Temperature inside the compound under different heat lamps/Repti Coolers$^{TM}$ conditions*
   If the devices have a scaling factor $\kappa_{d}=2$, the maximum temperature is 78.99$^{\circ}F$. If the devices have a scaling factor $\kappa_{d}=0.5$, the maximum temperature is 82.1$^{\circ}F$.

![[Pasted image 20250928132039.png]]

From *Figure F.3* we can see that if  $\kappa_{d}=0.5$, the devices are exposed to damaging temperatures for up to 8.7 hours (522 minutes). Therefore, it is important to consider how powerful our heat lamps/Repti Coolers $^{TM}$ devices are and how they would affect the temperature, so that we can be sustainable.
## Putting it together
We now add up all factors: outside ambience, modeled by the function $M(t)=0.25{85-10\cos[\frac{\pi(t-5)}{12}]}$, people, machinery, and lights, and heating and cooling devices to understand how the temperature inside this building might fluctuate over a weekend (72 hours)

![[PartFPlot4_White.jpg]]
*Figure F.4: Comparing internal compound temperature with outside temperature in a 24-hour span*
   From *Figure F.4*, we can see that the temperature curve (blue), fluctuates throughout the day in the form of a wave function. Therefore, it is safe to say that M does not approach a particular steady state, but rather, it's steady state is periodic, limited by a maximum and minimum value.

   We also observe that there is a correlation between the fluctuation of the temperature curve and the outside temperature curve (yellow). As the outside temperature goes up, so does the compound's internal temperature, and vice-versa. We conclude that it is safe to say that the outside temperature drives the direction of the rate of change in temperature inside the compound: whether the building heats up, or cool down depends on whether the outside is heating up, or cooling down.

   Our solution curve can be described as follows: as the compound powers up and people start to enter, it's interior rapidly heats up until the first 10 hours has passed, after which it begins cooling down steadily. After 20 hours, the compound's temperature is mainly decided by the outside temperature, if it's heating up outside, the compound heats up, and vice versa.

## Conclusion

   From our study, our temperatures should oscillate between 75-95$^{\circ}F$, which will keep Zuckerburg in the correct temperature range. Additionally, the datacenter load from the metaverse simulations will help heat up the rest of the world, so that Mark can vacation further north and get his amphibious side on when his Florida estate is underwater. 