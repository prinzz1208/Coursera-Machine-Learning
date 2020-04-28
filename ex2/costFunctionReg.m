function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


h = sigmoid(X*theta);
temp = 1-h;
theta(1,1) = 0;
##J = ((1/m)*( (-y'*(log(h))) - (1-y')*(log(temp)))) + (lambda/(2*m)) * sum(theta([2:rows(theta)],:));
J = ((1/m)*( (-y'*(log(h))) - (1-y')*(log(temp)))) + (lambda/(2*m)) * (theta'*theta);

for j = 1:size(theta)
  Sum = 0;
  for i = 1:m
    Sum = Sum + (h(i) - y(i))*X(i,j);
  endfor
  if j == 1
    grad(j) = 1/m*Sum ;
  else
    grad(j) = 1/m*Sum + (lambda/m) * theta(j);  
  endif
endfor


% =============================================================

end
