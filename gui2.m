function varargout = gui2(varargin)
% GUI2 MATLAB code for gui2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui2

% Last Modified by GUIDE v2.5 08-May-2016 11:36:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui2_OutputFcn, ...
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


% --- Executes just before gui2 is made visible.
function gui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui2 (see VARARGIN)

% Choose default command line output for gui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui2 wait for user response (see UIRESUME)
% uiwait(handles.figure2);


% --- Outputs from this function are returned to the command line.
function varargout = gui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%figure('Position',[10000,10000,150,300]);

f = handles.figure2;

movegui(f,'center')

tgroup = uitabgroup('Parent', f);
tab1 = uitab('Parent', tgroup, 'Title', 'Pré-traitement');

video = uipanel(tab1, 'Title','Choix Video','FontSize',12,...
             'BackgroundColor','white',...
             'Position',[.01 0.18 .3 .8]);  % [left bottom width height]
                   
text1 = uicontrol(video,'Style','text','String','Action',...
                'Position',[30 380 80 20]); % Top Bottom Right Left
menu1 = uicontrol(video,'Style','popupmenu','String','A1',...
                'Position',[160 380 100 20]); % Top Bottom Right Left
            
text2 = uicontrol(video,'Style','text','String','Actor',...
                'Position',[30 355 80 20]); % Top Bottom Right Left
menu2 = uicontrol(video,'Style','popupmenu','String','A2',...
                'Position',[160 355 100 20]); % Top Bottom Right Left
            
text3 = uicontrol(video,'Style','text','String','Camera',...
                'Position',[30 330 80 20]); % Top Bottom Right Left
menu3 = uicontrol(video,'Style','popupmenu','String','A3',...
                'Position',[160 330 100 20]); % Top Bottom Right Left
            
text4 = uicontrol(video,'Style','text','String','Sample',...
                'Position',[30 305 80 20]); % Top Bottom Right Left

menu4 = uicontrol(video, 'Style','popupmenu','String',{'option 1';'hello world';'Is it Friday yet?'},...
                 'Position',[160 305 100 20]); % Top Bottom Right Left

push_displ = uicontrol(video,'Style','pushbutton','String','Display Video',...
               'Position',[83 265 100 30]); % Top Bottom Right Left
           
display1 = uipanel('Parent',video,'Title','Display Video','FontSize',12,...
               'Position',[.05 .16 .9 .45]);

nom_video = 'ido-bend.avi';
%VideoDisplay(nom_video, display1);
 
slid1 = uicontrol(video, 'Style','slider','String','slider2',...
                'Position',[16 45 295 20]); % Top Bottom Right Left
           
[x,map] = imread('pause.png');
I1 = imresize(x, [20 20]);

[x,map] = imread('play.png');
I2 = imresize(x, [20 20]);

[x,map] = imread('stop.png');
I3 = imresize(x, [20 20]);
% h=uicontrol('style','pushbutton',...
%             'units','pixels',...
%             'position',[20 20 113+10 42+10],...
%             'cdata',I2)
        
pause = uicontrol(video,'Style','pushbutton','String',' ','units','pixels',...
               'position',[50 10 20+10 20+10], 'cdata',I1); % Top Bottom Right Left
play = uicontrol(video,'Style','pushbutton','String',' ','units','pixels',...
               'Position',[150 10 20+10 20+10], 'cdata',I2); % Top Bottom Right Left
stop = uicontrol(video,'Style','pushbutton','String',' ','units','pixels',...
               'Position',[240 10 20+10 20+10], 'cdata',I3); % Top Bottom Right Left
           
% %# read video frames
% vid = VideoReader('ido-bend.avi');
% sz = [vid.Height vid.Width];
% mov = read(vid, [1 vid.NumberOfFrames]);
% % 
% % %# prepare GUI
% p = get(0,'DefaultFigurePosition');
% hFig = figure(display1, 'Menubar','none', 'Resize','off', ...
%     'Position',[p(1:2) sz(2) sz(1)]);
% 
% % 
% %# play movie
% movv = struct('cdata',squeeze(num2cell(mov,[1 2 3])), 'colormap',[]);
% movie(hFig, movv, 999, vid.FrameRate);

% slid1 = uicontrol(display1, 'Style','slider','String','slider2',...
%                 'Position',[10 250 80 20]); % Top Bottom Right Left
% set(slid1, ...
%     'value',1, ...
%     'max',vid.NumberOfFrames, ...
%     'min',1, ...
%     'sliderstep',[1 1]/vid.NumberOfFrames)

%display1 = uicontrol(tab1,'Style','pushbutton','String','Button 1',...
 %               'Position',[50 20 60 40]); % Top Bottom Right Left

selection = uipanel(tab1, 'Title','Sélection','FontSize',12,...
             'BackgroundColor','white',...
             'Position',[.33 0.18 .66 .8]);  % [left bottom width height]
         
lanc_sel = uicontrol(selection,'Style','pushbutton','String',' Lancer Sélection ',...
               'position',[30 375 120 30]); % [left bottom width height]
silh = uicontrol(selection,'Style','checkbox','String',' Silhouette ',...
               'position',[250 375 120 30]); % [left bottom width height]
sql = uicontrol(selection,'Style','checkbox','String',' Squelette ',...
               'position',[400 375 120 30]); % [left bottom width height]
ctr = uicontrol(selection,'Style','checkbox','String',' Contour ',...
               'position',[550 375 120 30]); % [left bottom width height]

fram_sel = uipanel(selection, 'Title','Frames Sélectionnées','FontSize',12,...
             'BackgroundColor','white',...
             'Position',[.04 0.14 .9 .7], 'UserData',x);  % [left bottom width height]

% axes1 = axes('Units','pixels');
% get(axes1, 'Position')
% xl = get(axes1, 'xlim')
% yl = get(axes1, 'ylim')
% 
% set(axes1, 'xlim', 200, 'ylim', 250);
nom_doss = 'CollapseRight_Actor1_Camera3_Sample1_Selection';
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

axes1 = axes('Parent',fram_sel, 'Position',[.04 0.6 .2 .3]);
frames_sel{1} = strcat(nom_doss,'\', frames_sel{1});
%disp (frames_sel{1})
[x,map] = imread(frames_sel{1});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off
         
axes2 = axes('Parent',fram_sel, 'Position',[.4 0.6 .2 .3]);
frames_sel{2} = strcat(nom_doss,'\', frames_sel{2});
[x,map] = imread(frames_sel{2});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes3 = axes('Parent',fram_sel, 'Position',[.7 0.1 .2 .3]);
frames_sel{3} = strcat(nom_doss,'\', frames_sel{3});
[x,map] = imread(frames_sel{3});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes4 = axes('Parent',fram_sel, 'Position',[.04 0.1 .2 .3]);
frames_sel{4} = strcat(nom_doss,'\', frames_sel{4});
[x,map] = imread(frames_sel{4});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes5 = axes('Parent',fram_sel, 'Position',[.4 0.1 .2 .3]);
frames_sel{5} = strcat(nom_doss,'\', frames_sel{5});
[x,map] = imread(frames_sel{5});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

axes6 = axes('Parent',fram_sel, 'Position',[.7 0.6 .2 .3]);
frames_sel{6} = strcat(nom_doss,'\', frames_sel{6});
[x,map] = imread(frames_sel{6});
I1 = imresize(x, [900 800]);
imshow(x);
%set(axes1,'xtick',[],'ytick',[])
%axis off

value = get(silh, 'Value');
if value == 1
    disp ('checked');
else
    disp ('unchecked');
end

%set(video, 'visible', 'on');
%set(selection, 'visible', 'off');
           
fermer = uicontrol(tab1,'Style','pushbutton','String',' Fermer ',...
               'position',[200 30 100 30]); % [left bottom width height]
           
pred = uicontrol(tab1,'Style','pushbutton','String',' Précédent ',...
               'position',[500 30 100 30]); % [left bottom width height]
           
svt = uicontrol(tab1,'Style','pushbutton','String',' Suivant ',...
               'position',[800 30 100 30]); % [left bottom width height]
tab2 = uitab('Parent', tgroup, 'Title', 'Extraction de descripteurs');
tab3 = uitab('Parent', tgroup, 'Title', 'Reconnaissance');


% currenttab = tgroup.SelectedTab

function play_Callback(hObject, eventdata, handles) 
% nacitanie prvku 
h=findobj(0,'Type','figure','Tag','figure1'); 
UserData=get(h,'UserData'); 
prvok=0; 
if ((str2double(get(handles.pushbutton1,'string'))) == 1) 
for i=1:UserData.pocet_vetiev; 
prvok=prvok+1; 
end 
set(handles.text1, 'String',{prvok}); 
end
