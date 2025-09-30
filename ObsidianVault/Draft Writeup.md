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

