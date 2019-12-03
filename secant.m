
function [x,nf] = secant(fname,x0,x1,tol)


%initialize nf
nf = 0;

%error flagging
if(nf == tol)
    errflag = 'Error'
    return;
end

%strtofunc check
if ~isa(fname,'fofx')
  if ischar(fname)
    fname = str2func(fname);
  else
    error('Invalid filename.')
  end
end

%x set to infinity so that tolerance is never exceeded
x = inf;

% while abs value of x is greater than the tolerance, do:
while(abs(x) > tol)
    %set number of iterations
    nf = nf + 1;
    
    %passing x0, x1 to the function .m file --usefofx
    f_x0 = feval(fname, x0);
    f_x1 = feval(fname, x1);
    
    % secant formula as x
    x = (f_x1*(x1 - x0))/(f_x1 - f_x0);
    
    % x0 is now x1
    x0 = x1;
    %f(x0) is now f(x1)
    f_x0 = f_x1;
    % new x1 value is x1 - x
    x1 = x1 - x;
    
end 
% final root calculation
x = x1;
% number of iterations
nf;
end 
