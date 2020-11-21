function [ matrix_distance ] = Distance_Hamming( target, matrix_codage )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[m, n] = length(matrix_codage);
matrix_distance = zeros (1, m);

for i = 1 : m
    for k = 1 : n
        array(k) = matrix_codage(i, k);        
    end
    matrix_distance(i) = calcul_intersect(target, array);
end


distance = zeros (1, m);
i = 1;
while i <= length(target)
     for j = 1 : m
	     for k = 1 : n
		    if target(i) == matrix_codage(j, k)
			    distance(j) = distance(j) + 1; % incrémentation
				break;			
			end
		 end
		 i = i + 1;	
	 end
end

end

