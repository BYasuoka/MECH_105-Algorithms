function [L,U,P] = luDecomp(A)
%This function will create the same thing that matlab can do if you input
%[L U P] = lu(A) if you want more description type "help lu" in your
%command window

% Is the A matrix square? rSZ = Row Size, cSZ = Column Size
[rSz, cSz] = size(A);
if rSz ~= cSz
    error('Error matrix input is not square');
end
P = eye(rSz);
L = zeros(rSz);

%This is the amount of iterations I expect to do
for i = 1:rSz-1
    
    % Where is the largest abs(value) in the column of i?
    for absI = 1:rSz
        x = abs(A(absI,i));
        absArray(absI) = x;
    end
    
%   After the first iteration we want to ignore the first row or
    if i > 1 && A(i,i-1) == 0
        absArray = absArray(i:rSz);
    end
%   Find the maximum value in the absArray then find the position of that value in the array.
    m = max(absArray);
    [posR, posC] = find(A==m);
    
%   RowSwap function below swaps the rows
    A = rowSwap(A,i,posR);
    P = rowSwap(P,i,posR);
    L = rowSwap(L,i,posR);
    
%   Math and storage of L matrix
    for el = i+1:rSz
        %Create the L coefficient for the row
        lI = A(el,i)/A(i,i);
        %Math to do subtraction
        A(el,:) = A(el,:)- (lI*A(i,:));
        L(el,i)=lI;
    end
end
%Need to add the ones in the diagonal of the L matrix because the initial matrix was set up as a zero
L = oneL(L);

    function [swappedM] = rowSwap(M,r1,r2)
        %This function swaps the rows indicated.
        M([r1 r2],:) = M([r2 r1],:);
        swappedM = M;
    end

    function [fixedL] = oneL(M)
        %This function adds the 1's in the diagonal of any size matrix.
        N = size(M);
        for D = 1:N
            M(D,D) = 1;
        end
        fixedL = M;
    end
    U = A;
end

