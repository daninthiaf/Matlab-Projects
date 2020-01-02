function w = rk4(f,a,b,alpha,N)
%
% This is a subroutine to approximate the solution y(t),to the IVP y'(t) =
% f(t,y), y(a) = alpha, t is an element of the interval a to b using the
% 4th order Runge-Kutta Method.
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

    for i = 1 : N % for loop starting from 1 to N
        k1 = h * feval(f,t(i), w(i)); % 1st order
        k2 = h * feval(f,t(i) + h / 2, w(i) + k1 / 2); % 2nd order
        k3 = h * feval(f,t(i) + h / 2, w(i) + k2 / 2); % 3rd order
        k4 = h * feval(f,t(i) + h, w(i) + k3); % 4th order
    
        w(i + 1) = w(i) + (k1 + (2 * k2) + (2 * k3) + k4) / 6; % calculate w(i)
        t(i + 1) = a + i * h; % calculate t(i)
    
    end
end
     