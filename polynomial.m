function y = polynomial(xNodes,yNodes,x)
%POLYINTERP  Polynomial interpolation.
 %   y = POLYINTERP(xNodes,yNodes,x) computes y(j) = P(x(j)) where Pis the
%   polynomial of degree d = length(xNodes)-1 with P(xNodes(i)) = yNodes(i).
% Use Lagrangian representation.
% Evaluate at all elements of u simultaneously.
% Modified from Moler: NCM routines
n = length(xNodes); 
% number of interpolating points
y = zeros(size(x));
for k = 1:n
   w = ones(size(x)); 
% start calculating Lagrange Weights
for j = [1:k-1 k+1:n]  
% skip over node k
      w = (x-xNodes(j))./(xNodes(k)-xNodes(j)).*w;
end
   y = y + w*yNodes(k);
end