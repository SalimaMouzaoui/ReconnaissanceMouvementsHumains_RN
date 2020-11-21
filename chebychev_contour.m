function [ T ] = chebychev_contour( f, width, height, boundaries, p, q )

%imshow(f);
% conversion du type uint8 vers le type double
f = im2double(f);

somme = zeros(1, 1, 'double');

% contour(:,2) représente le X

for i = 1 : length(boundaries)
    contour = boundaries{i};
    tab1 = contour(:, 1);
    tab2 = contour(:, 2);
   
    for j = 1 : length(tab1)
        for x = 1 : height
            for y = 1 : width
                if (x == tab1(j) && y == tab2(j)) % si est un point contour
                        %disp (f(x, y));     
                        somme = somme +  ChebyshevPoly( p, x, height) * ChebyshevPoly( q, y, width) * f(x, y);
                end
            end
        end
    end 
end


Res = 1 / (phi(p, height) * phi(q, width));

T = Res*somme;

end

