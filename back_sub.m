function back_sub
% To solve the upper triangular system by the UX=B by the method of back
% substitution 

% u is an n x n upper triangular non-singular matrix 
n = 10;
u = zeros(n,n);
for i = 1:n
    for j = i:n
        u(i,j) = cos(i*j);
    end
end
% b is an n x 1 matrix 
b = zeros(n, 1);
for r = 1:n
   b(r) = tan(r); 
end

x = backsub(u, b);
disp(x);

end

function x = backsub(u, b)
n = length(b);
% initialize column vector x
x = zeros(n, 1);
x(n) = b(n)/u(n, n);
for k = n-1:-1:1
   x(k) = (b(k) - u(k, k+1:n) * x(k+1:n))/u(k, k); 
end

end