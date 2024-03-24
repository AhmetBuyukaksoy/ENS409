function [root, iterations, root_by_iter] = bisectionMethod(func, a, b, tol, maxIterations)
   
    if sign(func(a)) == sign(func(b))
        disp('The function must attain opposite signs at the interval ends.');
    end
    
    iterations = 0;
    root = (a + b) / 2;
    root_by_iter = zeros(1,maxIterations);
     abs_relative_acc = 1e-6;
    desired_acc_reached = 0;
    
    while iterations < maxIterations
        root = (a + b) / 2;
        root_by_iter(iterations+1) = root;
        %disp(['Root at iteration ', num2str(iterations), ':']);
        %disp(root);
        
        if sign(func(root)) == sign(func(a))
            a = root;
        else
            b = root;
        end
        
        iterations = iterations + 1;

        if (iterations > 1) && (abs(root - root_by_iter(iterations-1)) < abs_relative_acc) && (desired_acc_reached == 0)
            desired_acc_reached = 1;
            disp(['Bisection method converged to ', num2str(root, '%.15f'), ' with ', num2str(iterations), ' iterations']);
        end
    end
    
    if abs(func(root)) <= tol
        %disp('Bisection method converged to the root:');
        %disp(root);
    else
        %disp(['Bisection method did not converge with ', num2str(maxIterations), ' iterations']);
    end

end

