function app_root
%plot the function 
a = -2;
b = 2;
x = linspace(a, b, 50);
y = f(x);
plot(x, y);
grid on;

%
epsilon = 0.01;
a = -1.2;
b= 1.2;
x = linspace(a, b, 9);
r_app = approot(x, epsilon);
disp (r_app);




end 

function y = f(x)
%return the value of the function
y=sin(cos(x.^3));

end

function r_app = approot(x, epsilon)
y = f(x);
yrange = max(y) - min(y);
epsilon2 = yrange*epsilon;

n = length(x);
x(n+1) = x(n);
y(n+1) = y(n);
%number of the approximation 
m = 0;

for k =2:n
    if y(k-1)*y(k)<=0
        m = m+1;
        r_app(m) = (x(k-1) + x(k))/2;
    end
    s = (y(k)-y(k-1))*(y(k+1)-y(k));
    if abs(y(k))<epsilon2 && s<=0
        m = m+1;
        r_app(m) = x(k);
    end
end




end