function secant_program_2_6
%plot the function
%the interval [a,b]
a = -3;
b = 2;
x = a:0.05:b;
y = f(x);
figure('name', 'f(x)'), plot(x,y);
grid on;

%two initial approximations 
p0 = 1.2;
p1 = 1.1;
%delta is the tolerance 
delta = 1E-10;
%epsilon is the tolerance for the function values 
epsilon = 1E-10;
%max_iter is the maximum number of iteration
max_iter = 50;
%secant method 
r = secant(p0, p1, delta, epsilon, max_iter);
disp(r);
end


function y = f(x)
y = x.^3 - 3*x +2;
end 


function r = secant(p0, p1, delta, epsilon, max_iter)

for k = 1:max_iter
   p2 = p1 - f(p1)*(p1-p0)/(f(p1)-f(p0));
   err = abs(p2-p1);
   rel_err = 2*err/(abs(p2)+delta);
   r = p2;
   if err<delta || rel_err<delta || abs(f(r))<epsilon
       break;
   end
   p0 = p1;
   p1 = p2;
    
end

end
