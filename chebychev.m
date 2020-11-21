function [ T ] = chebychev_silhouette( f, width, height, p, q )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% disp ('p = ')
% disp (p)
% disp(' q = ')
% disp(q)
% 
% disp( 'w =' )
% disp (width)
% disp( 'h=')
% disp (height)

% conversion du type uint8 vers le type double
f = im2double(f);

somme = zeros(1, 1, 'double');
for x = 1:height
    for y = 1:width
%         disp ('x = ')
%         disp (x)
%         disp ('y = ')
%         disp(y)
%        X  = ChebyshevPoly( p, x, height) ;
%         disp('X = ')
%         disp (X)
%        Y = ChebyshevPoly( q, y, width);
%          disp('Y = ')
%         disp(Y)
        
        %f(x, y) = f(x, y) / 255;
% 
%         disp (f(x, y));

        % 1 => blanc et 0 => noir 

        if (f(x, y) == 1 ) % seulement si c'etait un blanc
            somme = somme +  ChebyshevPoly( p, x, height) * ChebyshevPoly( q, y, width) * f(x, y); 
        end
    end
end

% disp (' phi(p, width) = ')
% disp (phi(p, width));
% disp (' phi(q, height) = ')
% disp (phi(q, height));
% disp (' somme = ')
% disp (somme);
% 
% disp ('******')

Res = 1 / (phi(p, height) * phi(q, width));

T = Res*somme;

end

