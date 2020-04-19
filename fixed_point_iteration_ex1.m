function fixed_point_iteration_ex1
%usingg fixed point iteration method to approximate the roots of the
%equation 
% f(x) = x^3 -x -1 = 0


%find the starting points using initial approximation method 

a = -2;
b = 2;
x = a:0.01:b;
y = f(x);
figure('name', 'f(x)');
plot(x,y);
grid on;


x = linspace(a, b, 9);
epsilon = 0.001;
r_app = approot(x, epsilon);
disp (r_app);

%plot the figure of the function g(x) = (x+1).^(1/3)
x = a:0.01:b;
y = g(x);
figure ('name', 'g(x)');
plot(x,y);
grid on;


%find the roots using fixed point iteration method 
r = zeros(length(r_app), 1);
delta = 1E-6;
max_iter = 50;
disp (r);

for i=1:length(r)
    r(i) = fixed_point(r_app(i), delta, max_iter)







end
end


function y = f(x)
y = x.^3 +x +3;

end

function y = g(x)
y = sign(x+1).*abs(x+1).^(1/3);
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



function r = fixed_point(r_app, delta, max_iter)


%accuracy in 
epsilon = eps('single');
r_seq = zeros(max_iter, 1);
r_seq(1) = r_app;
for k=2:max_iter
    r_seq(k) = g(r_seq(k-1));
    err = abs(r_seq(k) - r_seq(k-1));
    rel_err = err/(abs(r_seq(k))+epsilon);
    r = r_seq(k);
    if err < delta || rel_err < delta
        break;
    end
      
end

end