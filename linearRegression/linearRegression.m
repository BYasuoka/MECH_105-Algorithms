function [fX, fy, slope, intercept, Rsquared] = linearRegression(x,y)
%Created byp: Brenton ypasuoka on 4/17/2022
%Last edit:
% linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. yp: yp-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fyp: yp-values with outliers removed
%     3. slope: slope from the linear regression yp=mx+b
%     4. intercept: intercept from the linear regression yp=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

%Test for Equal Size
if length(y) ~= length(x)
    error('X and yp arrayp sneed to be equal in size');
end

[yp,sortOrder] = sort(y); %Sorting the array in increassing order
xp = x(sortOrder);

[~,n] = size(x);

%Filter the Outliers out
a = floor((n+1)/4); % First Quartile
b = floor((3*n+3)/4); %Third Quartile
Q1 = yp(a);
Q3 = yp(b);
IQR = Q3-Q1;
lowBrac = Q1 - IQR*1.5;
upBrac = Q3 + IQR*1.5;

array_track = logical(ones(1,n));

h = 0;
for i = 1:n
    if lowBrac >= yp(i) || yp(i) >= upBrac
        array_track(i) = 0
    end
end

yp = yp(array_track);
xp = xp(array_track);

%Compute the Linear Regression
[~,n] = size(xp);
x_sum = sum(xp);
y_sum = sum(yp);
x_sq_sum = sum(xp.^2);
x_sum_sq = x_sum^2;
xy_sum = sum(xp.*yp);

a1 = (n*xy_sum - (x_sum*y_sum))/(n*x_sq_sum - x_sum_sq); %a1 calculations
%a0 calculations
y_bar = mean(yp);
x_bar = mean(xp);
a0 = y_bar - (x_bar*a1);

%State Function
f = @(x) a0 + a1*x;

%R^2 Calculations


for i = 1:n
    j = (yp(i) - a0 -a1*xp(i))^2;
    Sr_array(i) = j;

    h = (yp(i) - y_bar)^2;
    St_array(i) = h;
end

St = sum(St_array);
Sr = sum(Sr_array);
R2 = (St - Sr)/St;

%DONE 

fX = xp;
fy = yp;
slope = a1;
intercept = a0;
Rsquared = R2;

end