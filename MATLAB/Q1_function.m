
% Define the function
func1 = @(x) 4*x^3 - 8*x^2 + 3*x - 10;
gx = @(x) 4/(4*x^2 + 3) + 2;
func1_prime = @(x) 12*x^2 - 16*x + 3;
% Define the interval [a, b]
a = 2;
b = 4;

% Set the tolerance and maximum number of iterations
tol = 1e-5;
maxIterations =30;

% Initialize arrays to store iterations and absolute true errors
iteration_count = zeros(maxIterations, 1);
absolute_true_errors = zeros(maxIterations, 1);

% Call the bisection method function
%[root, iterations, root_by_iter] = bisectionMethod(func1, a, b, tol, maxIterations);

%[root, iterations1,root_by_iter] = fixedPointIteration(gx, a, tol, maxIterations);
%root = secantMethod(func1, a, b, tol, maxIterations);
%root = fixedPointIteration(fixed_point_func, a, tol, maxIterations);
root = bisectionMethod(func1,a,b,tol,maxIterations);
%disp(root)