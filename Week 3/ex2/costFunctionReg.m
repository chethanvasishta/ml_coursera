function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
[J, tempgrad] = costFunction(theta, X, y);
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
sum = 0;
n = size(theta);
for j=2:n,
	sum += theta(j)^2;
end;
sum = (sum * lambda)/(2*m);
J = J + sum;

grad(1) = tempgrad(1);
for j=2:n,
	grad(j) = tempgrad(j) + (lambda * theta(j))/m;
end;

% =============================================================

end
