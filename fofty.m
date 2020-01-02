
function w = fofty(t,y)
%
% This is a function that evalautes the following polynomial for our Euler &
% Runge-Kutta subroutines.
%
% Inputs:
% t: our t values
% y: our y values
%
% Outputs:
% w: a value for our function evaluation

w = -20 *(y - (t*t)) + 2 * t;

end 
