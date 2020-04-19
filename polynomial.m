function polynomial

xdata=[0,1,2,3,4,5,6];
ydata=[1,3,2,1,3,2,1];


x=linspace(0,6,100);
plot(x,polyval(p,x),'--b')
hold on
plot(xdata,ydata,'or')
end

function X = uptrbk(A,B)

%Input  - A is an N x N nonsingular matrix
%       - B is an N x 1 matrix
%Output - X is an N x 1 matrix containing the solution to AX=B.
%Initialize X and the temporary storage matrix C
[N, N] = size(A);
X = zeros(N,1);
C = zeros(1, N+1);
%Form the augmented matrix:Aug=[A|B]
Aug=[A B];

for p=1:N-1
    %Partial pivoting for column p
    [Y,j]=max(abs(Aug(p:N,p)));
    %Interchange row p and j
    C=Aug(p,:);
    Aug(p,:)=Aug(j+p-1,:);
    Aug(j+p-1,:)=C;
    if Aug(p,p)==0
        break
    end
    %Elimination process for column p
    for k=p+1:N
        m=Aug(k,p)/Aug(p,p);
        Aug(k,p:N+1)=Aug(k,p:N+1)-m*Aug(p,p:N+1);
    end
end
%Back Substitution on [U|Y] using Program 3.1
X=backsub(Aug(1:N,1:N),Aug(1:N,N+1));

end


function X=backsub(A,B)
%Input  - A is an n x n upper-triangular nonsingular matrix
%       - B is an n x 1 matrix
%Output - X is the solution to the linear system AX = B
%Find the dimension of B and initialize X
n=length(B);
X=zeros(n,1);
X(n)=B(n)/A(n,n);
for k=n-1:-1:1
   X(k)=(B(k)-A(k,k+1:n)*X(k+1:n))/A(k,k);
end
end