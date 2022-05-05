function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

[~, xSz] = size(x);
[~, ySz] = size(y);
I = 0;


%Check for size of vectors are equal
if ySz ~= xSz
    error('Vector X and Y are not the same size');
end


%Check for equal spacing in X vector
spacing = x(2) - x(1);
for i = 2:xSz
    test = x(i) - x(i-1);
    if test ~= spacing
        error('The X vector is not equally spaced. Ex: 1,2,3 or 10,15,20');
    end
end

%Check if trapezoidal rule will be used and give warning if true
r = rem(xSz,2);
if r == 0 
    warning('The trapezoidal rule will be used on last two points');
end

%How many iterations need to be done
if r == 1
    iter = (xSz-1)/2;
else
    iter = (xSz-2)/2;
end

%Simpson's rules being applied
for i = 1:iter
    %Statement of Variables for addressing
    x0 = x((i*2)-1); 
    x1 = x(i*2); 
    fx0 = y((i*2)-1);
    fx1 = y(i*2);
    fx2 = y((i*2)+1);

    %Application of 1/3
    I = I + ((x1-x0)*((fx0+4*fx1+fx2)/3));

end

%Trapezoidal Rule being Applied
if r == 0
x1 = x(xSz);
x0 = x(xSz-1);
fx1 = y(ySz);
fx0 = y(ySz-1);

trap = (x1 - x0)*((fx1+fx0)/2);
I = I+trap;
end

end