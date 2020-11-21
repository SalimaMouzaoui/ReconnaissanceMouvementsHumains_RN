function varargout = gui_svt3(varargin)
% GUI_SVT3 MATLAB code for gui_svt3.fig
%      GUI_SVT3, by itself, creates a new GUI_SVT3 or raises the existing
%      singleton*.
%
%      H = GUI_SVT3 returns the handle to a new GUI_SVT3 or the handle to
%      the existing singleton*.
%
%      GUI_SVT3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SVT3.M with the given input arguments.
%
%      GUI_SVT3('Property','Value',...) creates a new GUI_SVT3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_svt3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_svt3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_svt3

% Last Modified by GUIDE v2.5 06-Jun-2016 19:37:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_svt3_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_svt3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui_svt3 is made visible.
function gui_svt3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_svt3 (see VARARGIN)

% Choose default command line output for gui_svt3
handles.output = hObject;
clc
value_silh = get(handles.file_silh, 'Value');
handles.value_silh = value_silh;
value_sql = get(handles.file_sql, 'Value');
handles.value_sql = value_sql;
value_ctr = get(handles.file_ctr, 'Value');
handles.value_ctr = value_ctr;

type_mouvement = getappdata(0,'type_mouvement');
handles.type_mouvement = type_mouvement;
nom_dossier = getappdata(0,'nom_doss');
handles.nom_dossier = nom_dossier;
setappdata(0,'type_mouvement', type_mouvement);
set(handles.type,'String', ['Classification : ' ,type_mouvement]);

ordre = getappdata(0,'ordre');
handles.ordre = ordre;
movegui(handles.figure1,'center')

X = imread('back1.jpg', 'jpg');  % Charge l'image
ax = axes('Units', 'Normalized', 'Position', [0 0 1 1]);  % Création d'un objet Axes prenant toute la fenêtre
imagesc(X, 'Parent', ax)  % Affiche l'image 
uistack(ax, 'bottom')     % Place l'objet Axes en arrière-plan
set(ax, 'Visible', 'off') %  Cache les marques "ticks"

%set(handles.jtable1, 'enable', 'off');
set(handles.create_file, 'enable', 'off');
set(handles.gener_file_test, 'enable', 'off');
set(handles.file_ctr, 'enable', 'off');
set(handles.file_sql, 'enable', 'off');
set(handles.file_silh, 'enable', 'off');
%set(handles.svt4, 'enable', 'off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_svt3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_svt3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in fermer4.
function fermer4_Callback(hObject, eventdata, handles)
% hObject    handle to fermer4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close all;

% --- Executes on button press in preced4.
function preced4_Callback(hObject, eventdata, handles)
% hObject    handle to preced4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 close(gui_svt3);
 run('reconnaissance')

% --- Executes on button press in svt4.
function svt4_Callback(hObject, eventdata, handles)
% hObject    handle to svt4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 close(gui_svt3);
 run('gui_svt4')


% --- Executes on button press in classif.
function classif_Callback(hObject, eventdata, handles)
% hObject    handle to classif (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.charger_matrix, 'enable', 'off');

nom_dossier = handles.nom_dossier;
disp (nom_dossier);

% Create the uitable
%set(handles.jtable1, 'Data', matrix );
          %  'ColumnName',cnames,... 
           % 'RowName',rnames

classification_via_Tchebichev_all_postures( nom_dossier, nb_frames_selected );
ch = 'matrix';
filename = strcat(nom_dossier, '.mat'); %'Mouvements_Avec_Deplacement_Train.mat';
S = load (filename, ch);
matrix = S.matrix;
l = length(matrix);
%Initalize waitbar
h = waitbar(0,'Loading...',...
            'Name','Exécution');
% Update waitbar
for step = 1:l
    waitbar(step / l,h,sprintf('Loading...%.2f%%',step/l*100));
end
%Delete waitbar
delete(h)
cnames = {'Numéro Posture', 'Chemin_Posture', 'Type_Mouvement', 'Classe_Posture'};
% Create the uitable
% set(handles.jtable1, 'Data', matrix, ...
%             'ColumnName',cnames);
%matrix(:,1) = cellfun(@(x) ['<html><font size="6"><table border=0 align="center" width="800px" bgcolor="#FF0000"><TR><TD>' x '</TD></TR> </table></font></html>'], matrix(:,1), 'UniformOutput', false);
matrix(:,2) = cellfun(@(x) ['<html><font size="6"><table border=0 align="center" width="800px" bgcolor="#FFE4E1"><TR><TD>' x '</TD></TR> </table></font></html>'], matrix(:,2), 'UniformOutput', false);
matrix(:,3) = cellfun(@(x) ['<html><font size="6"><table border=0 align="center" width="800px" bgcolor="#98FB98"><TR><TD>' x '</TD></TR> </table></font></html>'], matrix(:,3), 'UniformOutput', false);
%matrix(:,4) = cellfun(@(x) ['<html><font size="6"><table border=0 align="center" width="800px" bgcolor="#D8BFD8"><TR><TD>' x '</TD></TR> </table></font></html>'], matrix(:,4), 'UniformOutput', false);
%t = uitable('Data', matrix_modif, 'ColumnName',cnames);
% Create the uitable
t = uitable(handles.uipanel5,'Data', matrix , ...
            'ColumnName',cnames);
          %  'ColumnName',cnames,... 
           % 'RowName',rnames
           
set(t, 'position', [270 60 410 250]);

set(handles.file_silh, 'enable', 'on');
set(handles.file_ctr, 'enable', 'on');
set(handles.file_sql, 'enable', 'on');

handles.matrix = matrix;
handles.nom_dossier = nom_dossier;
guidata(hObject,handles)

% --- Executes on button press in charger_matrix.
function charger_matrix_Callback(hObject, eventdata, handles)
% hObject    handle to charger_matrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.classif, 'enable', 'off');
nom_dossier = handles.nom_dossier;
disp (nom_dossier);
ch = 'matrix';
filename = strcat(nom_dossier, '_All.mat'); %'Mouvements_Avec_Deplacement_Train.mat';
S = load (filename, ch);
matrix_modif = S.matrix;
matrix = S.matrix;
cnames = {'Posture', 'Chemin_Posture', 'Type_Mouvement', 'Classe_Posture'};
% Create the uitable
% set(handles.jtable1, 'Data', matrix, ...
%             'ColumnName',cnames);
% Create the uitable
%uitable('Data',{'<html><body bgcolor="#FF0000">Hello</body></html>'})

%matrix(:,1) = cellfun(@(x) ['<html><font size="6"><table border=0 align="center" width="800px" bgcolor="#FF0000"><TR><TD>' x '</TD></TR> </table></font></html>'], matrix(:,1), 'UniformOutput', false);
matrix_modif(:,2) = cellfun(@(x) ['<html><font size="6"><table border=0 align="center" width="800px" bgcolor="#FFE4E1"><TR><TD>' x '</TD></TR> </table></font></html>'], matrix_modif(:,2), 'UniformOutput', false);
matrix_modif(:,3) = cellfun(@(x) ['<html><font size="6"><table border=0 align="center" width="800px" bgcolor="#98FB98"><TR><TD>' x '</TD></TR> </table></font></html>'], matrix_modif(:,3), 'UniformOutput', false);
%matrix(:,4) = cellfun(@(x) ['<html><font size="6"><table border=0 align="center" width="800px" bgcolor="#D8BFD8"><TR><TD>' x '</TD></TR> </table></font></html>'], matrix(:,4), 'UniformOutput', false);
t = uitable('Data', matrix_modif, 'ColumnName',cnames);

% t = uitable(handles.uipanel3,'Data', matrix , ...
%             'ColumnName',cnames, {'<html><body bgcolor="#FF0000">Hello</body></html>'});
%           %  'ColumnName',cnames,... 
%            % 'RowName',rnames
%            
set(t, 'position', [310 150 410 250]);

set(handles.file_silh, 'enable', 'on');
set(handles.file_ctr, 'enable', 'on');
set(handles.file_sql, 'enable', 'on');

handles.matrix = matrix;
handles.nom_dossier = nom_dossier;
guidata(hObject,handles)

% --- Executes on button press in create_file.
function create_file_Callback(hObject, eventdata, handles)
% hObject    handle to create_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

value_silh = get(handles.file_silh, 'Value');
value_sql = get(handles.file_sql, 'Value');
value_ctr = get(handles.file_ctr, 'Value');

%matrix = handles.matrix; 

nom_dossier = handles.nom_dossier ;

matrix_to_save = strcat(nom_dossier, '_Train'); 
ch = 'matrix_train';
matrix_to_save1 = strcat(matrix_to_save, '.mat'); %'Mouvements_Avec_Deplacement_Train.mat';
S = load (matrix_to_save1, ch);
matrix = S.matrix_train;

ordre = handles.ordre;
if value_ctr == 1
            %Initalize waitbar
h = waitbar(0,'Loading...',...
            'Name','Exécution');
% Update waitbar
for step = 1:l
    waitbar(step / l,h,sprintf('Loading...%.2f%%',step/l*100));
end
%Delete waitbar
delete(h)
    lancer_techebychev_contour( matrix, matrix_to_save, ordre )
elseif value_silh == 1
            %Initalize waitbar
h = waitbar(0,'Loading...',...
            'Name','Exécution');
% Update waitbar
for step = 1:l
    waitbar(step / l,h,sprintf('Loading...%.2f%%',step/l*100));
end
%Delete waitbar
delete(h)
    lancer_techebychev_silhouette( matrix, matrix_to_save, ordre )
elseif value_sql == 1
            %Initalize waitbar
h = waitbar(0,'Loading...',...
            'Name','Exécution');
% Update waitbar
for step = 1:l
    waitbar(step / l,h,sprintf('Loading...%.2f%%',step/l*100));
end
%Delete waitbar
delete(h)
    lancer_techebychev_squelette( matrix, matrix_to_save, ordre )    
end

affichage = strcat('Fichiers D''Apprentissage Générés ');
    h = msgbox(affichage, 'Message '); %de Reconnaissance
    set(h, 'position', [470 280 180 50]); 
    ah = get( h, 'CurrentAxes' );
    ch = get( ah, 'Children' );
    set( ch, 'FontSize', 10 );
set(handles.svt4, 'enable', 'on');

% --- Executes on button press in file_silh.
function file_silh_Callback(hObject, eventdata, handles)
% hObject    handle to file_silh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of file_silh
value_silh = get(handles.file_silh, 'Value');
handles.value_silh = value_silh;
handles.value_sql = 0;
handles.value_ctr = 0;

set(handles.gener_file_test, 'enable', 'on');
set(handles.create_file, 'enable', 'on');

% --- Executes on button press in file_sql.
function file_sql_Callback(hObject, eventdata, handles)
% hObject    handle to file_sql (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of file_sql

value_sql = get(handles.file_sql, 'Value');
handles.value_sql = value_sql;
handles.value_silh = 0;
handles.value_ctr = 0;

set(handles.gener_file_test, 'enable', 'on');
set(handles.create_file, 'enable', 'on');

% --- Executes on button press in file_ctr.
function file_ctr_Callback(hObject, eventdata, handles)
% hObject    handle to file_ctr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of file_ctr

value_ctr = get(handles.file_ctr, 'Value');
handles.value_ctr = value_ctr;
handles.value_sql = 0;
handles.value_silh = 0;
set(handles.gener_file_test, 'enable', 'on');
set(handles.create_file, 'enable', 'on');


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in gener_file_test.
function gener_file_test_Callback(hObject, eventdata, handles)
% hObject    handle to gener_file_test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

value_silh = get(handles.file_silh, 'Value')
value_sql = get(handles.file_sql, 'Value')
value_ctr = get(handles.file_ctr, 'Value')
nom_dossier = handles.nom_dossier;
%matrix = handles.matrix; 

%matrix_to_save = Classification_data_test( matrix );
matrix_to_save = strcat(nom_dossier, '_Test'); 
ch = 'matrix_test';
matrix_to_save1 = strcat(matrix_to_save, '.mat'); %'Mouvements_Avec_Deplacement_Train.mat';
S = load (matrix_to_save1, ch);
matrix_test = S.matrix_test;
l = length(matrix_test);
handles.matrix_test = matrix_test;
ordre = handles.ordre;
if value_ctr == 1
        %Initalize waitbar
h = waitbar(0,'Loading...',...
            'Name','Exécution');
% Update waitbar
for step = 1:l
    waitbar(step / l,h,sprintf('Loading...%.2f%%',step/l*100));
end
%Delete waitbar
delete(h)
    lancer_techebychev_contour( matrix_test, matrix_to_save, ordre )
elseif value_silh == 1
    %Initalize waitbar
h = waitbar(0,'Loading...',...
            'Name','Exécution');
% Update waitbar
for step = 1:l
    waitbar(step / l,h,sprintf('Loading...%.2f%%',step/l*100));
end
%Delete waitbar
delete(h)

    lancer_techebychev_silhouette( matrix_test, matrix_to_save, ordre )
elseif value_sql == 1
        %Initalize waitbar
h = waitbar(0,'Loading...',...
            'Name','Exécution');
% Update waitbar
for step = 1:l
    waitbar(step / l,h,sprintf('Loading...%.2f%%',step/l*100));
end
%Delete waitbar
delete(h)
    lancer_techebychev_squelette( matrix_test, matrix_to_save, ordre )    
end

affichage = strcat('Fichiers De Test Générés ');
    h = msgbox(affichage, 'Message '); %de Reconnaissance
    set(h, 'position', [470 280 180 50]); 
    ah = get( h, 'CurrentAxes' );
    ch = get( ah, 'Children' );
    set( ch, 'FontSize', 10 );
    
set(handles.svt4, 'enable', 'on');


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nom_dossier = handles.nom_dossier; %nom_dossier, 'Sélectionne l''ensemble de dossiers de Test', 
%nom_mvt = 'Mouvements_Leger';
nom_mvt = nom_dossier;
nom_doss = strcat(nom_dossier, '_Test')
%nom_doss = 'Mouvements_Leger_Test';
nb_postures = 6;

nom_dossier2 = strcat(nom_dossier, '_All');
%nom_dossier = 'Mouvements_Leger_All';
ch = 'matrix';
filename = strcat(nom_dossier2, '.mat'); %'Mouvements_Avec_Deplacement_Train.mat';
S = load (filename, ch);
matrix_all = S.matrix;

separation_data_app_test( matrix_all, nom_doss, nb_postures, nom_mvt )
% ch = 'array_mvt';
% filename = strcat(nom_dossier, '.mat'); %'Mouvements_Avec_Deplacement_Train.mat';
% S = load (filename, ch);
% array_mvt = S.array_mvt
affichage = strcat('Divsion des données terminée ');
    h = msgbox(affichage, 'Message '); %de Reconnaissance
    set(h, 'position', [470 280 180 50]); 
    ah = get( h, 'CurrentAxes' );
    ch = get( ah, 'Children' );
    set( ch, 'FontSize', 10 );
