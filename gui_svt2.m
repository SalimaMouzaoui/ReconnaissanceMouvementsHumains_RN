function varargout = gui_svt2(varargin)
% GUI_SVT2 MATLAB code for gui_svt2.fig
%      GUI_SVT2, by itself, creates a new GUI_SVT2 or raises the existing
%      singleton*.
%
%      H = GUI_SVT2 returns the handle to a new GUI_SVT2 or the handle to
%      the existing singleton*.
%
%      GUI_SVT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SVT2.M with the given input arguments.
%
%      GUI_SVT2('Property','Value',...) creates a new GUI_SVT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_svt2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_svt2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_svt2

% Last Modified by GUIDE v2.5 31-May-2016 14:37:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_svt2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_svt2_OutputFcn, ...
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


% --- Executes just before gui_svt2 is made visible.
function gui_svt2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_svt2 (see VARARGIN)

% Choose default command line output for gui_svt2
handles.output = hObject;
clc
% 
% handles.filename = varargin{1}.filename;
% handles.nom_video = varargin{1}.nom_video;

filename = getappdata(0,'filename');
nom_video = getappdata(0,'nom_video');
type_mouvement = getappdata(0,'type_mouvement');
nb_postures = getappdata(0,'nb_postures'); 
nom_doss = getappdata(0,'nom_doss'); 
nom_doss_trait = getappdata(0,'doss_selected'); 
setappdata(0,'nom_doss', nom_doss);
setappdata(0,'nb_postures', nb_postures);
handles.type_mouvement = type_mouvement;
setappdata(0,'type_mouvement', type_mouvement);

disp (nom_doss);
handles.nom_doss = nom_doss;
setappdata(0,'nom_doss', nom_doss);
handles.nom_doss_trait = nom_doss_trait;
setappdata(0,'nom_doss_trait', nom_doss_trait);

disp (nom_video);
handles.nom_video = nom_video;

movegui(handles.gui2,'center')

    set(handles.axes2,'visible', 'off');
    set(handles.axes3,'visible', 'off');
    set(handles.axes4,'visible', 'off');
    set(handles.axes5,'visible', 'off');
    set(handles.axes6,'visible', 'off');
    set(handles.axes7,'visible', 'off');
    set(handles.axes8,'visible', 'off');
    set(handles.axes9,'visible', 'off');
    set(handles.axes10,'visible', 'off');
    set(handles.axes11,'visible', 'off');
    set(handles.axes12,'visible', 'off');
    set(handles.axes13,'visible', 'off');
    
    set(handles.text_axes2,'visible', 'off');
    set(handles.text_axes3,'visible', 'off');
    set(handles.text_axes4,'visible', 'off');
    set(handles.text_axes5,'visible', 'off');
    set(handles.text_axes6,'visible', 'off');
    set(handles.text_axes7,'visible', 'off');
    set(handles.text_axes8,'visible', 'off');
    set(handles.text_axes9,'visible', 'off');
    set(handles.text_axes10,'visible', 'off');
    set(handles.text_axes11,'visible', 'off');
    set(handles.text_axes12,'visible', 'off');
    set(handles.text_axes13,'visible', 'off');
       
    set(handles.reconstruct,'enable', 'off');
    set(handles.extract,'enable', 'off');
    set(handles.check_silh,'enable', 'off');
    set(handles.check_sql,'enable', 'off');
    set(handles.check_ctr,'enable', 'off');
    
X = imread('back1.jpg', 'jpg');  % Charge l'image
ax = axes('Units', 'Normalized', 'Position', [0 0 1 1]);  % Création d'un objet Axes prenant toute la fenêtre
imagesc(X, 'Parent', ax)  % Affiche l'image 
uistack(ax, 'bottom')     % Place l'objet Axes en arrière-plan
set(ax, 'Visible', 'off') %  Cache les marques "ticks"

%set(handles.ordre, 'enable', 'off');

guidata(hObject, handles);

% UIWAIT makes gui_svt2 wait for user response (see UIRESUME)
% uiwait(handles.gui2);


% --- Outputs from this function are returned to the command line.
function varargout = gui_svt2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in fermer3.
function fermer3_Callback(hObject, eventdata, handles)
% hObject    handle to fermer3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close all;
% --- Executes on button press in preced3.
function preced3_Callback(hObject, eventdata, handles)
% hObject    handle to preced3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 close(gui_svt2);
 run('gui_svt1')

% --- Executes on button press in svt3.
function svt3_Callback(hObject, eventdata, handles)
% hObject    handle to svt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 close(gui_svt2);
 run('reconnaissance')

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function ordre_Callback(hObject, eventdata, handles)
% hObject    handle to ordre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ordre as text
%        str2double(get(hObject,'String')) returns contents of ordre as a double
value_ordre1 = get(handles.ordre, 'string');
value_ordre = str2num(value_ordre1 )

if ~isempty (value_ordre1) 
    if isa(value_ordre,'numeric') ~= 1 || isempty (value_ordre)%||  isa(nb_iter,'numeric') ~= 1%isnumeric(nb_iter) ~= 1 
        errordlg('L''ordre doit etre du type Entier','Error');
        set(handles.ordre,'string', '')
        return
    end
else
    errordlg('L''ordre doit etre du type Entier','Error');
        set(handles.nb_iter,'string', '')
    return
end

handles.ordre = value_ordre;
setappdata(0,'ordre', handles.ordre);

guidata(hObject,handles)
set(handles.extract,'enable', 'on');

set(handles.check_silh,'enable', 'on');
set(handles.check_sql,'enable', 'on');
set(handles.check_ctr,'enable', 'on');

% --- Executes during object creation, after setting all properties.
function ordre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ordre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in extract.
function extract_Callback(hObject, eventdata, handles)
% hObject    handle to extract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

value_silh1 = get (handles.check_silh, 'value');
value_sql1 = get (handles.check_sql, 'value');
value_ctr1 = get (handles.check_ctr, 'value');

nom_video = handles.nom_video;
disp (nom_video);
value_ordre = handles.ordre; 

[ name_person, name_action ] = extraction( nom_video );

if strfind (nom_video, 'Camera3') > 0 
    temp1 = name_person ;
    disp (temp1);
    temp2 = name_action;
    disp (temp2);
    name_action = temp1;
    name_person = temp2;    
    disp (name_action);
    nom_doss = 'MuHaVi_Camera3';
elseif strfind (nom_video, 'Camera4') > 0 
    temp1 = name_person ;
    temp2 = name_action;
    name_action = temp1;
    name_person = temp2;
    nom_doss = 'MuHaVi_Camera4';
else
    nom_doss  = type_mvt( name_action );
    
end

nom_doss = strcat(nom_doss, '_Test');
disp (nom_doss);
listdir = dir (nom_doss);
if strfind(nom_doss, 'Camera3') ~= 0 %|| strfind(nom_doss, 'Camera4') ~= 0
    disp ('cam3');
for i = 1 : length(listdir)
    if ~strcmp(listdir(i).name, '.') && ~strcmp(listdir(i).name, '..')
        disp ('name act');
        disp(name_action);
        disp (listdir(i).name);
        info1 = extract_camera( listdir(i).name );
        info2 = extract_camera( name_person );
        
        if strfind(listdir(i).name, name_action ) 
            if strfind(info1{1}{1}, info2{1}{1}) && strfind(info1{1}{2}, info2{1}{2}) && strfind(info1{1}{3}, info2{1}{3}) 
                nom_doss_trait = strcat(nom_doss, '\', listdir(i).name)
                doss_selected = listdir(i).name
                break;
            end
        end
    end
end 
else
for i = 1 : length(listdir)
    if ~strcmp(listdir(i).name, '.') && ~strcmp(listdir(i).name, '..')
        if strfind(listdir(i).name, name_action ) 
            if strfind(listdir(i).name, name_person)
                nom_doss_trait = strcat(nom_doss, '\', listdir(i).name);
                break;
            end
        end
    end
end
end
if value_ctr1 == 1
    set(handles.check_silh,'value',0);
    set(handles.check_sql,'value',0);    
    nom_doss_trait = strcat(nom_doss_trait, '_Contour');
else
    if value_sql1 == 1
    set(handles.check_silh,'value',0);
    set(handles.check_ctr,'value',0);
    nom_doss_trait = strcat(nom_doss_trait, '_Squeletisation');
    else        
    set(handles.check_ctr,'value',0);
    set(handles.check_sql,'value',0);
    end
end

h = 1;
disp (nom_doss_trait);
listdir2 = dir (nom_doss_trait);
for j = 1 : length(listdir2)
    if ~strcmp(listdir2(j).name, '.') && ~strcmp(listdir2(j).name, '..')
        nom_image = strcat(nom_doss_trait, '\', listdir2(j).name);
        motif = '(\d+).PNG';
        [ num_frame ] = extraction_num_frame( listdir2(j).name, motif );
        tab_indice(h) = str2num(num_frame);
        [ array1, taille, Matrice_Moment ] = recup_array_tech( nom_image, value_ordre);
        Matrice_Moment_all{1, h} = Matrice_Moment;
        for k = 1 : taille
            matrix(h, k) = array1(k);
        end
        tab_image{h} = nom_image;
        h = h + 1;
    end
end

handles.matrix = matrix;
handles.tab_indice = tab_indice;
handles.Matrice_Moment_all = Matrice_Moment_all;
handles.tab_image = tab_image;
handles.taille = taille;
handles.value_silh1 = value_silh1;
handles.value_sql1 = value_sql1;
handles.value_ctr1 = value_ctr1;
handles.nom_doss_trait = nom_doss_trait;
guidata(hObject,handles)

f = figure;
set(f, 'name', 'Vecteurs Descriptifs','numbertitle','off', 'resize','off');
% Create the column and row names in cell arrays 
%cnames = {'val1','val2','val3','val4','val5','val6'};
%rnames = {'image1','image2','image3','image4','image5','image6'};
    
% Create the uitable
t = uitable(f,'Data', matrix );
          %  'ColumnName',cnames,... 
           % 'RowName',rnames
          
set(t, 'position', [0 270 600 146]);

set(handles.reconstruct, 'enable', 'on');

% --- Executes on button press in reconstruct.
function reconstruct_Callback(hObject, eventdata, handles)
% hObject    handle to reconstruct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

value_silh1 = handles.value_silh1;
value_sql1 = handles.value_sql1;
value_ctr1 = handles.value_ctr1;

Matrice_Moment_all = handles.Matrice_Moment_all;
value_ordre = handles.ordre; 
nom_doss_trait = handles.nom_doss_trait;
tab_image = handles.tab_image;
tab_indice = handles.tab_indice;
if value_silh1 == 1    
    set(handles.check_ctr,'value',0);
    set(handles.check_sql,'value',0);
    nom_doss = strcat(nom_doss_trait, '_Reconstruct_silhouette'); 
elseif value_sql1 == 1    
    set(handles.check_silh,'value',0);
    set(handles.check_ctr,'value',0);
    nom_doss = strcat(nom_doss_trait, '_Reconstruct_squelette'); 
else    
    set(handles.check_silh,'value',0);
    set(handles.check_sql,'value',0);
    nom_doss = strcat(nom_doss_trait, '_Reconstruct_contour'); 
end
    
for i = 1 : length(tab_image)
    J = imread(tab_image{i});       
    [height, width, numberOfColorChannels] = size(J);
    f_silhouette = reconstruct_image( Matrice_Moment_all{1, i}, width, height, value_ordre );
   %figure, imshow(uint8(f_silhouette)), title('Tchebychev');
    
    save_image_reconstruct(tab_indice(i), f_silhouette, nom_doss);
end

disp (nom_doss_trait);
disp (nom_doss);
listdir = dir(nom_doss);

frames_sel = cell(1, 6);
ind = 1;
for k = 1 : length(listdir)
 nom_dossier = listdir(k).name;
 if ~strcmp(nom_dossier, '.') && ~strcmp(nom_dossier, '..') %&& (isempty(strfind(nom_doosier, '_Squeletisation')) == 1)
     frames_sel{ind} = nom_dossier;
     ind = ind + 1;
 end
%     
end

frames_sel = sort(frames_sel);

%handles.axes1 = axes('Parent',fram_sel, 'Position',[.04 0.6 .2 .3]);
axes(handles.axes2)
set(handles.text_axes2,'visible', 'on');
set(handles.text_axes2,'String', 'Avant');
frames_sel1{1} = strcat(nom_doss_trait,'\', frames_sel{1});
%disp (frames_sel{1})
[x,map] = imread(frames_sel1{1});
I1 = imresize(x, [900 800]);
imshow(x);

disp (nom_doss)
axes(handles.axes8)
set(handles.text_axes8,'visible', 'on');
set(handles.text_axes8,'String', 'Après');
frames_sel1{1} = strcat(nom_doss,'\', frames_sel{1});
%disp (frames_sel{1})
[x,map] = imread(frames_sel1{1});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off
         
axes(handles.axes3)
set(handles.text_axes3,'visible', 'on');
set(handles.text_axes3,'String', 'Avant');
frames_sel1{2} = strcat(nom_doss_trait,'\', frames_sel{2});
[x,map] = imread(frames_sel1{2});
I1 = imresize(x, [900 800]);
imshow(x);
axes(handles.axes9)
set(handles.text_axes9,'visible', 'on');
set(handles.text_axes9,'String', 'Après');
frames_sel1{2} = strcat(nom_doss,'\', frames_sel{2});
[x,map] = imread(frames_sel1{2});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off
axes(handles.axes4)
set(handles.text_axes4,'visible', 'on');
set(handles.text_axes4,'String', 'Avant');
frames_sel1{3} = strcat(nom_doss_trait,'\', frames_sel{3});
[x,map] = imread(frames_sel1{3});
I1 = imresize(x, [900 800]);
imshow(x);
axes(handles.axes10)
set(handles.text_axes10,'visible', 'on');
set(handles.text_axes10,'String', 'Après');
frames_sel1{3} = strcat(nom_doss,'\', frames_sel{3});
[x,map] = imread(frames_sel1{3});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off
axes(handles.axes5)
set(handles.text_axes5,'visible', 'on');
set(handles.text_axes5,'String', 'Avant');
frames_sel1{4} = strcat(nom_doss_trait,'\', frames_sel{4});
[x,map] = imread(frames_sel1{4});
I1 = imresize(x, [900 800]);
imshow(x);
axes(handles.axes11)
set(handles.text_axes11,'visible', 'on');
set(handles.text_axes11,'String', 'Après');
frames_sel1{4} = strcat(nom_doss,'\', frames_sel{4});
[x,map] = imread(frames_sel1{4});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off
axes(handles.axes6)
set(handles.text_axes6,'visible', 'on');
set(handles.text_axes6,'String', 'Avant');
frames_sel1{5} = strcat(nom_doss_trait,'\', frames_sel{5});
[x,map] = imread(frames_sel1{5});
I1 = imresize(x, [900 800]);
imshow(x);
axes(handles.axes12)
set(handles.text_axes12,'visible', 'on');
set(handles.text_axes12,'String', 'Après');
frames_sel1{5} = strcat(nom_doss,'\', frames_sel{5});
[x,map] = imread(frames_sel1{5});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off
axes(handles.axes7)
set(handles.text_axes7,'visible', 'on');
set(handles.text_axes7,'String', 'Avant');
frames_sel1{6} = strcat(nom_doss_trait,'\', frames_sel{6});
[x,map] = imread(frames_sel1{6});
I1 = imresize(x, [900 800]);
imshow(x);
axes(handles.axes13)
set(handles.text_axes13,'visible', 'on');
set(handles.text_axes13,'String', 'Après');
frames_sel1{6} = strcat(nom_doss,'\', frames_sel{6});
[x,map] = imread(frames_sel1{6});
I1 = imresize(x, [900 800]);
imshow(x);

% --- Executes on button press in check_silh.
function check_silh_Callback(hObject, eventdata, handles)
% hObject    handle to check_silh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_silh

set(handles.check_ctr,'value',0);
set(handles.check_sql,'value',0);
set(handles.reconstruct,'enable', 'off');

    
% --- Executes on button press in check_sql.
function check_sql_Callback(hObject, eventdata, handles)
% hObject    handle to check_sql (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_sql

set(handles.check_ctr,'value',0);
set(handles.check_silh,'value',0);
set(handles.reconstruct,'enable', 'off');

% --- Executes on button press in check_ctr.
function check_ctr_Callback(hObject, eventdata, handles)
% hObject    handle to check_ctr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of check_ctr

set(handles.check_silh,'value',0);
set(handles.check_sql,'value',0);

set(handles.reconstruct,'enable', 'off');
