function false_position
% Using False Position Method to approximate a root of the equation f (x) = xsin(x)-1 = 0
%{
    Using False Position Method to approximate a root of the equation f (x) = xsin(x)-1 = 0 in the 
interval [a, b]. Proceed with the method only if f (x) is continuous and f (a) and f (b) have 
opposite signs
%}

% the starting interval [a, b]
a = 0.15;
b = 0.16;

% plot the figure of the function f = 300./x*12.*((1+x/12).^240-1)-5*10^5;
plot_f(a, b)

delta = 0.5e-10;     % the tolerance for the zero
epsilon = 1E-2;     % the tolerance for the value of f at the zero
max_iter = 10;      % the maximal iteration
% Using False Position Method to approximate a root of the equation f(x) = xsin(x)-1 = 0
out = false_position(a, b, delta, epsilon, max_iter);
if out
    % If there is a root in the interval [a, b], then the results are showed.
    k = out(1);
    c = out(2);
    err = out(3);
    yc = out(4);
    fprintf('After %dth iteration, finding an approximation %0.8f\n', k, c);
    fprintf('The error estimate for the approcimation is %0.7f\n', err);
    fprintf('The value of the function is %e\n', yc);
end

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
% return the value of the function "300./x*12.*((1+x/12).^240-1)-5*10^5"

y = 300./x*12.*((1+x/12).^240-1)-5*10^5;

end


function out = false_position(a, b, delta, epsilon, max_iter)
%{
Input  - a and b are the left and right end points
          - delta  is the tolerance for the zero
          - epsilon is the tolerance for the value of f at the zero
Output - out is false if there is no root in the interval [a, b]; or else, out = [k, c, err, yc]
                - k is the iterations which is needed
                - c is the zero
                - yc=f(c)
                - err is the error estimate for c
%}
ya = feval('f', a);
yb = feval('f', b);
if ya*yb>0
    fprintf('Note: f(a)*f(b)>0\n');
    out = false;
    return;
end

% the 0th iteration
c = b-yb*(b-a)/(yb-ya);
yc = feval('f', c);
fprintf('%-4s%16s%24s%24s%20s\n', 'k', 'ak', 'ck', 'bk', 'f(ck)');
fprintf('%-4d%16.8f%16.8f%16.8f%16.8f\n', 0, a, c, b, yc);

if (b-a)>delta && abs(yc)>epsilon
    for k=1:max_iter
        if yc==0
            break;
        elseif yb*yc>0
            b=c;
            yb=yc;
        else
            a=c;
            ya=yc;
        end

        c = b-yb*(b-a)/(yb-ya);
        yc = feval('f', c);
        fprintf('%-4d%16.8f%16.8f%16.8f%16.8f\n', k, a, c, b, yc);
        if (b-a)<delta || abs(yc)<epsilon, break, end
    end
end

err = b-a;

out = [k, c, err, yc];

end