function [root, iterations, root_by_iter] = newtonsMethod(func, func_prime, x0, tol, maxIterations)
   
    iterations = 0;
    root_by_iter = zeros(1,maxIterations);
    abs_relative_acc = 1.e-6;
    desired_acc_reached = 0;


    while iterations < maxIterations
        f_x0 = func(x0);
        f_prime_x0 = func_prime(x0);
        
        if abs(f_prime_x0) < tol
            error('Derivative is close to zero, Newton''s method fails.');
        end
        
        root = x0 - f_x0 / f_prime_x0;
        iterations = iterations + 1;
        root_by_iter(iterations) = root;
        
        
        
        x0 = root;

        if (iterations > 1) && (abs(root - root_by_iter(iterations-1)) < abs_relative_acc) && (desired_acc_reached == 0)
            desired_acc_reached = 1;
            disp(['Newtons method converged to ', num2str(root, '%.15f'), ' with ', num2str(iterations), ' iterations']);
        end
    end
    if abs(func(root)) <= tol
        %disp('Newtons method converged to the root:');
        %disp(root);
    else
        %disp(['Newtons method did not converge with ', num2str(maxIterations), ' iterations']);
    end
end
