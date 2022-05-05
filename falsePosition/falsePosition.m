function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit)
%falsePosition finds the root of a function using false position method

%Test to see if the bounds are greater than 0 and to see if they are the roots
if func(xl)*func(xu) > 0 
    error('Your bounds do not have opposite signs please guess again.')
else 
    if nargin < 4 || isempty(es)
        es = 0.001;
    end
    if nargin < 5 || isempty(maxit)
        maxit = 200;
    end

    iter = 0;
    ea = 1;
    x = 0;
    while ea > es && iter<=maxit
        xr = x ;
        yxl = func(xl);
        yxu = func(xu);
        x = xu - ((yxu)*(xu-xl))/(yxu-yxl);
        test = func(x)*yxl;

        if test<0
            xu = x;
        else
            xl = x;
        end
        
        ea = abs((x-xr)/x)*100;
        iter = iter+1;
        
    end
    root = x
    fx = func(x);
    ea = ea;
    iter = iter;
end