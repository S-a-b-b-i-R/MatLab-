function back_substitution_program_3_1
% To solve the upper triangular system by the AX=B by the method of back
% substitution 

% a is an n x n upper triangular non-singular matrix 
a = [4 -1 2 3;
    0 -2 7 -4;
    0 0 6 5;
    0 0 0 3];
% b is an n x 1 matrix 
b = [ 20 -7 4 6]';
x = backsub(a, b);
disp(x);

end

function x = backsub(a, b)

n = length(b);
% initialize column vector x
x = zeros(n, 1);
x(n) = b(n)/a(n, n);
for k = n-1:-1:1
   x(k) = (b(k) - a(k, k+1:n) * x(k+1:n))/a(k, k); 
end

end