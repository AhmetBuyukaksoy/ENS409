function [root, iterations, root_by_iter] = falsePositionMethod(func, a, b, tol, maxIterations)
   
    if sign(func(a)) == sign(func(b))
        error('The function does not have opposite signs at the interval ends.');
    end
    
    % Initialize variables
    iterations = 0;
    root_by_iter = zeros(1,maxIterations);
    desired_acc_reached = 0;
    abs_relative_acc = 1e-6;
    
    while iterations < maxIterations
        root = (a * func(b) - b * func(a)) / (func(b) - func(a));
        root_by_iter(iterations + 1) = root;     
        
        if sign(func(root)) == sign(func(a))
            a = root;
        else
            b = root;
        end
        
        iterations = iterations + 1;
        
        

        if (iterations > 1) && (abs(root - root_by_iter(iterations-1)) < abs_relative_acc) && (desired_acc_reached == 0)
            desired_acc_reached = 1;
            disp(['FP method converged to ', num2str(root, '%.15f'), ' with ', num2str(iterations), ' iterations']);
        end

        
    end
    
    % Output the result
    if abs(func(root)) <= tol
        %disp('False Position method converged to the root:');
        %disp(root)
    else
        %disp('False Position method did not converge within the maximum number of iterations.');
    end
end
