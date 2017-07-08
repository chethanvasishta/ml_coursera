function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% calculate the cost
cost = (X * theta) - y; % 12 x 2 multiplied by 2 x 1 = 12 x 1
J = J + sum(cost .* cost);

% regularize
theta_wo_firstTerm = theta(2:end);
theta_squared_sum = sum(theta_wo_firstTerm.*theta_wo_firstTerm);
J = J + lambda * theta_squared_sum;

J = J/(2*m);

% find gradients
n = size(theta);
for j = 1:n,
	grad(j) += (X * theta - y)' * X(:,j) ; %12 x 1 * (x)
	if j != 1,
		grad(j) += lambda * theta(j); % regularization
	end;
end;
grad = grad/m;
% =========================================================================

grad = grad(:);

end
