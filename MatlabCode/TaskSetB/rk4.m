
function [t,w] = rk4(ti,tf,npts,y0,f)

%--------------------------------------------------------------------------
%
% Input:
%
% ti   = initial value of independent variable
% tf   = right endpoint of interval over which solution is computed
% npts = number of discrete points in the interval
% y0   = initial value of dependent variable
% f    = function handle
%
% Output:
%
% t    = array containing discrete values of independent variable
% w    = array containing discrete values of dependent variable (solution)
%--------------------------------------------------------------------------

    % Set up some variables

h = (tf-ti)/npts;            % stepsize
t = linspace(ti,tf,npts+1);  % values of independent variable
w = zeros(1,npts+1);         % initialize array to store solution
w(1) = y0;                   % initial value

    % Run the Runge-Kutta fourth order algorithm

for i = 1 : npts
    k1 = h*f(t(i),w(i));
    k2 = h*f(t(i)+h/2,w(i)+k1/2);
    k3 = h*f(t(i)+h/2,w(i)+k2/2);
    k4 = h*f(t(i)+h,w(i)+k3);
    w(i+1) = w(i) + (k1 + 2*(k2+k3) + k4)/6.0;
end
