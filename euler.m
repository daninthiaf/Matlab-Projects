function w = euler(f,a,b,alpha,N)
%
% Daninthia Fox
% UAID:010762674
% MATH 4363: Numerical Analysis - Programming Assignment #5
% _______________________________________________________________________________________
% This is a subroutine to approximate the solution y(t), to the IVP y'(t) =
% f(t,y), y(a) = alpha, t is an element of the interval a to b using Euler's Method.
% 
% Inputs:
% f: function we want to evaluate 
% a: the first value on our interval from a to b
% b: the last value on our interval from a to b
% alpha: the initial y value evaluted with t = a
% N: number of subintervals
%
% Outputs:
% w: a vector approximation to our function over the interval a to b
%
 h = (b - a) / N; % step size
 t = a; % assign t as a
 w = alpha; % assign w as alpha (value we start with)
    
  for j = 1 : N % for loop starting from 1 to N
      w(j + 1) = w(j) + h * feval(f, t(j), w(j)); % calculate w(j)
      t(j + 1) = a + j * h; % calculate t(j)
    
  end
end
