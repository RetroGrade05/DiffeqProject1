## Nghi
With active ACs & furnaces, the maximum temperature inside the building depends on how powerful these devices are. 

![[PartFPlot3.jpg]]

If the devices have a scaling factor $\kappa_{d}=2$, the maximum temperature is 78.99F
If the devices have a scaling factor $\kappa_{d}=0.5$, the maximum temperature is 82.1F

![[Pasted image 20250928132039.png]]

From our MATLAB code we can see that if  $\kappa_{d}=0.5$, the devices are exposed to damaging temperatures for up to 8.7 hours (522 minutes). Therefore, it is important to consider how powerful our heating/cooling devices are and how they would affect the temperature, so that we can be sustainable.

We now add up all factors: outside ambience, people, machinery, and lights, and heating and cooling devices to understand how the temperature inside this building might fluctuate over a weekend (72 hours)

![[PartFPlot4.jpg]]

From our MATLAB-generated plot, we can see that the temperature curve (blue), fluctuates throughout the day in the form of a wave function. Therefore, it is safe to say that M does not approach a particular steady state, but rather, it's steady state is periodic, limited by a maximum and minimum value.

We also observe that there is a correlation between the fluctuation of the temperature curve and the outside temperature curve (yellow). As the outside temperature goes up, so does the building's internal temperature, and vice-versa. We conclude that it is safe to say that the outside temperature drives the direction of the rate of change in temperature inside the building: whether the building heats up, or cool down matches if the outside is heating up, or cooling down.

Our solution curve can be described as follows: as the building powers up and people start to enter, it's interior rapidly heats up until the first 10 hours has passed, after which it begins cooling down steadily. After 20 hours, the building's temperature is mainly decided by the outside temperature, if it's heating up outside, the building heats up, and vice versa.

