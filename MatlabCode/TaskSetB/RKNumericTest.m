clear;close;clc;
%% This file acts to test the functionality of rk4.m's Runga-Kutta Approximation

%% Functions:
% The function dt acts as our test differential equation, modeling Fig B1

%% Approximation
% Variables for our RK4 are as below:
ti = 0; % t initial
tf = 24; % t final
npts = 240; % # of steps for our estimation
y0 = 50; % Starting T
f = @dt; % Reference equation

% Our unsolved differential equation
function T = dt(to,To)
    T = 75/4 - To/4;
end

% Calls rk4.m and stores it in a matrix

[test,Test] = rk4(ti,tf,npts,y0,f);

%% Real Value Calculation
% Variable
ttrue = linspace(ti,tf,npts+1);
Ttrue = zeros(1,npts+1); 

% Real Value Equation:
function T = dtrue(t)
    T = 75 - 25 * (exp(1)^(-t/4));
end

% Real Value Graph
for i = 1 : npts+1
    Ttrue(i) = dtrue(ttrue(i));
end


%% Plotting
% Plot of the estimate
figure
pest = plot(test,Test,"-o");
pest.Color = '#cc2f59';
pest.MarkerSize = 10;
fontsize(25,"points")
title("Estimated Value","FontSize",30)
xlabel("Time in Hours")
ylabel("Temperature in Farenheight")
hold on;
ptrue=plot(ttrue,Ttrue);
ptrue.Color = '#2fcc4e';
