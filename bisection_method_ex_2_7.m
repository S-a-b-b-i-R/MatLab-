function bisection_method_ex_2_7
% Using Bisection Method to approximate a root of the equation f (x) = xsin(x)-1 = 0
%{
    Using Bisection Method to approximate a root of the equation f (x) = xsin(x)-1 = 0 in the 
interval [a, b]. Proceed with the method only if f (x) is continuous and f (a) and f (b) have 
opposite signs
%}

% the starting interval [a, b]
a = 0.15;
b = 0.16;

% plot the figure of the function f = xsin(x)-1
plot_f(a, b)

% the tolerance
delta = 0.5e-10;
% Using Bisection Method to approximate a root of the equation f(x) = xsin(x)-1 = 0
[k, c, err, yc] = bisect(a, b, delta);

fprintf('After %dth iteration, finding an approximation %0.8f\n', k, c);
fprintf('The error estimate for the approcimation is %0.4f\n', err);
fprintf('The value of the function is %0.6f\n', yc);

end


function plot_f(a, b)
% Plot the figure of the function f = xsin(x)-1

x = linspace(a, b, 50);
y = feval('f', x);

plot(x, y);
grid on;
xlabel('x');
ylabel('y');
end


function y = f(x)
% return the value of the function "xsin(x)-1"

y = 300./x*12.*((1+x/12).^240-1)-5*10^5;

end


function [k, c, err, yc] = bisect(a, b, delta)
%{
Input  - a and b are the left and right end points
          - delta  is the tolerance for the zero
Output - k is the iterations which is needed
            - c is the zero
            - yc=f(c)
            - err is the error estimate for c
%}
ya = feval('f', a);
yb = feval('f', b);
if ya*yb>0
    fprintf('Note: f(a)*f(b)>0\n');
    return;
end

% the 0th iteration
c = (a+b)/2;
yc = feval('f', c);
fprintf('%-4s%16s%24s%24s%20s\n', 'k', 'ak', 'ck', 'bk', 'f(ck)');
fprintf('%-4d%16.8f%16.8f%16.8f%16.6f\n', 0, a, c, b, yc);

% the maximal number of the iteration
max_iter = floor((log(b-a)-log(delta))/log(2));
if (b-a)/2>delta
    for k=1:max_iter
        if yc==0
            a=c;
            b=c;
        elseif yb*yc>0
            b=c;
            yb=yc;
        else
            a=c;
            ya=yc;
        end
        
        c = (a+b)/2;
        yc = feval('f', c);
        fprintf('%-4d%16.8f%16.8f%16.8f%16.6f\n', k, a, c, b, yc);
        if (b-a)/2<delta, break, end
    end
end

err = (b-a)/2;

end