function [ ] = Lancer_Selection( tableau, nom_dossier, list_dossier )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%if (isempty(strfind(nom_dossier, 'CollapseRight')) == 0)

% (isempty(strfind(nom_dossier, 'WalkLeftToRight')) == 0) &&
if (isempty(strfind(nom_dossier, 'Actor1')) == 0) && (isempty(strfind(nom_dossier, 'Camera3')) == 0) && (isempty(strfind(nom_dossier, 'Sample1')) == 0)
    
    % C'est à dire c'est le premier dossier a traiter afin de faire le
    % recalage avec
    seuil_predef = def_seuil(nom_dossier);
    
    nb_frames = length(tableau);
    
  %  disp (nb_frames);
    
    tab_elet_centre = Selection(nom_dossier, tableau, nb_frames, seuil_predef);
    
   % disp (tab_elet_centre);
    
   % disp (' Selection 2 ---------------------------- ');
    % Une deuxieme selection
    seuil_predef = def_seuil2(nom_dossier);
    nb_frames = length(tab_elet_centre);
    tab_elet_fin = Selection(nom_dossier, tab_elet_centre, nb_frames, seuil_predef);
    
    disp (tab_elet_fin);

   % chaine_sortie = strcopy( chaine_entree );
   
   nb_frames_selected = length(tab_elet_fin);
   
   for i = 1 : length(list_dossier) 
       chaine = list_dossier{i};
   %    disp (list_dossier{i});       
       
       if (isempty(strfind(nom_dossier, chaine)) == 0)
           nom_dossier_sortie1 = chaine;
       end
   end
   
   nom_dossier_sortie1 = strcat( nom_dossier_sortie1, '_Selection');
   save_frames_selected( nb_frames_selected, nom_dossier, nom_dossier_sortie1, tab_elet_fin); 
   
end
end

