function [ t_k ] = ChebyshevPoly( n, x, N)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if n == 0
    t_k = 1;
elseif n == 1
    t_k = (2 * x + 1 - N) / N;
else
    % if n > 1 en logique et > 2 en matlab car les indices commencent de un (1) 
    t_k_1 = (2 * x + 1 - N) / N;
    t_k_pred2 = 1; 
    t_k_pred1 = t_k_1;
    
    temp2 = (N^2);
    for k = 2 : n
        temp1 = ((k-1)^2);
        temp3 = temp1 / temp2;
        
        t_k = ((2*k - 1) * t_k_1 * t_k_pred1 - ( k - 1) * (1 - temp3) * t_k_pred2) / k;
              
        t_k_pred2 = t_k_pred1; 
        t_k_pred1 = t_k;
          
    end
end
  

    
end

