function varargout = gui_svt4(varargin)
% GUI_SVT4 MATLAB code for gui_svt4.fig
%      GUI_SVT4, by itself, creates a new GUI_SVT4 or raises the existing
%      singleton*.
%
%      H = GUI_SVT4 returns the handle to a new GUI_SVT4 or the handle to
%      the existing singleton*.
%
%      GUI_SVT4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SVT4.M with the given input arguments.
%
%      GUI_SVT4('Property','Value',...) creates a new GUI_SVT4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_svt4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_svt4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_svt4

% Last Modified by GUIDE v2.5 06-Jun-2016 22:52:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_svt4_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_svt4_OutputFcn, ...
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


% --- Executes just before gui_svt4 is made visible.
function gui_svt4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_svt4 (see VARARGIN)

% Choose default command line output for gui_svt4
handles.output = hObject;
clc
X = imread('back1.jpg', 'jpg');  % Charge l'image
ax = axes('Units', 'Normalized', 'Position', [0 0 1 1]);  % Création d'un objet Axes prenant toute la fenêtre
imagesc(X, 'Parent', ax)  % Affiche l'image 
uistack(ax, 'bottom')     % Place l'objet Axes en arrière-plan
set(ax, 'Visible', 'off') %  Cache les marques "ticks"

%set(handles.lanc_app,'enable', 'off');
set(handles.lanc_reconn,'enable', 'off');
set(handles.save_net,'enable', 'off');
set(handles.lanc_app,'enable', 'off');
set(handles.view_net,'enable', 'off');
set(handles.plot_perf,'enable', 'off');

nom_doss = getappdata(0,'nom_doss');
setappdata(0,'nom_doss', nom_doss);
handles.nom_doss = nom_doss;
type_mouvement = getappdata(0,'type_mouvement');
setappdata(0,'type_mouvement', type_mouvement);
handles.type_mouvement = type_mouvement;

% imshow(frame_1);
% drawnow;

movegui(handles.gui4,'center')

% 
% 
% value_silh = get(handles.choix_silh, 'Value');
% value_sql = get(handles.choix_sql, 'Value');
% value_ctr = get(handles.choix_ctr, 'Value');
% 
% trainFcn = get(handles.train_fcn,'Value')
% nb_iter = get(handles.nb_iter,'Value')
% goal = get(handles.goal,'Value')
% lr = get(handles.lr,'Value')
% mc = get(handles.mc,'Value')
% trainRatio = get(handles.train_ratio,'Value')
% valRatio = get(handles.val_ratio,'Value')
% testRatio = get(handles.test_ratio,'Value')
% devideFcn = get(handles.divide_fcn,'Value')
% 
% if (trainFcn ~= 0 && nb_iter ~= 0 && goal ~= 0 && lr ~= 0 && mc ~= 0 ...
%         && trainRatio ~= 0 && valRatio ~= 0 && testRatio ~= 0 ) 
%     set(handles.lanc_app,'enable', 'on');
% end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_svt4 wait for user response (see UIRESUME)
% uiwait(handles.gui4);


% --- Outputs from this function are returned to the command line.
function varargout = gui_svt4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in choix_silh.
function choix_silh_Callback(hObject, eventdata, handles)
% hObject    handle to choix_silh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of choix_silh
% 
% set(handles.lanc_app,'enable', 'on');
% set(handles.save_net,'enable', 'on');
set(handles.choix_sql,'value',0);
set(handles.choix_ctr,'value',0);
set(handles.lanc_app, 'enable', 'on')

% --- Executes on button press in choix_sql.
function choix_sql_Callback(hObject, eventdata, handles)
% hObject    handle to choix_sql (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of choix_sql
% 
% set(handles.lanc_app,'enable', 'on');
% set(handles.save_net,'enable', 'on');
set(handles.choix_ctr,'value',0);
set(handles.choix_silh,'value',0);
set(handles.lanc_app, 'enable', 'on')

% --- Executes on button press in choix_ctr.
function choix_ctr_Callback(hObject, eventdata, handles)
% hObject    handle to choix_ctr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of choix_ctr
% 
% set(handles.lanc_app,'enable', 'on');
% set(handles.lanc_reconn,'enable', 'on');
set(handles.choix_sql,'value',0);
set(handles.choix_silh,'value',0);

set(handles.lanc_app, 'enable', 'on')
% --- Executes on button press in lanc_app.
function lanc_app_Callback(hObject, eventdata, handles)
% hObject    handle to lanc_app (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

disp ('lancer apprentissage ');
value_silh = get(handles.choix_silh, 'Value');
value_sql = get(handles.choix_sql, 'Value');
value_ctr = get(handles.choix_ctr, 'Value');

% trainFcn = get(handles.train_fcn,'string')
% handles.trainFcn = trainFcn;
nb_iter1 = get(handles.nb_iter,'string')
nb_iter = str2num(nb_iter1 )
if ~isempty (nb_iter1) 
    if isa(nb_iter,'numeric') ~= 1 || isempty (nb_iter)%||  isa(nb_iter,'numeric') ~= 1%isnumeric(nb_iter) ~= 1 
        errordlg('Le nombre d''itérations doit etre du type Entier','Error');
        set(handles.nb_iter,'string', '')
        return
    end
else
    errordlg('Le nombre d''itérations doit etre du type Entier','Error');
        set(handles.nb_iter,'string', '')
    return
end
if isempty(nb_iter)
    disp ('empty');
    nb_iter = 0
end
handles.nb_iter = nb_iter;
goal1 = get(handles.goal,'string')
goal = str2double(goal1 )
if ~isempty (goal1) 
    if isa(goal,'double') ~= 1 || isnan (goal)%||  isa(nb_iter,'numeric') ~= 1%isnumeric(nb_iter) ~= 1 
        errordlg('Le but doit etre du type Réel','Error');
        set(handles.goal,'string', '')
        return
    end
else
    errordlg('Le but doit etre du type Réel','Error');
        set(handles.goal,'string', '')
    return
end
if isempty(goal)
    goal = 0
end
handles.goal = goal;
lr1 = get(handles.lr,'string')
lr = str2double(lr1 )
if ~isempty (lr1) 
    disp ('here cc ');
    if isa(lr,'double') ~= 1 || isnan (lr)%||  isa(nb_iter,'numeric') ~= 1%isnumeric(nb_iter) ~= 1 
        errordlg('Le taux d''aprentissage doit etre du type Réel','Error');
        set(handles.lr,'string', '')
        return
    end
else
    errordlg('Le taux d''aprentissage doit etre du type Réel','Error');
        set(handles.lr,'string', '')
    return
end
if isempty(lr)
    lr = 0
end
handles.lr = lr;
mc1 = get(handles.mc,'string')
mc = str2double(mc1 )
if ~isempty (mc1) 
    if isa(mc,'double') ~= 1 || isnan (mc)%||  isa(nb_iter,'numeric') ~= 1%isnumeric(nb_iter) ~= 1 
        errordlg('La valeur du Momentum doit etre du type Réel','Error');
        set(handles.mc,'string', '')
        return
    end
else
    errordlg('La valeur du Momentum doit etre du type Réel','Error');
        set(handles.mc,'string', '')
    return
end
if isempty(mc)
    mc = 0
end
handles.mc = mc;
trainRatio1 = get(handles.train_ratio,'string')
trainRatio = str2double(trainRatio1 )
if ~isempty (trainRatio1) 
    if isa(trainRatio,'double') ~= 1 || isnan (trainRatio)%||  isa(nb_iter,'numeric') ~= 1%isnumeric(nb_iter) ~= 1 
        errordlg('Le pourcentage d''aprentissage doit etre du type Réel','Error');
        set(handles.train_ratio,'string', '')
        return
    end
else
    errordlg('Le pourcentage d''aprentissage doit etre du type Réel','Error');
        set(handles.train_ratio,'string', '')
    return
end
if isempty(trainRatio)
    trainRatio = 0
end
handles.trainRatio = trainRatio;
valRatio1 = get(handles.val_ratio,'string')
valRatio = str2double(valRatio1 )
if ~isempty (valRatio1) 
    if isa(valRatio,'double') ~= 1 || isnan (valRatio)%||  isa(nb_iter,'numeric') ~= 1%isnumeric(nb_iter) ~= 1 
        errordlg('Le pourcentage de validation doit etre du type Réel','Error');
        set(handles.val_ratio,'string', '')
        return
    end
else
    errordlg('Le pourcentage de validation doit etre du type Réel','Error');
        set(handles.val_ratio,'string', '')
    return
end
if isempty(valRatio)
    valRatio = 0    
end
handles.valRatio = valRatio;
testRatio1 = get(handles.test_ratio,'string')
testRatio = str2double(testRatio1 )
if ~isempty (testRatio1) 
    if isa(testRatio,'double') ~= 1 || isnan (testRatio)%||  isa(nb_iter,'numeric') ~= 1%isnumeric(nb_iter) ~= 1 
        errordlg('Le pourcentage de test doit etre du type Réel','Error');
        set(handles.test_ratio,'string', '')
        return
    end
else
    errordlg('Le pourcentage de test doit etre du type Réel','Error');
        set(handles.test_ratio,'string', '')
    return
end
if isempty(testRatio)
    testRatio = 0
end
handles.testRatio = testRatio;
nb_neurone1 = get(handles.nb_neurone,'string')
nb_neurone = str2num(nb_neurone1 )
if ~isempty (nb_neurone1) 
    if isa(nb_neurone,'numeric') ~= 1 || isempty (nb_neurone)%||  isa(nb_iter,'numeric') ~= 1%isnumeric(nb_iter) ~= 1 
        errordlg('Le nombre de neurone doit etre du type Réel','Error');
        set(handles.nb_neurone,'string', '')
        return
    end
else
    errordlg('Le nombre de neurone doit etre du type Réel','Error');
    set(handles.nb_neurone,'string', '')
    return
end
if isempty(nb_neurone)
    nb_neurone = 0
end
handles.nb_neurone = nb_neurone;
% devideFcn = get(handles.divide_fcn,'string')
% handles.devideFcn = devideFcn
nom_doss = handles.nom_doss

switch get(handles.divide_fcn,'value')
    case 1 
        devideFcn = 'dividerand';
    case 2 
        devideFcn = 'divideblock';
    case 3
        devideFcn = 'divideint';
    case 4 
        devideFcn = 'divideind';
end
switch get(handles.train_fcn,'value')
    case 1 
        trainFcn = 'trainlm';
    case 2 
        trainFcn = 'trainbr';
    case 3
        trainFcn = 'trainrp';
    case 4 
        trainFcn = 'traincgf';
    case 5 
        trainFcn = 'trainbfg';
end

if (nb_iter ~= 0 && goal ~= 0 && lr ~= 0 && mc ~= 0 ...
        && trainRatio ~= 0 && valRatio ~= 0 && testRatio ~= 0 && nb_neurone ~= 0 )
  
  %  set(handles.lanc_app,'enable', 'on');
% if isnumeric(nb_iter) ~= 1 
%     errordlg('Le nombre d''itérations doit etre du type Entier','Error');
%     return
% end
% if isa(goal,'double') ~= 1
%     errordlg('Le but doit etre du type Réel','Error');
%     return
% end
% if isa(lr,'double') ~= 1
%     errordlg('Le taux d''apprentissage doit etre du type Réel','Error');
%     return
% end
% if isa(mc,'double') ~= 1
%     errordlg('La valeur de Momentum doit etre du type Réel','Error');
%     return
% end
% if isa(trainRatio,'double') ~= 1
%     errordlg('La valeur de pourcentage d''apprentissage doit etre du type Réel','Error');
%     return
% end
% if isa(valRatio,'double') ~= 1
%     errordlg('La valeur de Momentum doit etre du type Réel','Error');
%     return
% end
% if isa(testRatio,'double') ~= 1
%     errordlg('La valeur de Momentum doit etre du type Réel','Error');
%     return
% end
% if isnumeric(nb_neurone) ~= 1 
%     errordlg('Le nombre de neurones doit etre du type Entier','Error');
%     return
% end

    if (trainRatio + valRatio + testRatio) > 1 || (trainRatio + valRatio + testRatio) < 1
        errordlg('La somme des ratios doit etre égale à 1','Error');
        set(handles.train_ratio,'String','');
        set(handles.val_ratio,'String','');
        set(handles.test_ratio,'String','');
    end
    set(handles.lanc_app,'enable', 'on');

save_netwok1 = strcat('neural_network_', nom_doss, '_', trainFcn);
if value_silh == 1
    %[nom_doc_input, nom_doc_output] = lancer_techebichev_silhouette_Test( matrix_reconn, ordre);
    input_train = strcat('Input_silhouette_', nom_doss, '_Train.txt');
    output_train = strcat('Output_silhouette_', nom_doss, '_Train.txt');
 %   input_test = strcat('Input_silhouette_', nom_doss, '_Test.txt');
 %   output_test = strcat('Output_silhouette_', nom_doss, '_Test.txt');
    type_input = 'Silhouette';
    save_netwok = strcat(save_netwok1, type_input);
end
if value_sql == 1
    %[nom_doc_input, nom_doc_output] = lancer_techebichev_squelette_Test( matrix_reconn, ordre);
    input_train = strcat('Input_Squeletisation_', nom_doss, '_Train.txt');
    output_train = strcat('Output_Squeletisation_', nom_doss, '_Train.txt');
   % input_test = strcat('Input_Squeletisation_', nom_doss, '_Test.txt');
  %  output_test = strcat('Output_Squeletisation_', nom_doss, '_Test.txt');
    type_input = 'Squeletisation';
    save_netwok = strcat(save_netwok1, type_input);
end
if value_ctr == 1
   % [nom_doc_input, nom_doc_output] = lancer_techebichev_contour_Test( matrix_reconn, ordre);
    input_train = strcat('Input_contour_', nom_doss, '_Train.txt');
    output_train = strcat('Output_contour_', nom_doss, '_Train.txt');
  %  input_test = strcat('Input_contour_', nom_doss, '_Test.txt');
  %  output_test = strcat('Output_contour_', nom_doss, '_Test.txt');
    type_input = 'Contour';
    save_netwok = strcat(save_netwok1, type_input);
end

handles.input_train = input_train;
handles.output_train = output_train;

type_mvt = handles.type_mouvement;
[save_netwok, tr, net] = Rn_All_gui (input_train, output_train, nom_doss, type_input,... 
                                       nb_iter, goal, lr, mc, trainRatio, valRatio, testRatio, devideFcn, trainFcn, nb_neurone);
% 
handles.net = net;

setappdata(0,'net', net);
setappdata(0,'type_input', type_input);
setappdata(0,'nom_doss', nom_doss);
setappdata(0,'tr', tr);
setappdata(0,'trainFcn', trainFcn);

% handles.tr = tr;
% plotperform(tr);
% name = strcat('Performance_', trainFcn, '_.bmp');
% saveas(gcf, name);
% 
% imshow(name);

set(handles.save_net,'enable', 'on');
set(handles.view_net,'enable', 'on');
set(handles.plot_perf,'enable', 'on');
set(handles.lanc_reconn,'enable', 'on');

handles.save_netwok = save_netwok;
setappdata(0,'save_netwok', save_netwok);

else
    h = errordlg('Veuillez remplir tous les champs SVP ','Error');
    set(h, 'position', [470 280 200 80]); 
end

function nb_iter_Callback(hObject, eventdata, handles)
% hObject    handle to nb_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nb_iter as text
%        str2double(get(hObject,'String')) returns contents of nb_iter as a double

% --- Executes during object creation, after setting all properties.
function nb_iter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nb_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goal_Callback(hObject, eventdata, handles)
% hObject    handle to goal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goal as text
%        str2double(get(hObject,'String')) returns contents of goal as a double


% --- Executes during object creation, after setting all properties.
function goal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lr_Callback(hObject, eventdata, handles)
% hObject    handle to lr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lr as text
%        str2double(get(hObject,'String')) returns contents of lr as a double


% --- Executes during object creation, after setting all properties.
function lr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mc_Callback(hObject, eventdata, handles)
% hObject    handle to mc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mc as text
%        str2double(get(hObject,'String')) returns contents of mc as a double


% --- Executes during object creation, after setting all properties.
function mc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function train_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to train_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of train_ratio as text
%        str2double(get(hObject,'String')) returns contents of train_ratio as a double


% --- Executes during object creation, after setting all properties.
function train_ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to train_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function val_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to val_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val_ratio as text
%        str2double(get(hObject,'String')) returns contents of val_ratio as a double


% --- Executes during object creation, after setting all properties.
function val_ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function test_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to test_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of test_ratio as text
%        str2double(get(hObject,'String')) returns contents of test_ratio as a double


% --- Executes during object creation, after setting all properties.
function test_ratio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function devide_fct_Callback(hObject, eventdata, handles)
% hObject    handle to devide_fct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of devide_fct as text
%        str2double(get(hObject,'String')) returns contents of devide_fct as a double


% --- Executes during object creation, after setting all properties.
function devide_fct_CreateFcn(hObject, eventdata, handles)
% hObject    handle to devide_fct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in train_fcn.
function train_fcn_Callback(hObject, eventdata, handles)
% hObject    handle to train_fcn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns train_fcn contents as cell array
%        contents{get(hObject,'Value')} returns selected item from train_fcn


% --- Executes during object creation, after setting all properties.
function train_fcn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to train_fcn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in view_net.
function view_net_Callback(hObject, eventdata, handles)
% hObject    handle to view_net (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

net = getappdata(0,'net');
%net = handles.net;
view(net);

% --- Executes on button press in plot_perf.
function plot_perf_Callback(hObject, eventdata, handles)
% hObject    handle to plot_perf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 
% tr = handles.tr;
tr = getappdata(0,'tr');
trainFcn = getappdata(0,'trainFcn');
f = figure();
%plotperform(tr);
saveas(plotperform(tr), strcat('Performance_', trainFcn, '.bmp'));

imshow(strcat('Performance_', trainFcn, '.bmp'));
    
% --- Executes on selection change in divide_fcn.
function divide_fcn_Callback(hObject, eventdata, handles)
% hObject    handle to divide_fcn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns divide_fcn contents as cell array
%        contents{get(hObject,'Value')} returns selected item from divide_fcn


% --- Executes during object creation, after setting all properties.
function divide_fcn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to divide_fcn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_net.
function save_net_Callback(hObject, eventdata, handles)
% hObject    handle to save_net (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

net = getappdata(0,'net');
type_input = getappdata(0,'type_input');
nom_doss = getappdata(0,'nom_doss');
trainFcn = getappdata(0,'trainFcn');
save_netwok = strcat('neural_network_', nom_doss, '_', trainFcn, '_', type_input);
save(save_netwok, 'net'); %, '.mat');
h = msgbox('Réseau de neurone sauvegardé ', 'Information');
set(h, 'position', [350 250 200 50]); %makes box bigger
ah = get( h, 'CurrentAxes' );
ch = get( ah, 'Children' );
set( ch, 'FontSize', 12 ); %makes text bigger

% --- Executes on button press in lanc_reconn.
function lanc_reconn_Callback(hObject, eventdata, handles)
% hObject    handle to lanc_reconn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gui_svt4);
run('gui_svt5');



function nb_neurone_Callback(hObject, eventdata, handles)
% hObject    handle to nb_neurone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nb_neurone as text
%        str2double(get(hObject,'String')) returns contents of nb_neurone as a double


% --- Executes during object creation, after setting all properties.
function nb_neurone_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nb_neurone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fermer6.
function fermer6_Callback(hObject, eventdata, handles)
% hObject    handle to fermer6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;

% --- Executes on button press in preced6.
function preced6_Callback(hObject, eventdata, handles)
% hObject    handle to preced6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close (gui_svt4);
run('gui_svt3');
