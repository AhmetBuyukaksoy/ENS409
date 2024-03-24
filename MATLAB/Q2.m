func2 = @(x) x^2 - x - exp(-x);
g2x = @(x) ((exp(-x)) / x) + 1 ;
func2prime = @(x) 2*x - 1 + exp(-x);
a = 1;
b = 3;
tol = 1e-5;
maxIterations = 10;
% true solution using fzero
true_solution = fzero(func2, 1.5);

% Bisection part
%[root, iterations, root_by_iter] = bisectionMethod(func2, a, b, tol, maxIterations);
%Calculate absolute differences for the first 10 elements
%abs_diffs = abs(root_by_iter(1:10) - true_solution);
%disp(abs_diffs)
%plot([1,2,3,4,5,6,7,8,9,10], abs_diffs, '-o');
%xlabel('Iteration');
%ylabel('Absolute True Error');
%title('Absolute True Error vs. Iteration Number');
%grid on;

% Bisection Done!!

% False Position 

%[root, iterations, root_by_iter] = falsePositionMethod(func2, a, b, tol, maxIterations);
%Calculate absolute differences for the first 10 elements
%abs_diffs = abs(root_by_iter(1:10) - true_solution);
%disp(abs_diffs)
%plot([1,2,3,4,5,6,7,8,9,10], abs_diffs, '-o');
%xlabel('Iteration');
%ylabel('Absolute True Error');
%title('Absolute True Error vs. Iteration Number');
%grid on;

% False Position Done!

% Modified False Position

%[root, iterations, root_by_iter] = modifiedFalsePositionMethod(func2, a, b, tol, maxIterations);
%Calculate absolute differences for the first 10 elements
%abs_diffs = abs(root_by_iter(1:10) - true_solution);
%disp(abs_diffs)
%plot([1,2,3,4,5,6,7,8,9,10], abs_diffs, '-o');
%xlabel('Iteration');
%ylabel('Absolute True Error');
%title('Absolute True Error vs. Iteration Number');
%grid on;

% Modified False Position Done!

%Secant Method

%[root, iterations, root_by_iter] = newtonsMethod(func2, func2prime , a, tol, maxIterations);
%Calculate absolute differences for the first 10 elements
%disp(abs_diffs)
%plot([1,2,3,4,5,6,7,8,9,10], abs_diffs, '-o');
%xlabel('Iteration');
%ylabel('Absolute True Error');
%title('Absolute True Error vs. Iteration Number');
%grid on;

% Fixed point

[root, iterations, root_by_iter] = fixedPointIteration(g2x , a, tol, maxIterations);
%Calculate absolute differences for the first 10 elements
abs_diffs = abs(root_by_iter(1:10) - true_solution);
disp(abs_diffs)
plot([1,2,3,4,5,6,7,8,9,10], abs_diffs, '-o');
xlabel('Iteration');
ylabel('Absolute True Error');
title('Absolute True Error vs. Iteration Number');
grid on;

disp(true_solution)




