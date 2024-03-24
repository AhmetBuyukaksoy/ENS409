function [root, iterations ,root_by_iter] = secantMethod(func, x0, x1, tol, maxIterations)
    
    root_by_iter = zeros(1,maxIterations);
    iterations = 0;
    abs_relative_acc = 1e-6;
    desired_acc_reached = 0;

    while iterations < maxIterations
        f_x0 = func(x0);
        f_x1 = func(x1);
        
        
        
        root = x1 - f_x1 * (x1 - x0) / (f_x1 - f_x0);
        iterations = iterations + 1;
        root_by_iter(iterations) = root;
        
        if abs(root - x1) <= abs_relative_acc && desired_acc_reached == 0
            desired_acc_reached = 1;
            disp(['Secant method converged to ', num2str(root, '%.15f'), ' with ', num2str(iterations), ' iterations']);
        end
     



        
       
        
        x0 = x1;
        x1 = root;
    end
    if abs(func(root)) <= tol
        %disp('Secant method converged to the root:');
        %disp(root);
    else
        %disp(['Secant method did not converge with ', num2str(maxIterations), ' iterations']);
    end
end
