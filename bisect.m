
function [l,r,nf] = bisect(fname,a,b,tol)

% We want to calculate: Roots & # of iterations for the func: f(x)= cos(x) - sin(x)
% using the Bisection & Secant Methods
% Bisection:
%  - errflag message output for if there are no roots
% Secant: 
%  - errflag message output for if nf equal to the tol

%initialize iterations
nf = 0;

% fa = feval(fname, a);
% fb = feval(fname, b);

%strtofunc check
if ~isa(fname,'fofx')
  if ischar(fname)
    fname = str2func(fname);
  else
    error('Invalid file name.')
  end
end

% passing a, b to the function .m file --usefofx
 fa = feval(fname, a);
 fb = feval(fname, b);

 %error flagging
if(fa * fb) == 0 ||(fa * fb) > 0
    errflag = 'Pick different intervals. No roots.'
    x = NaN;
    return;
else
    %feval does not work here for some reason
    while(fname(a) - fname(b) > tol)
        % calculate c. merging of 1 + b / 2 & b - a 
        c = a + (b - a)/2;
        
        %fc = feval(fname, c);
        %check if f(c) is postive here. if yes b = c. if not, a = c
        if(fname(a) * fname(c)) > 0
            b = c;
        else
            a = c;
        end
        %iterations at the end
        nf = nf + 1;
    end
end
% left bound will be a
l = a;
% right bound will be b
r = b;
% final number of iterations
nf;

end
