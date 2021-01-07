function varargout = GUI_PV(varargin)
% GUI_PV MATLAB code for GUI_PV.fig
%      GUI_PV, by itself, creates a new GUI_PV or raises the existing
%      singleton*.
%
%      H = GUI_PV returns the handle to a new GUI_PV or the handle to
%      the existing singleton*.
%
%      GUI_PV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PV.M with the given input arguments.
%
%      GUI_PV('Property','Value',...) creates a new GUI_PV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_PV_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_PV_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_PV

% Last Modified by GUIDE v2.5 30-Jun-2013 16:32:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_PV_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_PV_OutputFcn, ...
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

%lo que hice: poner handles a la salida de guardar cancelar y restaurar,
%definir paramnuevos no es
% --- Executes just before GUI_PV is made visible.
function GUI_PV_OpeningFcn(hObject, ~, handles, varargin)

handles.PARAMACTUALES_PV=varargin{1};
handles.HANDLES=varargin{2};

handles.TIEMPO_PV=handles.PARAMACTUALES_PV(1);
handles.CANAL_PV=handles.PARAMACTUALES_PV(2);
handles.BANDA_PV=handles.PARAMACTUALES_PV(3);

handles.SelectedBand=handles.HANDLES.FreqBands(handles.BANDA_PV,:);

%poner el valor en el campo de texto
set(handles.TAG_TIEMPO_PROMEDIO,'String',num2str(handles.PARAMACTUALES_PV(1)));
set(handles.TAG_CANAL_REGISTRO_PV,'String',num2str(handles.PARAMACTUALES_PV(2)));
set(handles.TAG_BANDA_POTENCIA_PV,'String',num2str(handles.PARAMACTUALES_PV(3)));

% Choose default command line output for GUI_PV
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_PV wait for user response (see UIRESUME)
uiwait(handles.TAG_GUI_PV);

% --- Outputs from this function are returned to the command line.
function varargout = GUI_PV_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output1;
varargout{2} = handles.output2;

function TAG_TIEMPO_PROMEDIO_Callback(hObject, ~, handles)
handles.TIEMPO_PV=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_TIEMPO_PROMEDIO_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_CANAL_REGISTRO_PV_Callback(hObject, ~, handles)
handles.CANAL_PV=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_CANAL_REGISTRO_PV_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_BANDA_POTENCIA_PV_Callback(hObject, ~, handles)
handles.BANDA_PV=str2double(get(hObject,'String'));
handles.SelectedBand=handles.HANDLES.FreqBands(handles.BANDA_PV,:);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_BANDA_POTENCIA_PV_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in TAG_GUARDAR.
function handles=TAG_GUARDAR_Callback(hObject, ~, handles)
handles.output1=handles.TAG_GUI_PV;
handles.PARAMNUEVOS_PV=[handles.TIEMPO_PV handles.CANAL_PV handles.BANDA_PV];
handles.output2=handles.PARAMNUEVOS_PV;
guidata(hObject,handles);
uiresume;

% --- Executes on button press in TAG_CANCELAR.
function handles=TAG_CANCELAR_Callback(hObject, ~, handles)
handles.output1=handles.TAG_GUI_PV;
handles.output2=handles.PARAMACTUALES_PV;
guidata(hObject,handles);
close(handles.TAG_GUI_PV)
uiresume;

% --- Executes on button press in TAG_RESTAURAR.
function handles=TAG_RESTAURAR_Callback(hObject, ~, handles)

handles.output1=handles.TAG_GUI_PV;
handles.PARAMACTUALES_PV=[handles.HANDLES.TIEMPO_PV handles.HANDLES.CANAL_PV handles.HANDLES.BANDA_PV];

handles.TIEMPO_PV=handles.HANDLES.TIEMPO_PV;
handles.CANAL_PV=handles.HANDLES.CANAL_PV;
handles.BANDA_PV=handles.HANDLES.BANDA_PV;

handles.output2=handles.PARAMACTUALES_PV;

set(handles.TAG_TIEMPO_PROMEDIO,'String',num2str(handles.HANDLES.TIEMPO_PV));
set(handles.TAG_CANAL_REGISTRO_PV,'String',num2str(handles.HANDLES.CANAL_PV));
set(handles.TAG_BANDA_POTENCIA_PV,'String',num2str(handles.HANDLES.BANDA_PV));

guidata(hObject,handles);

% --- Executes on button press in TAG_START_PV.
function TAG_START_PV_Callback(hObject, ~, handles)

handles.MUESTRAS=floor(handles.TIEMPO_PV/handles.HANDLES.Ts);
handles.im=1:handles.MUESTRAS;
handles.VENTANA_PROMEDIO_PV=ceil(handles.TIEMPO_PV/(handles.HANDLES.TimeVideo/handles.HANDLES.CurrentNumOfFrames)); 
handles.PROMEDIOS_PV=floor(handles.HANDLES.CurrentNumOfFrames/(handles.VENTANA_PROMEDIO_PV));
handles.P=zeros(handles.HANDLES.CHANNELS,handles.PROMEDIOS_PV);
handles.velocidad=chunkaveragevel(handles.HANDLES.v(:),handles.VENTANA_PROMEDIO_PV,handles.PROMEDIOS_PV); %Promediamos la velocidad en tramos de TIEMPO segundos
handles.aceleracion=chunkaveragevel(handles.HANDLES.a(:),handles.VENTANA_PROMEDIO_PV,handles.PROMEDIOS_PV); %Promediamos la aceleracion en tramos de TIEMPO segundos

handles.tensiones=handles.HANDLES.tensionesINI(handles.CANAL_PV,:);
handles.tensionesNOEVOCADOS=evocados(handles.HANDLES.triggers.triggers,handles.tensiones,0.05,handles.HANDLES.registros.Args.Fs);
handles.TRIGGERED_FRAME=find(abs(handles.tensionesNOEVOCADOS)>handles.HANDLES.THRESHOLD);
handles.MEDIAS_REEMPLAZO=mean(handles.tensionesNOEVOCADOS);
handles.tensionesTHRESHOLD=handles.tensionesNOEVOCADOS;
handles.tensionesTHRESHOLD(handles.TRIGGERED_FRAME)=handles.MEDIAS_REEMPLAZO; 

%problema que coja todos los canales o el seleccionado
for k=1:handles.PROMEDIOS_PV
    P(k)=MaKPower_NEW(handles.tensionesTHRESHOLD(handles.im+handles.MUESTRAS*(k-1)),handles.HANDLES.registros.Args,handles.SelectedBand); 
end
axes(handles.TAG_PV),plot(P,handles.velocidad,'.'),title(['Potencia (mV^2) vs V(cm/s)']),xlabel(['Potencia  (mV^2) del canal ' num2str(handles.CANAL_PV) ' en la banda ' num2str(handles.BANDA_PV) ]),ylabel(['V(cm/s)']),hold off;
guidata(hObject,handles);
