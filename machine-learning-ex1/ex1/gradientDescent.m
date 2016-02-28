function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
J_rows = zeros(num_iters, 1);
n = length(theta);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
    %calculando o h(x(i)) pro theta atual (vide computeCost.m)
    hipoteses = X * theta;

    %seguindo a formula...
    theta0 = theta(1) - alpha / m * sum((hipoteses - y) .* X(:,1));
    theta1 = theta(2) - alpha / m * sum((hipoteses - y) .* X(:,2));
    theta = [theta0; theta1];

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    J_rows(iter) = iter;
end

plot(J_rows, J_history);
fprintf('J is %f', J_history(num_iters));

end
