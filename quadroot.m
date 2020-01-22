
% We want to evaluate the roots of a function using the uadratic formula in th form: ax^2 + bx + c
% it has roots r1 & r2
% If errflag = 0 then roots r1,r2 are output in x1, x2
% if errflag = ('x1 is real & x2 is imaginary') 
% the roots are x1,ix2

%calls the function quadroot and errflag created

function [x1, x2, errflag] = quadroot(a,b,c) 
errflag = 0;

%finds maximum absolute valute of a, b & c
m = max(abs([a,b,c]));

%flags an error when m is equal to 0 and prints error message
if m == 0
    errflag = ('All coefficients are 0');
    x1 = NaN;
    x2 = x1;
    return;
end

%scaling done here & divides the a b & c values by the maximum value
a = a / m;
b = b / m;
c = c / m;
 
%given discriminant
d = (b*b - 4*a*c);

%checks to see if the absolute value of a is less than eps 
%then sends out an error message
if abs(a) < eps
    errflag = ('This is not a quadratic.');
end

%case for d being less than 0; x1 is real & x2 is imaginary
if d < 0
    x1 = (-b)/(2*a);
    x2 = (sqrt(-d))/(2*a);
    errflag = ('x1 is real part & x2 is imaginary part.');

%if d is greater than 0, use normal quadratic formulas for x1,x2
elseif d > 0
    %fprintf('Two roots:\n');    
    x1 = (-b + sqrt(d))/(2*a);
    x2 = (-b - sqrt(d))/(2*a);
    
%if b is greater than 0, b becomes postive and x2 is c/(a*x1)
elseif b > 0
    x1 = -b+sqrt(d)/(2*a);
    x2 = c/(a*x1);
    
%if d is equal to 0, calculate without sqrt of d
elseif d == 0
    x1 = -b/(2*a);
    x2 = +b/(2*a);  
    
%any other case    
else
     x1 = -b-sqrt(-d)/(2*a);
     x2 = c/(a*x1);
end

