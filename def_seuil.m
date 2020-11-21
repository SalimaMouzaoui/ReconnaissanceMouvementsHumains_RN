function [ seuil_predef ] = def_seuil(nom_dossier)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

if(strfind(nom_dossier, 'CollapseRight') == 1)
    seuil_predef = 0.4;
end
if(strfind(nom_dossier, 'GuardToKick') == 1)
    seuil_predef = 0.15;
end
if(strfind(nom_dossier, 'GuardToPunch') == 1)
    seuil_predef = 0.17;
end
if(strfind(nom_dossier, 'KickRight') == 1)
    seuil_predef = 0.28;
end
if(strfind(nom_dossier, 'PunchRight') == 1)
    seuil_predef = 0.3;
end
if(strfind(nom_dossier, 'RunLeftToRight') == 1)
    seuil_predef = 0.5;
end
if(strfind(nom_dossier, 'StandupRight') == 1)
    seuil_predef = 0.45;
end
if(strfind(nom_dossier, 'TurnBackRight') == 1)
    seuil_predef = 0.38;
end
if(strfind(nom_dossier, 'WalkLeftToRight') == 1)
    seuil_predef = 0.6;
end

end

