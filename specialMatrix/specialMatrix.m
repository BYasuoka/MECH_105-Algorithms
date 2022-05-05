function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
if nargin ~= 2
  error('Please give two input variables')
end

A = ones(n,m);

for i = 2:n
    A(i,1) = i;
end
for i = 2:m
    A (1,i) = i;
end
for i = 2:n
    for k = 2:m
        A(i,k) = A(i,k-1)+A(i-1,k);
    end
end
disp(A)

% Now the real challenge is to fill in the correct values of A


end
% Things beyond here are outside of your function
