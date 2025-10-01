## Putting it altogether
We will now take into consideration the effects of of outside temperature, $A(t)$, people, lights and machinery, $H(t)$, and furnaces/air conditioners, $Q(t)$. We achieve this by including each function in $\frac{dT}{dt}$ to understand how each affects $T$, and finally adding everything in a single DE to obtain an accurate model for the temperature inside the building.

## Effects of lights & machinery $H(t)$
We are provided an IVP to find $\frac{dT}{dt}$ with $H(t)$ considered: $\frac{dT}{dt} = 7\,\operatorname{sech}\!\left[\frac{3}{4}(t-10)\right]+2(77-T)$,  $T(0)=75$  

![[PartFPlot1.jpg]]Using our MATLAB code, we find that the maximum temperature within the building is 80.32F at 10:24AM, after which the temperature drops and is maintained at approximately 77F for the rest of the day. Our damage threshold is 81F, and since $T_{max}<81$, we narrowly avoid equipment damage.

Air conditioners are critical to ensure the equipment within the building functioning smoothly. We prove this by simulating the same building on a hot weekend day, but without any machinery or air conditioning, which means $H(t)=Q(t)=0$. We model this using our given IVP: $\frac{dT}{dt}=0.25{85-10\cos[\frac{\pi(t-5)}{12}]-T}$, $T(0)=75$ 

![[PartFPlot2.jpg]]
Using our MATLAB code, we see that the temperature crosses the threshold 81F at 12:09PM, and remains above the threshold throughout the day, with the highest temperature being 91.82F at 8:06PM. So AC is definitely important!
## Including Devices (ACs & Furnaces)
With active ACs & furnaces, the maximum temperature inside the building depends on how powerful these devices are. 

We use a MATLAB code to model how these devices affect the building temperature

![[PartFPlot3.jpg]]

If the devices have a scaling factor $\kappa_{d}=2$, the maximum temperature is 78.99F
If the devices have a scaling factor $\kappa_{d}=0.5$, the maximum temperature is 82.1F

![[Pasted image 20250928132039.png]]

From our MATLAB code we can see that if  $\kappa_{d}=0.5$, the devices are exposed to damaging temperatures for up to 8.7 hours (522 minutes). Therefore, it is important to consider how powerful our heating/cooling devices are and how they would affect the temperature, so that we can be sustainable.

## Putting it together
We now add up all factors: outside ambience, people, machinery, and lights, and heating and cooling devices to understand how the temperature inside this building might fluctuate over a weekend (72 hours)

![[PartFPlot4.jpg]]

From our MATLAB-generated plot, we can see that the temperature curve (blue), fluctuates throughout the day in the form of a wave function. Therefore, it is safe to say that M does not approach a particular steady state, but rather, it's steady state is periodic, limited by a maximum and minimum value.

We also observe that there is a correlation between the fluctuation of the temperature curve and the outside temperature curve (yellow). As the outside temperature goes up, so does the building's internal temperature, and vice-versa. We conclude that it is safe to say that the outside temperature drives the direction of the rate of change in temperature inside the building: whether the building heats up, or cool down matches if the outside is heating up, or cooling down.

Our solution curve can be described as follows: as the building powers up and people start to enter, it's interior rapidly heats up until the first 10 hours has passed, after which it begins cooling down steadily. After 20 hours, the building's temperature is mainly decided by the outside temperature, if it's heating up outside, the building heats up, and vice versa.

