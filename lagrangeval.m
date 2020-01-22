function p = lagrangeval(x,y,w)
%
% This is a subroutine to evaluate the Lagrange interpolant for a set of
% knots.
%
% Inputs: 
% x: vector of our nodes
% y: function where f(xi) = yi
% w: independent values/ points to evaluate
%
% Outputs:
% p: a vector which containts the values of the lagrange interpolants with
% the x nodes, then evaluated at our independent values w
% 
% Error checking:
% checking for cancellation by taking care of the case of there being a 0
% in the denominator

% for readability
%format long; 

% length(not size) of our x values
n = length(x) - 1;
% size of w
k = size(w,2);
% let p be from 1 to k
p = 1:k;

%creates our table for q matrix
q = ones(n + 1, n + 1);
% replaces first column of ones with y values
q(:,1) = y;

%loop that perfoms our lagrange interpolant calculation
for m = 1: k
 for i = 1: n
     for j = 1: i
        d = (x(i + 1) - x(i-j + 1));
        %check if d = 0 then assign it a reasonable value
        if abs(d) < eps
            d = 1e-66;
        end
        % if j is not equal to i, do this:
            if j~= i
                r = (w(m) - x(i - j).*q(i + 1, j)) - (w(m)-x(i).* q(i, j));
                q(i, j) = r ./ d;
            end 
      end
 end
   % final values which are our vectors that contain our lagrange interpolants with x
   % nodes evaluated with our w independent values
    p(m) = q(n, n);
end
end
