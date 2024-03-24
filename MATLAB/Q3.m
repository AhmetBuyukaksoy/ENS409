func = @(x) x^2 - 4*x*sin(x) + 1;
gx = @(x) (x^2 + 1)/(4*sin(x));
% Find the derivative of the function for newtons method
derivative_func = @(x) 2*x - 4*sin(x) - 4*x*cos(x);
tol = 1.e-5;
maxIterations = 10000;
a = -2;
b = -2;

[root, iterations, root_by_iter] = newtonsMethod(func,derivative_func, a, tol, maxIterations);
%disp(root)
