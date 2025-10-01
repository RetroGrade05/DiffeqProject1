# Introduction
  In 2023 AFRLP Inc. won the contract for the new 10 billion dollar Meta Compound in Boulder, CO, enclosing multiple datacenters, cubicles, and Mark Zuckerberg's -*REDACTED*-. Our team of AFRLP Engineers has been tasked with the very important task of ensuring the correct temperature ranges. We will need to evaluate our models for heat affects order to maintain the 71-85 degree temperature range necessary for -*REDACTED*- according to Pet-Smart's Lizard Ownership Manual. 

  We will need to account for the affects of the ambient temperature outside $A(t)$, the datacenters and -*REDACTED*- guests $H(t)$, as well as our provisioned HVAC systems $Q(t)$. We can model these affects in a differential equation, $\frac{dT}{dt}= A(t) + H(t) + Q(t)$, and monitor the affects they have on temperature to evaluate the functionality of our system. 

# Simplified Model ==(Section a)==

# Numerical Calculator ==(B)==

   As our calculations will involve complicated differential equations that need to be graphed, we are attempting to develop a numerics system to properly graph these equations. Our chosen software is MatLab.
### Methods:
   We are going to use the Runge-Kutta fourth order estimation to create our numeric approximation for graphing. This method operates on the principle of estimating the **slope between two values**  of the differential equation and then moving along that slope to approximate the rough movement of the equation. 
   
   This is an approximation, but operates off the principles that guide the definition of a derivative: $$\lim_{ h \to 0 } \frac{f(x+h)-f(x)}{h}$$in that the estimate approaches the actual equation as our intervals (h) approach 0. We can cut down h by simply calculating more steps over the same interval, getting higher accuracy at the cost of compute power. Think of it like if you stretched out a human costume over the rough shape of a human and then had a lizard person climb into it, it would roughly approximate a human with an imperceptible error. Our goal is to balance speed with accuracy, tuning h to meet our criteria and comparing our answers to a solvable differential equation to measure accuracy

### Technical Approach
   First, we need a test differential equation in matlab to test our code against. We are using $\frac{dT}{dt}=0.25(75-T), T(0)=50$ as this sample equation. We are given the RK4.m function to work with as well, which takes in $t_{0},t_{f},n,y_{0},f(t)$ as variables. As such, the only function we really need to introduce is $\frac{dT}{dt}$ .  After completion, we get a full graph of the estimation of the equation.
   
   After this, we need to compare the error to the actual solution of the differential equation. Luckily our original equation is very easily differentiable, so we can compare a graph of it directly. Plotting $T=75-25e^{-\frac{t}{4}}$ alongside our graph, we get: ![[PartBGraphV1.jpg]] At this scale the values look almost entirely identical. Looking at the % deviation of the estimate from the actual value gives a closer view of the actual error: ![[ErrorPlot.jpg]] Where the error is on the order of $10^{-8}$%, almost entirely negligible.
### Results
   The rk4.m estimation method has proven incredibly proficient, and certainly suitable for usage in our calculations. I am quite honestly surprised with the shape of the error graph, I assumed that the error would increase over time, but it seems to spike only initially before climbing back down, seemingly correcting itself. Quite impressive!


# Improving our model 

## Accounting for Daily Weather Cycles ==(C)==

   In part A, our model simplified $M(t)$ to be a constant value. In actuality, ambient temperature varies by season and time of day, and we need to model this fluctuation to get a proper estimation. 
   
   Now that our initial function has been solved and our numerical calculator is ready, we can transform $M(t)$ into a sinusoidal function to illustrate daily temperature ranges, as well as testing summer and winter average temperatures to ensure we don't end up with a frozen or overheated Zucc. 
### Methods:

  Using the measured temperature fluctuations of a given day in Boulder, we will assume a sinusoidal oscillation with a peak to valley amplitude of 24 degrees, and a variable starting temperature $M_{0}$, being 75 in the summer and 35 in the winter. We can then plug in this variable temperature $T_{out}(t)$ to our initial equation $\frac{dT}{dt}(t)=0.25(T_{out}-T)$ and solve to get our complimentary internal temperature. 
  
  We would also like to find our maximum values of our graphs to the minute precision, so that in the case of Colorado randomly forgetting which season it is and dropping to -20, we can rush Zuckerberg to his -*Redacted*- before the coldest time of the day to prevent him from turning into a pop-sickle. 

### Technical Approach:

   For our main model, $T_{out}(t)=M_{0}-12\cos\left( \frac{\pi(t-f)}{12} \right), T(0)=65$. In our summer system, plugging in $M_{0}=75$, and solving the differential equation (proof in appendix  $Fig C_{1}$), we get the equation $T(t)=75-14.3e^{-t/4}-\frac{36}{9+\pi^{2}}(3\cos(\theta)+\pi \cos(\theta))$, where $\theta=\frac{\pi(t-5)}{12}$. From plotting these two equations in Matlab, we get: ![[PartCPlot1.png]]
   By plotting over a range of $24hours*60min$, we get a precision of minutes, and can output our max and min values from the range with the function, getting:   *Inside temperature: Minimums and Maxs of 64.56 and 83.19 at 6:58 and 20:08  Outside temperature: Minimums and Maxs of 63.00 and 87.00 at 5:00 and 16:59* 
   
   We want to also get a representation of this data in the winter, so we resolve with $M_{0}=35$. We modified the matlab code to be flexible, taking in any $M_{0}$ as a perameter of the equation, and then inputted C into our $T(t)$ equation (work in $FigC_{2}$) to get![[PartCPlot2.png]]![[PartCScreenshot.png]]

### Results

   We can observe that the inside temperature is slightly out of phase with the out, in addition to having a lower amplitude. Its minimums and maximums also occur at intersections with the outside temperature, as $T_{out}-T_{in}=0=\frac{dT}{dt}$. 
   
   In both cases, $F(t)$ trends towards $M(t)$ initially, before reaching a sort of phase equilibrium with it after the first few hours. You can see this especially well with the graph extending up to a week ![[PartCPlot3.png]] as over time the wave of internal temperature stabalizes. This results from the fact that as $t\to \infty, Ce^{-t/4}\to 0$, and as a result $$T(t,C)=M_{0}-Ce^{-t/4}-\frac{36}{9+\pi^{2}}(3\cos(\theta)+\pi \cos(\theta))$$ approaches $$T(t)=M_{0}-\frac{36}{9+\pi^{2}}(3\cos(\theta)+\pi \cos(\theta))$$which is a constantly oscillating function. This also means that the initial value of T becomes irrelevant over time, and no matter how hot it is it will eventually reach the same posture. 
   
   We can see that our current model would allow the Zucc to be outside of his habitat requirements, and we must introduce more heat-generating elements to keep Mark toasty. 
## Affects of Human Interaction with System
	

## Affects of HVAC

# Full Model

## Putting it altogether
We will now take into consideration the effects of of outside temperature, $A(t)$, people, lights and machinery, $H(t)$, and furnaces/air conditioners, $Q(t)$. We achieve this by including each function in $\frac{dT}{dt}$ to understand how each affects $T$, and finally adding everything in a single DE to obtain an accurate model for the temperature inside the building.

## Effects of lights & machinery $H(t)$
We are provided an IVP to find $\frac{dT}{dt}$ with $H(t)$ considered: $\frac{dT}{dt} = 7\,\operatorname{sech}\!\left[\frac{3}{4}(t-10)\right]+2(77-T)$,  $T(0)=75$  

![[PartFPlot1_White.jpg]]Using our MATLAB code, we find that the maximum temperature within the building is 80.32F at 10:24AM, after which the temperature drops and is maintained at approximately 77F for the rest of the day. Our damage threshold is 81F, and since $T_{max}<81$, we narrowly avoid equipment damage.

Air conditioners are critical to ensure the equipment within the building functioning smoothly. We prove this by simulating the same building on a hot weekend day, but without any machinery or air conditioning, which means $H(t)=Q(t)=0$. We model this using our given IVP: $\frac{dT}{dt}=0.25{85-10\cos[\frac{\pi(t-5)}{12}]-T}$, $T(0)=75$ 

![[PartFPlot2_White.jpg]]
Using our MATLAB code, we see that the temperature crosses the threshold 81F at 12:09PM, and remains above the threshold throughout the day, with the highest temperature being 91.82F at 8:06PM. So AC is definitely important!
## Including Devices (ACs & Furnaces)
With active ACs & furnaces, the maximum temperature inside the building depends on how powerful these devices are. 

We use a MATLAB code to model how these devices affect the building temperature

![[PartFPlot3_White.jpg]]

If the devices have a scaling factor $\kappa_{d}=2$, the maximum temperature is 78.99F
If the devices have a scaling factor $\kappa_{d}=0.5$, the maximum temperature is 82.1F

![[Pasted image 20250928132039.png]]

From our MATLAB code we can see that if  $\kappa_{d}=0.5$, the devices are exposed to damaging temperatures for up to 8.7 hours (522 minutes). Therefore, it is important to consider how powerful our heating/cooling devices are and how they would affect the temperature, so that we can be sustainable.

## Putting it together
We now add up all factors: outside ambience, people, machinery, and lights, and heating and cooling devices to understand how the temperature inside this building might fluctuate over a weekend (72 hours)

![[PartFPlot4_White.jpg]]

From our MATLAB-generated plot, we can see that the temperature curve (blue), fluctuates throughout the day in the form of a wave function. Therefore, it is safe to say that M does not approach a particular steady state, but rather, it's steady state is periodic, limited by a maximum and minimum value.

We also observe that there is a correlation between the fluctuation of the temperature curve and the outside temperature curve (yellow). As the outside temperature goes up, so does the building's internal temperature, and vice-versa. We conclude that it is safe to say that the outside temperature drives the direction of the rate of change in temperature inside the building: whether the building heats up, or cool down matches if the outside is heating up, or cooling down.

Our solution curve can be described as follows: as the building powers up and people start to enter, it's interior rapidly heats up until the first 10 hours has passed, after which it begins cooling down steadily. After 20 hours, the building's temperature is mainly decided by the outside temperature, if it's heating up outside, the building heats up, and vice versa.

