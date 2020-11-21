function [ seuil_predef ] = def_seuil2(nom_dossier)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here


if(strfind(nom_dossier, 'CollapseRight') == 1)
    seuil_predef = 0.32;
end
if(strfind(nom_dossier, 'GuardToKick') == 1)
    seuil_predef = 0.1;
end
if(strfind(nom_dossier, 'GuardToPunch') == 1)
    seuil_predef = 0.12;
end
if(strfind(nom_dossier, 'KickRight') == 1)
    seuil_predef = 0.23;
end
if(strfind(nom_dossier, 'PunchRight') == 1)
    seuil_predef = 0.25;
end
if(strfind(nom_dossier, 'RunLeftToRight') == 1)
    seuil_predef = 0.4;
end
if(strfind(nom_dossier, 'StandupRight') == 1)
    seuil_predef = 0.4;
end
if(strfind(nom_dossier, 'TurnBackRight') == 1)
    seuil_predef = 0.37;
end
if(strfind(nom_dossier, 'WalkLeftToRight') == 1)
    seuil_predef = 0.58;
end

end

