function varargout = gui_svt5(varargin)
% GUI_SVT5 MATLAB code for gui_svt5.fig
%      GUI_SVT5, by itself, creates a new GUI_SVT5 or raises the existing
%      singleton*.
%
%      H = GUI_SVT5 returns the handle to a new GUI_SVT5 or the handle to
%      the existing singleton*.
%
%      GUI_SVT5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SVT5.M with the given input arguments.
%
%      GUI_SVT5('Property','Value',...) creates a new GUI_SVT5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_svt5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_svt5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_svt5

% Last Modified by GUIDE v2.5 13-Jun-2016 12:31:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_svt5_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_svt5_OutputFcn, ...
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


% --- Executes just before gui_svt5 is made visible.
function gui_svt5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_svt5 (see VARARGIN)

% Choose default command line output for gui_svt5
handles.output = hObject;
%clc
X = imread('back1.jpg', 'jpg');  % Charge l'image
ax = axes('Units', 'Normalized', 'Position', [0 0 1 1]);  % Création d'un objet Axes prenant toute la fenêtre
imagesc(X, 'Parent', ax)  % Affiche l'image 
uistack(ax, 'bottom')     % Place l'objet Axes en arrière-plan
set(ax, 'Visible', 'off') %  Cache les marques "ticks"

movegui(handles.gui5,'center')
%set(handles.lanc_app,'enable', 'off');
set(handles.text_reconn,'visible', 'off');
set(handles.lanc_reconn,'enable', 'off');
set(handles.plot_reg,'enable', 'off');
set(handles.text_res_eval,'visible', 'off');

save_network = getappdata(0,'save_netwok');
disp (save_network);
handles.save_network = save_network;
type_input = getappdata(0,'type_input');
setappdata(0,'type_input', type_input);
handles.type_input = type_input;
nom_doss = getappdata(0,'nom_doss');
setappdata(0,'nom_doss', nom_doss);
handles.nom_doss = nom_doss;
type_mouvement = getappdata(0,'type_mouvement');
setappdata(0,'type_mouvement', type_mouvement);
handles.type_mouvement = type_mouvement
set(handles.text_reconn,'visible', 'on');
aff = ['Apprentissage des  ' ,  type_mouvement];
set(handles.text_reconn,'String', aff);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_svt5 wait for user response (see UIRESUME)
% uiwait(handles.gui5);


% --- Outputs from this function are returned to the command line.
function varargout = gui_svt5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input.
function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename_input, pathname, filterindex] = uigetfile( ...
{  '*.txt','txt-files (*.txt)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Sélectionner un fichier', ...
   'MultiSelect', 'off');

if isequal(filename_input,0)
    errordlg('Tu dois sélectionner un fichier','Error');
    return
else
    input = fullfile(pathname, filename_input);
   disp(['User selected ', input])

type_mouvement = getappdata(0,'type_mouvement');
nom_doss = getappdata(0,'nom_doss');
type_input = getappdata(0,'type_input')
type_input = lower(type_input);
% type_input = handles.type_input;
if strfind (input, nom_doss) 
    if strfind (input, type_input)
        setappdata(0,'input', input);
        handles.input = input;
        h = msgbox([' Fichier d''Entrée Chargé avec succès'], 'Information');
        set(h, 'position', [350 300 250 60]); %makes box bigger
        ah = get( h, 'CurrentAxes' );
        ch = get( ah, 'Children' );
        set( ch, 'FontSize', 12 ); %makes text bigger

    else
        errordlg(['Tu dois sélectionner un fichier du type ', type_input],'Error');
        return
    end        
else
    errordlg(['Tu dois sélectionner un fichier du meme mouvements i.e ', type_mouvement],'Error');
    return    
end
end

% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename_output, pathname, filterindex] = uigetfile( ...
{  '*.txt','txt-files (*.txt)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Sélectionner un fichier', ...
   'MultiSelect', 'off');

if isequal(filename_output,0)
    errordlg('Tu dois sélectionner un fichier','Error');
else
    output = fullfile(pathname, filename_output)
   disp(['User selected ', fullfile(pathname, filename_output)])
   set(handles.lanc_reconn, 'enable', 'on');

input = getappdata(0,'input');
setappdata(0,'output', output);
handles.output = output;

type_mouvement = getappdata(0,'type_mouvement');
nom_doss = getappdata(0,'nom_doss');
type_input = getappdata(0,'type_input')
type_input = lower(type_input);
% type_input = handles.type_input;
if strfind (output, nom_doss) 
    if strfind (output, type_input)
        setappdata(0,'output', output);
        handles.output = output;
        h = msgbox([' Fichier de Sortie Chargé avec succès'], 'Information');
        set(h, 'position', [350 300 250 60]); %makes box bigger
        ah = get( h, 'CurrentAxes' );
        ch = get( ah, 'Children' );
        set( ch, 'FontSize', 12 ); %makes text bigger

    else
        errordlg(['Tu dois sélectionner un fichier du type ', type_input],'Error');
        return
    end        
else
    errordlg(['Tu dois sélectionner un fichier du meme mouvements i.e ', type_mouvement],'Error');
    return    
end
end
% --- Executes on button press in plot_reg.
function plot_reg_Callback(hObject, eventdata, handles)
% hObject    handle to plot_reg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

type_mouvement = getappdata(0,'type_mouvement');
target = getappdata(0,'target');
our_target = getappdata(0,'our_target');
input = getappdata(0,'input');
output = getappdata(0,'output');
f = figure;
plotregression(our_target , target );
% 
% trainFcn = handles.trainFcn;
% saveas(gcf, strcat('Regression_', trainFcn, 'bmp'));


% --- Executes on button press in lanc_reconn.
function lanc_reconn_Callback(hObject, eventdata, handles)
% hObject    handle to lanc_reconn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%type_mouvement = handles.type_mouvement

input = getappdata(0,'input');
output = getappdata(0,'output');
nom_doss = getappdata(0,'nom_doss')

%filename_input = 'Input_silhouette_Mouvements_Avec_Deplacement_Test.txt'; %handles.filename_input;
%filename_output = 'Output_silhouette_Mouvements_Avec_Deplacement_Test.txt'; %handles.filename_output;
disp (input);
if isempty(input)
    errordlg('Tu dois sélectionner un fichier d''entrée ', 'Error');
    return
elseif isempty(output)
    errordlg('Tu dois sélectionner un fichier de sortie ', 'Error');
    return
else
    
   set(handles.lanc_reconn, 'enable', 'on');
   
save_network = handles.save_network;

nom_dossier = strcat(nom_doss, '_Mvts_Test')
nom_doss1 = strcat(nom_doss, '_Train')
nom_doss2 = strcat(nom_doss, '_Test')
ch = 'matrix_test';
filename = strcat(nom_doss2, '.mat');
S = load (filename, ch);
matrix_test = S.matrix_test;
l = length(matrix_test);

%Initalize waitbar
h = waitbar(0,'Loading...',...
            'Name','Exécution');
% Update waitbar
for step = 1:l
    waitbar(step / l,h,sprintf('Loading...%.2f%%',step/l*100));
end
%Delete waitbar
delete(h)

h = msgbox([' Phase de reconnaissance terminée avec succès'], 'Information');
        set(h, 'position', [350 300 280 60]); %makes box bigger
        ah = get( h, 'CurrentAxes' );
        ch = get( ah, 'Children' );
        set( ch, 'FontSize', 12 ); %makes text bigger
        
[eval, our_target, target] = Evaluation_systeme( save_network, input, output, nom_dossier, nom_doss1, nom_doss2 );

setappdata(0,'our_target', our_target);
setappdata(0,'target', target);
set(handles.text_res_eval,'visible', 'on');
affichage = strcat('Taux de reconnaissance : ', num2str(eval) );
set(handles.text_res_eval, 'String', affichage);

set(handles.plot_reg, 'enable', 'on');
    
end
% --- Executes on button press in fermer7.
function fermer7_Callback(hObject, eventdata, handles)
% hObject    handle to fermer7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --- Executes on button press in preced7.
function preced7_Callback(hObject, eventdata, handles)
% hObject    handle to preced7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gui_svt5);
run ('gui_svt4');
