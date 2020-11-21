function [ T ] = chebychev_Squeletisation( f, width, height, p, q )

% conversion du type uint8 vers le type double
f = im2double(f);

somme = zeros(1, 1, 'double');

for x = 1:height
    for y = 1:width
        
        % 1 => blanc et 0 => noir 

        if (f(x, y) == 1 ) % seulement si c'etait un blanc
            
            somme = somme +  ChebyshevPoly( p, x, height) * ChebyshevPoly( q, y, width) * f(x, y); 
%             if indice == 96
%                 disp ('ChebyshevPoly = ');
%                 disp (ChebyshevPoly( p, x, height));
%                 disp ('ChebyshevPoly( q, y, width) = ');
%                 disp (ChebyshevPoly( q, y, width));
%                 disp ('sommmme = ');
%                 disp (somme);
%                 
%             end
        end
    end
end
% 
% disp ('somme = ');
%  disp (somme);
 
Res = 1 / (phi(p, height) * phi(q, width));
% 
%  disp ('Res = ');
%  disp (Res);
T = Res * somme;
% 
% disp ('somme = ');
%  disp (somme);
%  
%  disp ('T = ');
%  disp (T);

end

