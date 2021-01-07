function varargout = GUI_PARAMETROS(varargin)
% GUI_PARAMETROS MATLAB code for GUI_PARAMETROS.fig
%      GUI_PARAMETROS, by itself, creates a new GUI_PARAMETROS or raises the existing
%      singleton*.
%
%      H = GUI_PARAMETROS returns the handle to a new GUI_PARAMETROS or the handle to
%      the existing singleton*.
%
%      GUI_PARAMETROS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PARAMETROS.M with the given input arguments.
%
%      GUI_PARAMETROS('Property','Value',...) creates a new GUI_PARAMETROS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_PARAMETROS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_PARAMETROS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_PARAMETROS

% Last Modified by GUIDE v2.5 29-Jun-2013 17:55:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_PARAMETROS_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_PARAMETROS_OutputFcn, ...
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

% --- Executes just before GUI_PARAMETROS is made visible.
function GUI_PARAMETROS_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_PARAMETROS (see VARARGIN)
handles.PARAMACTUALES=varargin{1};

%Bandas frecuencia
handles.DELTA_INI=handles.PARAMACTUALES(1);
handles.DELTA_FIN=handles.PARAMACTUALES(2);
handles.THETA_INI=handles.PARAMACTUALES(3);
handles.THETA_FIN=handles.PARAMACTUALES(4);  
handles.ALPHA_INI=handles.PARAMACTUALES(5);
handles.ALPHA_FIN=handles.PARAMACTUALES(6);  
handles.BETA_INI=handles.PARAMACTUALES(7);
handles.BETA_FIN=handles.PARAMACTUALES(8);  
handles.GAMMA_INI=handles.PARAMACTUALES(9);
handles.GAMMA_FIN=handles.PARAMACTUALES(10);

%BINS
handles.N=handles.PARAMACTUALES(11);

%VENTANAS
handles.NN_POTENCIA=handles.PARAMACTUALES(12);
handles.NN_VELOCIDAD=handles.PARAMACTUALES(13);
handles.NN_ACELERACION=handles.PARAMACTUALES(14);

%VARIANZAS
handles.SIGMA_POTENCIA=handles.PARAMACTUALES(15);
handles.SIGMA_VELOCIDAD=handles.PARAMACTUALES(16);
handles.SIGMA_ACELERACION=handles.PARAMACTUALES(17);

%poner en cada textbox su correspondiente valor
set(handles.TAG_DELTA_INI,'String',num2str(handles.PARAMACTUALES(1)));
set(handles.TAG_DELTA_FIN,'String',num2str(handles.PARAMACTUALES(2)));
set(handles.TAG_THETA_INI,'String',num2str(handles.PARAMACTUALES(3))); 
set(handles.TAG_THETA_FIN,'String',num2str(handles.PARAMACTUALES(4))); 
set(handles.TAG_ALPHA_INI,'String',num2str(handles.PARAMACTUALES(5)));
set(handles.TAG_ALPHA_FIN,'String',num2str(handles.PARAMACTUALES(6)));
set(handles.TAG_BETA_INI,'String',num2str(handles.PARAMACTUALES(7)));
set(handles.TAG_BETA_FIN,'String',num2str(handles.PARAMACTUALES(8)));
set(handles.TAG_GAMMA_INI,'String',num2str(handles.PARAMACTUALES(9)));
set(handles.TAG_GAMMA_FIN,'String',num2str(handles.PARAMACTUALES(10)));
set(handles.TAG_N,'String',num2str(handles.PARAMACTUALES(11)));
set(handles.TAG_NN_POTENCIA,'String',num2str(handles.PARAMACTUALES(12)));
set(handles.TAG_NN_VELOCIDAD,'String',num2str(handles.PARAMACTUALES(13)));
set(handles.TAG_NN_ACELERACION,'String',num2str(handles.PARAMACTUALES(14)));
set(handles.TAG_SIGMA_POTENCIA,'String',num2str(handles.PARAMACTUALES(15)));
set(handles.TAG_SIGMA_VELOCIDAD,'String',num2str(handles.PARAMACTUALES(16)));
set(handles.TAG_SIGMA_ACELERACION,'String',num2str(handles.PARAMACTUALES(17)));

% Choose default command line output for GUI_PARAMETROS
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

uiwait(handles.TAG_GUI_PARAMETROS);

% --- Outputs from this function are returned to the command line.
function varargout = GUI_PARAMETROS_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output1;
varargout{2} = handles.output2;

% --- Executes on button press in TAG_GUARDAR.
function handles=TAG_GUARDAR_Callback(hObject, ~, handles)
% hObject    handle to TAG_GUARDAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output1=handles.TAG_GUI_PARAMETROS;
handles.PARAMNUEVOS=[handles.DELTA_INI,handles.DELTA_FIN ,handles.THETA_INI,handles.THETA_FIN, ...
handles.ALPHA_INI,handles.ALPHA_FIN, handles.BETA_INI, handles.BETA_FIN,handles.GAMMA_INI,...
handles.GAMMA_FIN,handles.N,handles.NN_POTENCIA,handles.NN_VELOCIDAD,handles.NN_ACELERACION,handles.SIGMA_POTENCIA,handles.SIGMA_VELOCIDAD,...
handles.SIGMA_ACELERACION]; 
handles.FreqBands=[handles.PARAMNUEVOS(1) handles.PARAMNUEVOS(2);handles.PARAMNUEVOS(3) handles.PARAMNUEVOS(4);handles.PARAMNUEVOS(5) handles.PARAMNUEVOS(6);handles.PARAMNUEVOS(7) handles.PARAMNUEVOS(8);handles.PARAMNUEVOS(9)  handles.PARAMNUEVOS(10)]; %Frequency Bande Range

handles.output2=handles.PARAMNUEVOS;
guidata(hObject,handles);
uiresume;


% --- Executes on button press in TAG_CANCELAR.
function handles=TAG_CANCELAR_Callback(hObject, ~, handles)
% hObject    handle to TAG_CANCELAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output1=handles.TAG_GUI_PARAMETROS;
handles.output2=handles.PARAMACTUALES;
guidata(hObject,handles);
close(handles.TAG_GUI_PARAMETROS);
uiresume;

% --- Executes on button press in TAG_RESTAURAR.
function handles=TAG_RESTAURAR_Callback(hObject, ~, handles)
% hObject    handle to TAG_RESTAURAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output1=handles.TAG_GUI_PARAMETROS;
%Bandas frecuencia
handles.DELTA_INI=1;
handles.DELTA_FIN=4;
handles.THETA_INI=4;
handles.THETA_FIN=12;
handles.ALPHA_INI=13;
handles.ALPHA_FIN=15;
handles.BETA_INI=16;
handles.BETA_FIN=30;
handles.GAMMA_INI=30;
handles.GAMMA_FIN=100;
%BINS
handles.N=10;
%VENTANAS
handles.NN_POTENCIA=25;
handles.NN_ACELERACION=25;
handles.NN_VELOCIDAD=25;
%VARIANZAS
handles.SIGMA_POTENCIA=10;
handles.SIGMA_ACELERACION=10;
handles.SIGMA_VELOCIDAD=10;

handles.PARAMACTUALES=[handles.DELTA_INI,handles.DELTA_FIN ,handles.THETA_INI,handles.THETA_FIN, ...
handles.ALPHA_INI,handles.ALPHA_FIN, handles.BETA_INI, handles.BETA_FIN,handles.GAMMA_INI,...
handles.GAMMA_FIN,handles.N,handles.NN_POTENCIA,handles.NN_VELOCIDAD,handles.NN_ACELERACION,handles.SIGMA_POTENCIA,handles.SIGMA_VELOCIDAD,...
handles.SIGMA_ACELERACION]; 

handles.output2=handles.PARAMACTUALES;

%poner en cada textbox su correspondiente valor
set(handles.TAG_DELTA_INI,'String',num2str(handles.PARAMACTUALES(1)));
set(handles.TAG_DELTA_FIN,'String',num2str(handles.PARAMACTUALES(2)));
set(handles.TAG_THETA_INI,'String',num2str(handles.PARAMACTUALES(3))); 
set(handles.TAG_THETA_FIN,'String',num2str(handles.PARAMACTUALES(4))); 
set(handles.TAG_ALPHA_INI,'String',num2str(handles.PARAMACTUALES(5)));
set(handles.TAG_ALPHA_FIN,'String',num2str(handles.PARAMACTUALES(6)));
set(handles.TAG_BETA_INI,'String',num2str(handles.PARAMACTUALES(7)));
set(handles.TAG_BETA_FIN,'String',num2str(handles.PARAMACTUALES(8)));
set(handles.TAG_GAMMA_INI,'String',num2str(handles.PARAMACTUALES(9)));
set(handles.TAG_GAMMA_FIN,'String',num2str(handles.PARAMACTUALES(10)));
set(handles.TAG_N,'String',num2str(handles.PARAMACTUALES(11)));
set(handles.TAG_NN_POTENCIA,'String',num2str(handles.PARAMACTUALES(12)));
set(handles.TAG_NN_VELOCIDAD,'String',num2str(handles.PARAMACTUALES(13)));
set(handles.TAG_NN_ACELERACION,'String',num2str(handles.PARAMACTUALES(14)));
set(handles.TAG_SIGMA_POTENCIA,'String',num2str(handles.PARAMACTUALES(15)));
set(handles.TAG_SIGMA_VELOCIDAD,'String',num2str(handles.PARAMACTUALES(16)));
set(handles.TAG_SIGMA_ACELERACION,'String',num2str(handles.PARAMACTUALES(17)));  
handles.FreqBands=[handles.PARAMACTUALES(1) handles.PARAMACTUALES(2);handles.PARAMACTUALES(3) handles.PARAMACTUALES(4);handles.PARAMACTUALES(5) handles.PARAMACTUALES(6);handles.PARAMACTUALES(7) handles.PARAMACTUALES(8);handles.PARAMACTUALES(9)  handles.PARAMACTUALES(10)] ;%Frequency Bande Range
disp('2 rest')
guidata(hObject,handles);

function TAG_DELTA_INI_Callback(hObject, ~, handles)
% hObject    handle to TAG_DELTA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_DELTA_INI as text
%        str2double(get(hObject,'String')) returns contents of TAG_DELTA_INI as a double

handles.DELTA_INI=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_DELTA_INI_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_DELTA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_THETA_INI_Callback(hObject, ~, handles)
% hObject    handle to TAG_THETA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_THETA_INI as text
%        str2double(get(hObject,'String')) returns contents of TAG_THETA_INI as a double
handles.THETA_INI=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_THETA_INI_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_THETA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_ALPHA_INI_Callback(hObject, ~, handles)
% hObject    handle to TAG_ALPHA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_ALPHA_INI as text
%        str2double(get(hObject,'String')) returns contents of TAG_ALPHA_INI as a double
handles.ALPHA_INI=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_ALPHA_INI_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_ALPHA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_BETA_INI_Callback(hObject, ~, handles)
% hObject    handle to TAG_BETA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_BETA_INI as text
%        str2double(get(hObject,'String')) returns contents of TAG_BETA_INI as a double
handles.BETA_INI=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_BETA_INI_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_BETA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_GAMMA_INI_Callback(hObject, ~, handles)
% hObject    handle to TAG_GAMMA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_GAMMA_INI as text
%        str2double(get(hObject,'String')) returns contents of TAG_GAMMA_INI as a double
handles.GAMMA_INI=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_GAMMA_INI_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_GAMMA_INI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_NN_POTENCIA_Callback(hObject, ~, handles)
% hObject    handle to TAG_NN_POTENCIA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_NN_POTENCIA as text
%        str2double(get(hObject,'String')) returns contents of TAG_NN_POTENCIA as a double
handles.NN_POTENCIA=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_NN_POTENCIA_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_NN_POTENCIA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_NN_VELOCIDAD_Callback(hObject, ~, handles)
% hObject    handle to TAG_NN_VELOCIDAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_NN_VELOCIDAD as text
%        str2double(get(hObject,'String')) returns contents of TAG_NN_VELOCIDAD as a double
handles.NN_VELOCIDAD=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_NN_VELOCIDAD_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_NN_VELOCIDAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_NN_ACELERACION_Callback(hObject, ~, handles)
% hObject    handle to TAG_NN_ACELERACION (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_NN_ACELERACION as text
%        str2double(get(hObject,'String')) returns contents of TAG_NN_ACELERACION as a double
handles.NN_ACELERACION=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_NN_ACELERACION_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_NN_ACELERACION (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_SIGMA_ACELERACION_Callback(hObject, ~, handles)
% hObject    handle to TAG_SIGMA_ACELERACION (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_SIGMA_ACELERACION as text
%        str2double(get(hObject,'String')) returns contents of TAG_SIGMA_ACELERACION as a double
handles.SIGMA_ACELERACION=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_SIGMA_ACELERACION_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_SIGMA_ACELERACION (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_N_Callback(hObject, ~, handles)
% hObject    handle to TAG_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_N as text
%        str2double(get(hObject,'String')) returns contents of TAG_N as a double
handles.N=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_N_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_SIGMA_VELOCIDAD_Callback(hObject, ~, handles)
% hObject    handle to TAG_SIGMA_VELOCIDAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_SIGMA_VELOCIDAD as text
%        str2double(get(hObject,'String')) returns contents of TAG_SIGMA_VELOCIDAD as a double
handles.SIGMA_VELOCIDAD=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_SIGMA_VELOCIDAD_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_SIGMA_VELOCIDAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_SIGMA_POTENCIA_Callback(hObject, ~, handles)
% hObject    handle to TAG_SIGMA_POTENCIA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_SIGMA_POTENCIA as text
%        str2double(get(hObject,'String')) returns contents of TAG_SIGMA_POTENCIA as a double
handles.SIGMA_POTENCIA=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_SIGMA_POTENCIA_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_SIGMA_POTENCIA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_DELTA_FIN_Callback(hObject, ~, handles)
% hObject    handle to TAG_DELTA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_DELTA_FIN as text
%        str2double(get(hObject,'String')) returns contents of TAG_DELTA_FIN as a double
handles.DELTA_FIN=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_DELTA_FIN_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_DELTA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_THETA_FIN_Callback(hObject, ~, handles)
% hObject    handle to TAG_THETA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_THETA_FIN as text
%        str2double(get(hObject,'String')) returns contents of TAG_THETA_FIN as a double
handles.THETA_FIN=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_THETA_FIN_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_THETA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_ALPHA_FIN_Callback(hObject, ~, handles)
% hObject    handle to TAG_ALPHA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ALPHA_FI=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_ALPHA_FIN_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_ALPHA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_BETA_FIN_Callback(hObject, ~, handles)
% hObject    handle to TAG_BETA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_BETA_FIN as text
%        str2double(get(hObject,'String')) returns contents of TAG_BETA_FIN as a double
handles.BETA_FIN=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_BETA_FIN_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_BETA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_GAMMA_FIN_Callback(hObject, ~, handles)
% hObject    handle to TAG_GAMMA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TAG_GAMMA_FIN as text
%        str2double(get(hObject,'String')) returns contents of TAG_GAMMA_FIN as a double
handles.GAMMA_FIN=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_GAMMA_FIN_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_GAMMA_FIN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
