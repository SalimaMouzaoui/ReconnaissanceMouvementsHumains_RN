function [ T ] = chebychev_silhouette( f, width, height, p, q )

% conversion du type uint8 vers le type double
f = im2double(f);

somme = zeros(1, 1, 'double');

for x = 1 : height
    for y = 1 : width
        
        % 1 => blanc et 0 => noir 

        if (f(x, y) == 1 ) % seulement si c'etait un blanc
            somme = somme +  ChebyshevPoly( p, x, height) * ChebyshevPoly( q, y, width) * f(x, y); 
        end
    end
end

Res = 1 / (phi(p, height) * phi(q, width));

T = Res * somme;

end

