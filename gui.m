
% Image en arriere plan 

X = imread('peppers.png', 'png');  % Charge l'image
ax = axes('Units', 'Normalized', 'Position', [0 0 1 1]);  % Création d'un objet Axes prenant toute la fenêtre
imagesc(X, 'Parent', ax)  % Affiche l'image 
uistack(ax, 'bottom')     % Place l'objet Axes en arrière-plan
set(ax, 'Visible', 'off') %  Cache les marques "ticks"


% 
% 
% f = figure;
% tgroup = uitabgroup('Parent', f);
% tab1 = uitab('Parent', tgroup, 'Title', 'Loan Data');
% tab2 = uitab('Parent', tgroup, 'Title', 'Amortization Table');
% tab3 = uitab('Parent', tgroup, 'Title', 'Principal/Interest Plot');
% 
% f2 = figure;