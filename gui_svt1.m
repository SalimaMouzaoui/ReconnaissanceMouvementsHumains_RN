function varargout = gui_svt1(varargin)
% GUI_SVT1 MATLAB code for gui_svt1.fig
%      GUI_SVT1, by itself, creates a new GUI_SVT1 or raises the existing
%      singleton*.
%
%      H = GUI_SVT1 returns the handle to a new GUI_SVT1 or the handle to
%      the existing singleton*.
%
%      GUI_SVT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SVT1.M with the given input arguments.
%
%      GUI_SVT1('Property','Value',...) creates a new GUI_SVT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_svt1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_svt1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_svt1

% Last Modified by GUIDE v2.5 05-Jun-2016 19:47:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_svt1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_svt1_OutputFcn, ...
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


% --- Executes just before gui_svt1 is made visible.
function gui_svt1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_svt1 (see VARARGIN)

% Choose default command line output for gui_svt1
handles.output = hObject;
movegui(handles.gui1,'center')

% Update handles structure
guidata(hObject, handles);
clc

X = imread('back1.jpg', 'jpg');  % Charge l'image
ax = axes('Units', 'Normalized', 'Position', [0 0 1 1]);  % Création d'un objet Axes prenant toute la fenêtre
imagesc(X, 'Parent', ax)  % Affiche l'image 
uistack(ax, 'bottom')     % Place l'objet Axes en arrière-plan
set(ax, 'Visible', 'off') %  Cache les marques "ticks"

value_silh = get(handles.silh, 'Value');
value_sql = get(handles.sql, 'Value');
value_ctr = get(handles.ctr, 'Value');

set(handles.lanc_sel, 'enable', 'off');
set(handles.silh, 'enable', 'off');
set(handles.sql, 'enable', 'off');
set(handles.ctr, 'enable', 'off');
set(handles.svt2, 'enable', 'off');

if value_silh == 0 || value_sql == 0 || value_ctr == 0 
    set(handles.axes1,'visible', 'off');
    set(handles.axes2,'visible', 'off');
    set(handles.axes3,'visible', 'off');
    set(handles.axes4,'visible', 'off');
    set(handles.axes5,'visible', 'off');
    set(handles.axes6,'visible', 'off');
    set(handles.axes7,'visible', 'off');
    
end

[x,map] = imread('pause.png');
I1 = imresize(x, [40 40]);

[x,map] = imread('play.png');
I2 = imresize(x, [40 40]);

[x,map] = imread('stop.png');
I3 = imresize(x, [40 40]);
% h=uicontrol('style','pushbutton',...
%             'units','pixels',...
%             'position',[20 20 113+10 42+10],...
%             'cdata',I2)
        
set(handles.pause, 'cdata',I1);
set(handles.play, 'cdata',I2);
set(handles.stop, 'cdata',I3);
% 
% [x,map] = imread('propos.jpg');
% I1 = imresize(x, [20 20]);
% set(handles.manuel,	'UserData', I1) 
% set(handles.propos,	'UserData', 'propos_nous.jpg') 

% videoObject = VideoReader('ido-bend.avi');
% % Display first frame
% frame_1 = read(videoObject,1);
 axes(handles.axes7);
% imshow(frame_1);
% drawnow;
axis(handles.axes7,'off');

%handles.videoObject = videoObject;

% UIWAIT makes gui_svt1 wait for user response (see UIRESUME)
% uiwait(handles.gui1);

% --- Outputs from this function are returned to the command line.
function varargout = gui_svt1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% %addpath('Icons\')
% % Attach icon data to the menu handles UserData
% 
% set(handles.file,					'UserData', '')		% Also topevel handle could get the icon
% [x,map] = imread('video.png');
% I1 = imresize(x, [20 20]);
% set(handles.open,				'UserData', I1)
% [x,map] = imread('exit.png');
% I1 = imresize(x, [20 20]);
% set(handles.quitter,				'UserData', I1)
% 
% % set(handles.Menu_Settings,				'UserData', '')
% % set(handles.Menu_Settings_German,		'UserData', '.\Icons\German.png')	% use full qualified file names
% % set(handles.Menu_Settings_English,		'UserData', 'English.png')
% 
% set(handles.aide,					'UserData', '')
% [x,map] = imread('pdf.png');
% I1 = imresize(x, [20 20]);
% set(handles.manuel,			'UserData', I1)%javax.swing.ImageIcon('propos.jpg')) % use java ImageIcons
% [x,map] = imread('propos_nous.jpg');
% I1 = imresize(x, [20 20]);
% set(handles.propos,	'UserData', I1)


% addpath('Icons\')
% % Attach icon data to the menu handles UserData
% 
% set(handles.file,					'UserData', '')		% Also topevel handle could get the icon
%  
% set(handles.open,				'UserData', 'File_Load.png')
% set(handles.quitter,				'UserData', 'File_Exit.png')
% 
% % set(handles.Menu_Settings,				'UserData', '')
% % set(handles.Menu_Settings_German,		'UserData', '.\Icons\German.png')	% use full qualified file names
% % set(handles.Menu_Settings_English,		'UserData', 'English.png')
% 
% set(handles.aide,					'UserData', '')
% set(handles.propos,			'UserData', javax.swing.ImageIcon('.\Icons\Help_About.png')) % use java ImageIcons
% set(handles.manuel,	'UserData', 'Help_Docu.png')
% 
% % Set the icons
% Figure_Menu_Add_Icons(handles.gui1)

% --- Executes on button press in aff_video.
function aff_video_Callback(hObject, eventdata, handles)
% hObject    handle to aff_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

value_silh = get(handles.silh, 'Value');
value_sql = get(handles.sql, 'Value');
value_ctr = get(handles.ctr, 'Value');

set(handles.lanc_sel, 'enable', 'off');
set(handles.silh, 'enable', 'off');
set(handles.sql, 'enable', 'off');
set(handles.ctr, 'enable', 'off');

if value_silh == 0 || value_sql == 0 || value_ctr == 0 
    set(handles.axes1,'visible', 'off');
    set(handles.axes2,'visible', 'off');
    set(handles.axes3,'visible', 'off');
    set(handles.axes4,'visible', 'off');
    set(handles.axes5,'visible', 'off');
    set(handles.axes6,'visible', 'off');
    set(handles.axes7,'visible', 'off');

end
[filename, pathname, filterindex] = uigetfile('*.avi','Sélectionner une vidéo');
% [filename, pathname, filterindex] = uigetfile( ...
% {  '*.tif','avi-files (*.avi)'}, ...
%    'Pick a file', ...
%    'MultiSelect', 'off');

if isequal(filename,0)
    errordlg('Tu dois sélectionner une vidéo','Error');
    set(handles.lanc_sel, 'enable', 'off');
set(handles.silh, 'enable', 'off');
set(handles.sql, 'enable', 'off');
set(handles.ctr, 'enable', 'off');
else
   disp(['User selected ', fullfile(pathname, filename)])
set(handles.lanc_sel, 'enable', 'on');

handles.filename = strcat(pathname, filename);
setappdata(0,'filename', handles.filename);
handles.nom_video = filename;
setappdata(0,'nom_video', handles.nom_video);
guidata(hObject,handles)
play_Callback(hObject, eventdata, handles);
end
  

% --- Executes on button press in creer_video.
function creer_video_Callback(hObject, eventdata, handles)
% hObject    handle to creer_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

value_silh = get(handles.silh, 'Value');
value_sql = get(handles.sql, 'Value');
value_ctr = get(handles.ctr, 'Value');

set(handles.lanc_sel, 'enable', 'off');
set(handles.aff_video, 'enable', 'off');
set(handles.silh, 'enable', 'off');
set(handles.sql, 'enable', 'off');
set(handles.ctr, 'enable', 'off');

if value_silh == 0 || value_sql == 0 || value_ctr == 0 
    set(handles.axes1,'visible', 'off');
    set(handles.axes2,'visible', 'off');
    set(handles.axes3,'visible', 'off');
    set(handles.axes4,'visible', 'off');
    set(handles.axes5,'visible', 'off');
    set(handles.axes6,'visible', 'off');
    set(handles.axes7,'visible', 'off');

end

[pathname] = uigetdir();
if isequal(pathname,0)
    errordlg('Tu dois sélectionner un dossier','Error');
set(handles.lanc_sel, 'enable', 'off');
set(handles.aff_video, 'enable', 'off');
set(handles.silh, 'enable', 'off');
set(handles.sql, 'enable', 'off');
set(handles.ctr, 'enable', 'off');

else
   disp(['User selected ', pathname])
nom_doss = pathname;
handles.filename = strcat(pathname, '.avi');
handles.nom_video = strcat(pathname, '.avi');
guidata(hObject,handles)
create_video( nom_doss );
play_Callback(hObject, eventdata, handles);
set(handles.lanc_sel, 'enable', 'on');
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = handles.filename;

xyloObj = VideoReader(filename);

    nFrames = xyloObj.NumberOfFrames;
    vidHeight = xyloObj.Height;
    vidWidth = xyloObj.Width;

    % Preallocate movie structure.
    mov(1:nFrames) = ...
        struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
               'colormap', []);

    % Read one frame at a time.
    for k = 1 : nFrames
        mov(k).cdata = read(xyloObj, k);
    end        

    % Play back the movie once at the video's frame rate.
    movie(handles.axes7, mov, 1, xyloObj.FrameRate);


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with ha²ndles and user data (see GUIDATA)

% if get(hObject,'Value')
%    set(handles.play,'Value',0);
% end
    
if (get(handles.pause, 'Value') == 1)
    disp ('pause');
   % set(handles.play, 'Value', 0);
  %  uiwait();
else
    set(handles.pause, 'Value', 1);
    uiresume();
end

%uiwait();
%uiresume();

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in fermer2.
function fermer2_Callback(hObject, eventdata, handles)
% hObject    handle to fermer2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --- Executes on button press in preced1.
function preced1_Callback(hObject, eventdata, handles)
% hObject    handle to preced1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

       close(gui_svt1);
       run('gui1')

% --- Executes on button press in svt2.
function svt2_Callback(hObject, eventdata, handles)
% hObject    handle to svt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

       close(gui_svt1);
      % gui_svt2(handles);
      run('gui_svt2')

% --- Executes on button press in lanc_sel.
function lanc_sel_Callback(hObject, eventdata, handles)
% hObject    handle to lanc_sel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = handles.filename;
nom_video = handles.nom_video;
[ name_person, name_action ] = extraction( nom_video );
% 
% if strfind (nom_video, 'CollapseRight') > 0 && strfind (nom_video, 'GuardToKick') > 0 && strfind (nom_video, 'GuardToPunch') > 0 && ...
%         strfind (nom_video, 'KickRight') > 0 && strfind (nom_video, 'PunchRight') > 0 && strfind (nom_video, 'RunLeftToRight') > 0 && ...
%         strfind (nom_video, 'StandupRight') > 0 && strfind (nom_video, 'TurnBackRight') > 0 && strfind (nom_video, 'WalkLeftToRight') > 0

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
disp (name_action);

if strcmp(nom_doss, 'Mouvements_Avec_Deplacement')
    type_mouvement = 'Mouvements Avec Deplacement Base "Weizmann"';
elseif strcmp(nom_doss, 'Mouvements_Leger')
    type_mouvement = 'Mouvements Sans Deplacement Base "Weizmann"';    
elseif strcmp(nom_doss, 'MuHaVi_Camera3')
    type_mouvement = 'Mouvements Avec Deplacement Base "MuHaVi" Camera3';  
elseif strcmp(nom_doss, 'MuHaVi_Camera4')
    type_mouvement = 'Mouvements Avec Deplacement Base "MuHaVi" Camera4';   
end
    
setappdata(0,'type_mouvement', type_mouvement);
setappdata(0,'nom_doss', nom_doss);

nom_doss = strcat(nom_doss, '_Test')
listdir = dir (nom_doss);

if strfind(nom_doss, 'Camera3') ~= 0 %|| strfind(nom_doss, 'Camera4') ~= 0
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
        disp ('name act');
        disp(name_action);
        disp (listdir(i).name);
        
        if strfind(listdir(i).name, name_action ) 
            if strfind(listdir(i).name, name_person)
                nom_doss_trait = strcat(nom_doss, '\', listdir(i).name);
                doss_selected = listdir(i).name;
                break;
            end
        end
    end
end
end
setappdata(0,'doss_selected', doss_selected);

disp (nom_doss_trait);
%errordlg('Input must be a number','Error');

handles.nom_doss_trait = nom_doss_trait;
guidata(hObject,handles)

set(handles.silh, 'enable', 'on');
set(handles.sql, 'enable', 'on');
set(handles.ctr, 'enable', 'on');

set(handles.svt2, 'enable', 'on');

% --- Executes on button press in silh.
function silh_Callback(hObject, eventdata, handles)
% hObject    handle to silh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of silh

nom_doss_trait = handles.nom_doss_trait;
setappdata(0,'nom_doss_trait', nom_doss_trait);
set(handles.sql,'value',0);
set(handles.ctr,'value',0);

nom_doss = nom_doss_trait;% 'CollapseRight_Actor1_Camera3_Sample1_Selection';
listdir = dir(nom_doss);
nb_postures = 6;
setappdata(0,'nb_postures', nb_postures);

frames_sel = cell(1, nb_postures);
ind = 1;
for k = 1 : length(listdir)
 nom_dossier = listdir(k).name;
% 
 if ~strcmp(nom_dossier, '.') && ~strcmp(nom_dossier, '..') %&& (isempty(strfind(nom_doosier, '_Squeletisation')) == 1)
     frames_sel{ind} = nom_dossier;
     ind = ind + 1;
 end
%     
end

frames_sel = sort(frames_sel);

%handles.axes1 = axes('Parent',fram_sel, 'Position',[.04 0.6 .2 .3]);
axes(handles.axes1)
frames_sel{1} = strcat(nom_doss,'\', frames_sel{1});
%disp (frames_sel{1})
[x,map] = imread(frames_sel{1});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off
         
axes(handles.axes3)
frames_sel{2} = strcat(nom_doss,'\', frames_sel{2});
[x,map] = imread(frames_sel{2});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes5)
frames_sel{3} = strcat(nom_doss,'\', frames_sel{3});
[x,map] = imread(frames_sel{3});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes2)
frames_sel{4} = strcat(nom_doss,'\', frames_sel{4});
[x,map] = imread(frames_sel{4});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes4)
frames_sel{5} = strcat(nom_doss,'\', frames_sel{5});
[x,map] = imread(frames_sel{5});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes6)
frames_sel{6} = strcat(nom_doss,'\', frames_sel{6});
[x,map] = imread(frames_sel{6});
I1 = imresize(x, [900 800]);
imshow(x);


% --- Executes on button press in sql.
function sql_Callback(hObject, eventdata, handles)
% hObject    handle to sql (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sql
nom_doss_trait = handles.nom_doss_trait;
set(handles.silh,'value',0);
set(handles.ctr,'value',0);

nom_doss = strcat(nom_doss_trait, '_Squeletisation'); %'CollapseRight_Actor1_Camera3_Sample1_Selection_Squeletisation';
listdir = dir(nom_doss);

frames_sel = cell(1, 6);
ind = 1;
for k = 1 : length(listdir)
 nom_dossier = listdir(k).name;
% 
 if ~strcmp(nom_dossier, '.') && ~strcmp(nom_dossier, '..') %&& (isempty(strfind(nom_doosier, '_Squeletisation')) == 1)
     frames_sel{ind} = nom_dossier;
     ind = ind + 1;
 end
%     
end

frames_sel = sort(frames_sel);


%handles.axes1 = axes('Parent',fram_sel, 'Position',[.04 0.6 .2 .3]);
axes(handles.axes1)
frames_sel{1} = strcat(nom_doss,'\', frames_sel{1});
%disp (frames_sel{1})
[x,map] = imread(frames_sel{1});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off
         
axes(handles.axes3)
frames_sel{2} = strcat(nom_doss,'\', frames_sel{2});
[x,map] = imread(frames_sel{2});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes5)
frames_sel{3} = strcat(nom_doss,'\', frames_sel{3});
[x,map] = imread(frames_sel{3});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes2)
frames_sel{4} = strcat(nom_doss,'\', frames_sel{4});
[x,map] = imread(frames_sel{4});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes4)
frames_sel{5} = strcat(nom_doss,'\', frames_sel{5});
[x,map] = imread(frames_sel{5});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes6)
frames_sel{6} = strcat(nom_doss,'\', frames_sel{6});
[x,map] = imread(frames_sel{6});
I1 = imresize(x, [900 800]);
imshow(x);

% --- Executes on button press in ctr.
function ctr_Callback(hObject, eventdata, handles)
% hObject    handle to ctr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ctr
nom_doss_trait = handles.nom_doss_trait;
set(handles.silh,'value',0);
set(handles.sql,'value',0);

nom_doss = strcat(nom_doss_trait, '_Contour');
listdir = dir(nom_doss);
frames_sel = cell(1, 6);
ind = 1;
for k = 1 : length(listdir)
 nom_dossier = listdir(k).name;
% 
 if ~strcmp(nom_dossier, '.') && ~strcmp(nom_dossier, '..') %&& (isempty(strfind(nom_doosier, '_Squeletisation')) == 1)
     frames_sel{ind} = nom_dossier;
     ind = ind + 1;
 end
%     
end

frames_sel = sort(frames_sel);

axes(handles.axes1)

frames_sel{1} = strcat(nom_doss,'\', frames_sel{1});
[x,map] = imread(frames_sel{1});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off
         
axes(handles.axes3)
frames_sel{2} = strcat(nom_doss,'\', frames_sel{2});
[x,map] = imread(frames_sel{2});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes5)
frames_sel{3} = strcat(nom_doss,'\', frames_sel{3});
[x,map] = imread(frames_sel{3});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes2)
frames_sel{4} = strcat(nom_doss,'\', frames_sel{4});
[x,map] = imread(frames_sel{4});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes4)
frames_sel{5} = strcat(nom_doss,'\', frames_sel{5});
[x,map] = imread(frames_sel{5});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes(handles.axes6)
frames_sel{6} = strcat(nom_doss,'\', frames_sel{6});
[x,map] = imread(frames_sel{6});
I1 = imresize(x, [900 800]);
imshow(x);

% --- Executes during object creation, after setting all properties.
function gui1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gui1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function aide_Callback(hObject, eventdata, handles)
% hObject    handle to aide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function manuel_Callback(hObject, eventdata, handles)
% hObject    handle to manuel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

winopen('manuel.pdf');
% 
% [x,map] = imread('propos.jpg');
% I1 = imresize(x, [20 20]);
% set(handles.manuel,	'UserData', I1) 

% --------------------------------------------------------------------
function propos_Callback(hObject, eventdata, handles)
% hObject    handle to propos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myicon = imread('propos_nous.jpg');

h = msgbox({'Cette plateforme a été développé par l''étudiante ' ' MOUZAOUI SALIMA dans le cadre d''obtention ' ' du diplome Master'}, ...
    'A propos de Nous ','custom',myicon);
set(h, 'position', [350 280 250 80]); %makes box bigger
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );
%set( ch, 'FontSize', 10 ); %makes text bigger
% --------------------------------------------------------------------
function propos_matlab_Callback(hObject, eventdata, handles)
% hObject    handle to propos_matlab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
aff_video_Callback(hObject, eventdata, handles)    

% --------------------------------------------------------------------
function quitter_Callback(hObject, eventdata, handles)
% hObject    handle to quitter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --------------------------------------------------------------------
function menu_2_Callback(hObject, eventdata, handles)
% hObject    handle to menu_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu1_Callback(hObject, eventdata, handles)
% hObject    handle to menu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

disp ('herrrrrrrre');
