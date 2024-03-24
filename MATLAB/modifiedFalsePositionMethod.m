function [root, iterations, root_by_iter] = modifiedFalsePositionMethod(func, a, b, tol, maxIterations)

    a_fixed = 0;
    b_fixed = 0;
    abs_relative_acc = 1e-6;
    desired_acc_reached = 0;
    
    if sign(func(a)) == sign(func(b))
        error('The function does not have opposite signs at the interval ends.');
    end
    
    % Initialize variables
    iterations = 0;
    root_by_iter = zeros(1, maxIterations);
    
    while iterations < maxIterations
        f_a = func(a);
        f_b = func(b);
        
        if a_fixed == 2
            f_a = f_a / 2;
            a_fixed = 0;
        elseif b_fixed == 2
            f_b = f_b / 2;
            b_fixed = 0;
        end
        
        root = (a * f_b - b * f_a) / (f_b - f_a);
        root_by_iter(iterations + 1) = root;
        
      
     
        
        % Update interval based on the sign of the function at the estimate
        if sign(func(root)) == sign(func(root))
            a = root;
            a_fixed = 0;
            b_fixed = b_fixed + 1;
        else
            b = root;
            b_fixed = 0;
            a_fixed = a_fixed + 1;
        end
        
        iterations = iterations + 1;

        if (iterations > 1) && (abs(root - root_by_iter(iterations-1)) < abs_relative_acc) && (desired_acc_reached == 0)
            desired_acc_reached = 1;
            disp(['MFP method converged to ', num2str(root, '%.15f'), ' with ', num2str(iterations), ' iterations']);
        end
        
        
    end
    
    % Output the result
    if abs(func(root)) <= tol
        %disp('Modified False Position method converged to the root:');
        %disp(root)
    else
        %disp('Modified False Position method did not converge within the maximum number of iterations.');
    end
end
