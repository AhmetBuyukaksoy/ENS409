function [root, iterations, root_by_iter] = fixedPointIteration(g, x0, tol, maxIterations)
 
    iterations = 0;
    abs_relative_acc = 1e-6;
    desired_acc_reached = 0;
    root_by_iter = zeros(1,maxIterations);
    while iterations < maxIterations
        root = g(x0);
        root_by_iter(iterations+1) = root;
        iterations = iterations + 1;

        %disp(x1)

        if (iterations > 1) && (abs(root - root_by_iter(iterations-1)) < abs_relative_acc) && (desired_acc_reached == 0)
            desired_acc_reached = 1;
            disp(['FP method converged to ', num2str(root, '%.15f'), ' with ', num2str(iterations), ' iterations']);
        end
        
       
        
        x0 = root;
    end

    if abs(g(root)) <= tol
        %disp('Fixed point iteration method converged to the root:');
        %disp(root);
    else
        %disp(['Fixed point iteration method did not converge with ', num2str(maxIterations), ' iterations']);
    end
end
