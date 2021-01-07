function varargout = GUI_MAIN(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_MAIN_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_MAIN_OutputFcn, ...
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

% --- Executes just before GUI_MAIN is made visible.
function GUI_MAIN_OpeningFcn(hObject, ~, handles, varargin)
handles.Vector=[0.25 0.5 1 2 5 10];
%Elementos desactivados
set(handles.TAG_CANAL_REGISTRO_MAPA,'Enable','off');
set(handles.TAG_BANDA_POTENCIA_MAPA,'Enable','off');
set(handles.OP_ROI_MAX,'Enable','off');
set(handles.OP_ROI_MEDIA,'Enable','off');
set(handles.OP_MAPA_MAX,'Enable','off');
set(handles.OP_MAPA_MEDIA,'Enable','off');
set(handles.TAG_SLIDER,'Enable','off');
set(handles.TAG_FRAME,'Enable','off');
set(handles.TAG_SLIDER,'String','');
set(handles.TAG_TRAYECTORIA,'Enable','off');
set(handles.TAG_CORRELACION_PV,'Enable','off');
set(handles.TAG_RESOL,'Enable','off');
set(handles.TAG_ORIGINAL,'Enable','off');
set(handles.TAG_CORRELACION_PV,'Enable','off');
set(handles.TAG_ELECTRODO1,'Enable','off');
set(handles.TAG_ELECTRODO2,'Enable','off');
set(handles.TAG_PORCENTAJE,'Enable','off');
set(handles.TAG_REPRESENTA,'Enable','off');
set(handles.TAG_INICIAL,'Enable','off');
set(handles.TAG_FINAL,'Enable','off');

%Botones desactivados
% set(handles.TAG_CARGA_PARAMETROS,'Enable','off');
set(handles.POP_PARAMETRO,'Enable','off');
set(handles.TAG_COORDENADA,'Enable','off');
set(handles.TAG_THRESHOLD,'Enable','off');
set(handles.TAG_PROCESADO_ROI,'Enable','off');
set(handles.TAG_CALCULAR_MAPA,'Enable','off')
set(handles.PROCESADO_POTENCIA_ROI,'Enable','off');

% close all
format long g;
% warning off MATLAB: 

%GUI POTENCIA VELOCIDAD CORRELACION
handles.TIEMPO_PV=1;
handles.CANAL_PV=31;
handles.BANDA_PV=2; %para llamar a la GUI_PV con estos valores simplemente
handles.PARAMACTUALES_PV=[handles.TIEMPO_PV,handles.CANAL_PV, handles.BANDA_PV];%solo al inicio por defecto
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
handles.registro_1=1;
handles.registro_2=1;

%Otros parametros
handles.PARAMETROS={'POTENCIA', 'VELOCIDAD', 'ACELERACION'};
handles.PARAMETRO='POTENCIA';
handles.OPERACION_MAPA_MOSTRAR='Media';
handles.OPERACION_ROI_MOSTRAR='Media';
handles.TIEMPO=0.25;
handles.TRAYECTORIA=0;
handles.ORIGINAL_RESOL=0;
handles.COORDENADA=0;
handles.PORCENTAJE=0;
handles.REPRESENTA=0;
handles.EXPORTAR=0;
handles.EXPORTAR_MALLADO=0;
handles.EXPORTARVECTORTIEMPOS=0;
handles.EXPORTARROI=0;
handles.EXPORTARMALLADOVALORES=0;
handles.EXPORTARMAPAVALORES=0;
handles.TIEMPO_INDEX=1;

%Canal de potencia
handles.CANAL_REGISTRO=handles.registro_2;
handles.FreqBands=[handles.DELTA_INI handles.DELTA_FIN;handles.THETA_INI handles.THETA_FIN;handles.ALPHA_INI handles.ALPHA_FIN;handles.BETA_INI handles.BETA_FIN;handles.GAMMA_INI  handles.GAMMA_FIN]; %Frequency Bande Range
handles.SelectedBand=handles.FreqBands(handles.BANDA_PV,:);
%threshold
handles.THRESHOLD=0.2;
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
handles.SIGMA_ACELERACION] ;
% Choose default command line output for GUI_MAIN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = GUI_MAIN_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;

% --------------------------------------------------------------------
function TAG_EDITAR_PARAMETROS_Callback(hObject, ~, handles)

try
[handles.figura2,handles.PARAMNUEVOS]=GUI_PARAMETROS(handles.PARAMACTUALES); %blocked
%Bandas frecuencia
handles.DELTA_INI=handles.PARAMNUEVOS(1);
handles.DELTA_FIN=handles.PARAMNUEVOS(2);
handles.THETA_INI=handles.PARAMNUEVOS(3);
handles.THETA_FIN=handles.PARAMNUEVOS(4);
handles.ALPHA_INI=handles.PARAMNUEVOS(5);
handles.ALPHA_FIN=handles.PARAMNUEVOS(6); 
handles.BETA_INI=handles.PARAMNUEVOS(7);
handles.BETA_FIN=handles.PARAMNUEVOS(8); 
handles.GAMMA_INI=handles.PARAMNUEVOS(9);
handles.GAMMA_FIN=handles.PARAMNUEVOS(10);  
%BINS
handles.N=handles.PARAMNUEVOS(11);    
%VENTANAS
handles.NN_POTENCIA=handles.PARAMNUEVOS(12);
handles.NN_VELOCIDAD=handles.PARAMNUEVOS(13);
handles.NN_ACELERACION=handles.PARAMNUEVOS(14);   
%VARIANZAS
handles.SIGMA_POTENCIA=handles.PARAMNUEVOS(15);
handles.SIGMA_VELOCIDAD=handles.PARAMNUEVOS(16);
handles.SIGMA_ACELERACION=handles.PARAMNUEVOS(17);

handles.PARAMACTUALES=handles.PARAMNUEVOS; %actualizacion resultados
close(handles.figura2);
catch
end
guidata(hObject, handles);

% --- Executes on button press in TAG_CARGA_VIDEO.
function TAG_CARGA_VIDEO_Callback(hObject, ~, handles)
try
%cargo video y me quedo con su path y nombre
[handles.NombreArchivoVIDEO,handles.PathArchivoVIDEO] = uigetfile({'*.mp4','Archivos de video (*.mp4)'},'Selecciona un video');
    if  handles.PathArchivoVIDEO==0  %si le doy a cancelar handles.PathArchivo=0 no hago nada
    else 
        handles.VIDEO=strcat(handles.PathArchivoVIDEO,handles.NombreArchivoVIDEO);
        %CARGA VIDEO        
        handles.obj=VideoReader(handles.VIDEO);
        handles.numFrames = get(handles.obj, 'NumberOfFrames');
        handles.FPS=get(handles.obj,'FrameRate');       
        handles.VideoFormat=get(handles.obj,'VideoFormat');
        handles.TimeVideo = get(handles.obj, 'Duration');
        set(handles.TAG_ESTADO,'String',['Información del vídeo  (Formato: ' num2str(handles.VideoFormat) ', FPS: ' num2str(handles.FPS) ', Duración: ' num2str(handles.TimeVideo) ', Numero de frames: ' num2str(handles.numFrames) ')']);
        
        handles.frame=read(handles.obj,1);
        axes(handles.TAG_IMAGEN),imshow(handles.frame);
        [handles.frame handles.recorte]=imcrop(handles.frame); %frame recortado
        [handles.SY, handles.SX]=size(handles.frame);
        handles.SX=handles.SX/3;
        axes(handles.TAG_IMAGEN),imshow(handles.frame); 
        
        % Coordenadas
        handles.L=floor(handles.recorte(1));
        handles.B=floor(handles.recorte(2));
        handles.W=floor(handles.recorte(3));
        handles.H=floor(handles.recorte(4));
        
        %Config elements
        handles.INICIAL=1;
        handles.FINAL=handles.numFrames;
        set(handles.TAG_SLIDER,'Min',1);
        set(handles.TAG_SLIDER,'Max',handles.numFrames);
        set(handles.TAG_SLIDER,'SliderStep',[1/(handles.numFrames-1) 1/(handles.numFrames-1)]);
        set(handles.TAG_SLIDER,'Value',1); %coloco la posicion del slider al inicio al cargar cada video 
        set(handles.TAG_CARGA_PARAMETROS,'Enable','on');
        set(handles.TAG_INICIAL,'Enable','on');
        set(handles.TAG_FINAL,'Enable','on');

        set(handles.TAG_INICIAL,'String',num2str(1));
        set(handles.TAG_FINAL,'String',num2str(handles.numFrames));
        
        handles.dir_actual=cd; %guardo carpeta actual
        local_fichero=handles.dir_actual;
        addpath(local_fichero);
        save('PATH.mat','local_fichero');
        set(handles.TAG_ELECTRODO1,'Enable','on');
        set(handles.TAG_ELECTRODO2,'Enable','on');
    end
catch
end
guidata(hObject, handles);

% --- Executes on button press in TAG_CARGA_PARAMETROS.
function TAG_CARGA_PARAMETROS_Callback(hObject, ~, handles)
try
cd(handles.PathArchivoVIDEO);
addpath(handles.PathArchivoVIDEO); 

[FileNamesTODOS,PathNamesTODOS] = uigetfile('*.mat;*.txt;','Selecciona los archivos','MultiSelect','on');
    if  PathNamesTODOS==0  %si le doy a cancelar handles.PathArchivo=0 no hago nada
    else
        set(handles.TAG_SLIDER,'Min',handles.INICIAL);
        set(handles.TAG_SLIDER,'Max',handles.FINAL);
        set(handles.TAG_SLIDER,'SliderStep',[1/(handles.FINAL-handles.INICIAL) 1/(handles.FINAL-handles.INICIAL)]);
        set(handles.TAG_FRAME,'String',num2str(handles.INICIAL));

        set(handles.TAG_INICIAL,'Enable','off');
        set(handles.TAG_FINAL,'Enable','off');
        
        %Orden de carga: COEFS, COORDS, TRIGGERS, REGISTROS,  
        handles.coefs=load(strcat(PathNamesTODOS,FileNamesTODOS{1}));
        handles.coords=dlmread(strcat(PathNamesTODOS,FileNamesTODOS{2}),'\t'); % TRACKER: copiar datos seleccionados, precision total, sustituir coma por punto (PROBAR LUEGO)
        handles.registros=load(strcat(PathNamesTODOS,FileNamesTODOS{3}));
        handles.triggers=load(strcat(PathNamesTODOS,FileNamesTODOS{4}));
        handles.AX=handles.coefs(1);handles.BX=handles.coefs(2);handles.AY=handles.coefs(3);handles.BY=handles.coefs(4);
        set(handles.TAG_ESTADO,'String',['Coefientes, Registros, Triggers y coordenadas cargados correctamente']);
        handles.xi=handles.coords(:,1);
        handles.yi=handles.coords(:,2); %COORDENADAS CON RESOLUCION ORIGINAL (1/FPS) 
        
        %LECTURA REGISTROS
        handles.tensionesINI=handles.registros.LFP;
        handles.tensiones=handles.tensionesINI(handles.registro_1:handles.registro_2,:); %NUEVO SELECCIONAR CANALES
        handles.Ts=1/handles.registros.Args.Fs;        
        [handles.CHANNELS handles.LENGTH]=size(handles.tensiones);
        handles.Tregistro=(handles.LENGTH-1)*handles.Ts; %duracion del registro
        handles.Tr=0:handles.Ts:handles.Tregistro;
        
        %ELIMINACION EVOCADOS
        handles.tensionesNOEVOCADOS=evocados(handles.triggers.triggers,handles.tensiones,0.05,handles.registros.Args.Fs);
        
        axes(handles.TAG_MAPA),plot(handles.tensionesNOEVOCADOS'),title(['Registros sin evocados: ' num2str(handles.CHANNELS) ' canales']),ylabel(['Tension (mV)']),xlabel(['Muestras']),axis tight;
        set(handles.TAG_THRESHOLD,'Enable','on');
  
        handles.xi=handles.xi(handles.INICIAL:handles.FINAL);
        handles.yi=handles.yi(handles.INICIAL:handles.FINAL);  
 
        %CASAR REGISTRO CON VIDEO (PENDIENTE SI NO CARGO EL VIDEO ESTA PARTE COMO LA HAGO?)
        handles.numFrames=handles.FINAL-handles.INICIAL+1;
        handles.TimeVideo=(handles.numFrames)/(handles.FPS);
        handles.FramesToBeRemoved=floor((handles.numFrames/(floor(handles.TimeVideo)))*(floor(handles.TimeVideo)-handles.Tregistro)) %hay que quitar frames para hacer coincidir el video y el registro 
        handles.CurrentNumOfFrames=handles.numFrames-handles.FramesToBeRemoved;
        handles.TimeVideo=handles.Tregistro; %el tiempo del video sera ahora igual al del registro
        handles.FPS=handles.CurrentNumOfFrames/handles.TimeVideo;
        handles.Tt=1/handles.FPS;
       
        handles.xi=handles.xi(1:handles.CurrentNumOfFrames);
        handles.yi=handles.yi(1:handles.CurrentNumOfFrames);

        %pixeles iniciales a maxima resolucion
        handles.pxi=floor(handles.xi*handles.AX+handles.BX);
        handles.pyi=floor(handles.yi*handles.AY+handles.BY);
        handles.px=handles.pxi-handles.L+1;
        handles.py=handles.pyi-handles.B+1; %restarle el punto inicial desde el que se crea la roi (L,B)

        %CALCULO V Y A
        handles.t=0:handles.Tt:handles.Tt*(length(handles.pxi)-1); 
        
        %CALCULO VELOCIDADES (RESOLUCION: 1/FPS)
        handles.v=velocidades(handles.xi,handles.yi,handles.t,handles.Tt);
        
        %CALCULO ACELERACIONES
        handles.a=aceleraciones(handles.v,handles.t,handles.Tt);
        %Config elements
        set(handles.TAG_INICIAL,'String',num2str(handles.INICIAL));
        set(handles.TAG_FINAL,'String',num2str(handles.CurrentNumOfFrames));
        set(handles.TAG_SLIDER,'Enable','on');
        set(handles.TAG_TRAYECTORIA,'Enable','on');
        set(handles.TAG_FRAME,'Enable','on'); 
        set(handles.TAG_COORDENADA,'Enable','on'); 
        set(handles.TAG_SLIDER,'Max',handles.CurrentNumOfFrames);
        set(handles.TAG_SLIDER,'SliderStep',1/(handles.CurrentNumOfFrames-1));
        set(handles.TAG_ELECTRODO1,'Enable','off');
        set(handles.TAG_ELECTRODO2,'Enable','off');
    end
catch
end
guidata(hObject, handles);
 
% --- Executes on selection change in POP_PARAMETRO.
function POP_PARAMETRO_Callback(hObject, ~, handles)
handles.INDEX_PARAMETRO=get(handles.POP_PARAMETRO,'Value'); % PARAMETROS={'POTENCIA', 'VELOCIDAD', 'ACELERACION'};
handles.PARAMETRO=handles.PARAMETROS(handles.INDEX_PARAMETRO);

if handles.INDEX_PARAMETRO==1
    set(handles.TAG_CANAL_REGISTRO_MAPA,'Enable','on');
    set(handles.TAG_BANDA_POTENCIA_MAPA,'Enable','on');
    set(handles.TAG_RESOL,'Enable','on');
    set(handles.TAG_ORIGINAL,'Enable','off');
else
    set(handles.TAG_CANAL_REGISTRO_MAPA,'Enable','off');
    set(handles.TAG_BANDA_POTENCIA_MAPA,'Enable','off');
    set(handles.TAG_ORIGINAL,'Enable','on');
end
set(handles.OP_MAPA_MAX,'Enable','on');
set(handles.OP_MAPA_MEDIA,'Enable','on');
guidata(hObject, handles);
 
% --- Executes during object creation, after setting all properties.
function POP_PARAMETRO_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_CANAL_REGISTRO_MAPA_Callback(hObject, ~, handles)
handles.CANAL_REGISTRO=str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_CANAL_REGISTRO_MAPA_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_BANDA_POTENCIA_MAPA_Callback(hObject, ~, handles)
handles.BANDA_POTENCIA=str2double(get(hObject,'String'));
handles.SelectedBand=handles.FreqBands(handles.BANDA_POTENCIA,:);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_BANDA_POTENCIA_MAPA_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function TAG_SLIDER_Callback(hObject, ~, handles)
handles.POSICION_SLIDER=get(handles.TAG_SLIDER,'Value'); %cojo la posicion del slider de la barra
handles.frame_slider=read(handles.obj,fix(handles.POSICION_SLIDER));
handles.frame_slider=imcrop(handles.frame_slider,handles.recorte); %frame recortado
set(handles.TAG_FRAME,'String',fix(handles.POSICION_SLIDER)); %carga del valor actual del slider en la caja de texto
handles.px=handles.pxi-handles.L+1;
handles.py=handles.pyi-handles.B+1; %restarle el punto inicial desde el que se crea la roi (L,B) 
    if handles.COORDENADA==0
        axes(handles.TAG_IMAGEN),imshow(handles.frame_slider);
    else
        axes(handles.TAG_IMAGEN),imshow(handles.frame_slider),hold on,plot(handles.px(fix(handles.POSICION_SLIDER)),handles.py(fix(handles.POSICION_SLIDER)),'r.'),hold off ;
    end   
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_SLIDER_CreateFcn(hObject, ~, ~)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function TAG_FRAME_Callback(hObject, ~, handles)
handles.NUMFRAME=str2double(get(hObject,'String')); %Cojo el valor de la caja de texto
handles.frame_slider=read(handles.obj,handles.NUMFRAME); %Cargo el frame
handles.frame_slider=imcrop(handles.frame_slider,handles.recorte); %frame recortado
handles.px=handles.pxi-handles.L+1;
handles.py=handles.pyi-handles.B+1; %restarle el punto inicial desde el que se crea la roi (L,B) 

if handles.COORDENADA==0
    axes(handles.TAG_IMAGEN),imshow(handles.frame_slider);
else
    axes(handles.TAG_IMAGEN),imshow(handles.frame_slider),hold on,plot(handles.px(fix(handles.NUMFRAME)),handles.py(fix(handles.NUMFRAME)),'r.'),hold off ;
end

%mover la scrollbar
handles.POSICION_SLIDER=handles.NUMFRAME;
set(handles.TAG_SLIDER,'Value',handles.NUMFRAME); %coloco la posicion del slider donde toca
guidata(hObject,handles); %guardo la posicion

% --- Executes during object creation, after setting all properties.
function TAG_FRAME_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in TAG_COORDENADA.
function TAG_COORDENADA_Callback(hObject, ~, handles)
handles.COORDENADA=get(hObject,'Value');
handles.POSICION_SLIDER=get(handles.TAG_SLIDER,'Value');
handles.frame_slider=read(handles.obj,(fix(handles.POSICION_SLIDER))); %Cargo el frame

handles.px=handles.pxi-handles.L+1;
handles.py=handles.pyi-handles.B+1; %restarle el punto inicial desde el que se crea la roi (L,B) 

handles.frame_slider=imcrop(handles.frame_slider,handles.recorte); %frame recortado
if handles.COORDENADA==0
    axes(handles.TAG_IMAGEN),imshow(handles.frame_slider);
else
    axes(handles.TAG_IMAGEN),imshow(handles.frame_slider),hold on,plot(handles.px(fix(handles.POSICION_SLIDER)),handles.py(fix(handles.POSICION_SLIDER)),'r.'),hold off ;
end
guidata(hObject,handles);

% --- Executes on button press in TAG_TRAYECTORIA.
function TAG_TRAYECTORIA_Callback(hObject, ~, handles)
%Mostrara los pixeles segun TIEMPO y el frame inicial
handles.frame=read(handles.obj,handles.INICIAL);
handles.frame=imcrop(handles.frame,handles.recorte);
handles.TRAYECTORIA=get(hObject,'Value');
handles.px=handles.pxi-handles.L+1;
handles.py=handles.pyi-handles.B+1; %restarle el punto inicial desde el que se crea la roi (L,B) 
if handles.TRAYECTORIA==1
    figure,imshow(handles.frame),hold on,plot(handles.px,handles.py,'b.'),plot(handles.px,handles.py,'b.-'),hold off,title(['Trayectoria de la rata en el video']);
else
    axes(handles.TAG_IMAGEN),imshow(handles.frame);
end
guidata(hObject,handles);

function TAG_THRESHOLD_Callback(hObject, ~, handles)
handles.THRESHOLD=str2double(get(hObject,'String'));
%ELIMINACION ARTEFACTOS problema en esta parte
[handles.TRIGGERED_CHANNEL,handles.TRIGGERED_FRAME,~]=find(abs(handles.tensionesNOEVOCADOS)>handles.THRESHOLD);
handles.INDICES=sub2ind([handles.CHANNELS handles.LENGTH],handles.TRIGGERED_CHANNEL,handles.TRIGGERED_FRAME);
handles.MEDIAS_REEMPLAZO=mean(handles.tensionesNOEVOCADOS,2);
handles.tensionesTHRESHOLD=handles.tensionesNOEVOCADOS;
set(handles.POP_PARAMETRO,'Enable','on');
handles.tensionesTHRESHOLD(handles.INDICES)=handles.MEDIAS_REEMPLAZO(handles.TRIGGERED_CHANNEL); %se reemplazan los valores por en cima del umbral por la media de ese canal (no por cero para falsear lo minimo)
set(handles.TAG_CORRELACION_PV,'Enable','on');
TENSIONES=handles.tensionesTHRESHOLD;
cd ..
save('TENSIONES.mat','TENSIONES')
axes(handles.TAG_MAPA),plot(handles.tensionesTHRESHOLD'),title(['Registros sin artefactos: ' num2str(handles.CHANNELS) ' canales']),ylabel(['Tension (mV)']),xlabel(['Muestras']),axis tight;
set(handles.OP_MAPA_MAX,'Enable','on');
set(handles.OP_MAPA_MEDIA,'Enable','on');
set(handles.TAG_RESOL,'Enable','on');
set(handles.TAG_CALCULAR_MAPA,'Enable','on');
set(handles.TAG_PORCENTAJE,'Enable','on');
set(handles.TAG_REPRESENTA,'Enable','on');
set(handles.TAG_SLIDER,'Enable','on');
set(handles.TAG_FRAME,'Enable','on');
set(handles.TAG_TRAYECTORIA,'Enable','on');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_THRESHOLD_CreateFcn(hObject, ~, ~)
% hObject    handle to TAG_THRESHOLD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------
function TAG_CORRELACION_PV_Callback(hObject, ~, handles)
try
    [handles.figura1,handles.PARAMNUEVOS_PV]=GUI_PV(handles.PARAMACTUALES_PV,handles); %LE PASO LOS HANDLES DE ESTA VENTANA GUI
    handles.PARAMACTUALES_PV=handles.PARAMNUEVOS_PV; %actualizacion resultados
    close(handles.figura1);
catch
end
guidata(hObject, handles);

% --- Executes on button press in TAG_CALCULAR_MAPA.
function TAG_CALCULAR_MAPA_Callback(hObject, ~, handles)
% hObject    handle to TAG_CALCULAR_MAPA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.PARAMETER=zeros(handles.SY,handles.SX);
handles.NoCero=zeros(floor(handles.SY/handles.N),floor(handles.SX/handles.N)); 
handles.Operacion=zeros(handles.SY,handles.SX);
handles.DENSIDAD=zeros(handles.SY,handles.SX);  
handles.BASE=1:handles.N;

handles.TIEMPO_INDEX=get(handles.TAG_RESOL,'Value');
handles.TIEMPO=handles.Vector(handles.TIEMPO_INDEX);

handles.TIEMPOS=handles.t(1:ceil((handles.TIEMPO)*(handles.CurrentNumOfFrames/handles.TimeVideo)):end);
handles.TIEMPOS=handles.TIEMPOS(1:end-1);
handles.VENTANA_PROMEDIO=ceil(handles.TIEMPO/(handles.TimeVideo/handles.CurrentNumOfFrames));
handles.PROMEDIOS=floor(handles.CurrentNumOfFrames/(handles.VENTANA_PROMEDIO));
handles.px=handles.pxi-handles.L+1;
handles.py=handles.pyi-handles.B+1; %restarle el punto inicial desde el que se crea la roi (L,B) 
handles.velocidad=(chunkaveragevel(handles.v(:),handles.VENTANA_PROMEDIO,handles.PROMEDIOS)); %Promediamos la velocidad en tramos de TIEMPO segundos
handles.aceleracion=(chunkaveragevel(handles.a(:),handles.VENTANA_PROMEDIO,handles.PROMEDIOS)); %Promediamos la velocidad en tramos de TIEMPO segundos
handles.PX=floor(chunkaveragevel(handles.px(:),handles.VENTANA_PROMEDIO,handles.PROMEDIOS)); %Promediamos la velocidad en tramos de TIEMPO segundos
handles.PY=floor(chunkaveragevel(handles.py(:),handles.VENTANA_PROMEDIO,handles.PROMEDIOS)); %Promediamos la velocidad en tramos de TIEMPO segundos

handles.H1 = fspecial('gaussian',handles.NN_POTENCIA,handles.SIGMA_POTENCIA) ;
handles.H2 = fspecial('gaussian',handles.NN_ACELERACION,handles.SIGMA_ACELERACION);
handles.H3 = fspecial('gaussian',handles.NN_VELOCIDAD,handles.SIGMA_VELOCIDAD) ;

if strcmp(handles.PARAMETRO,'POTENCIA')
    P=zeros(1,handles.PROMEDIOS); %siempre estara promediado
    handles.MUESTRAS=floor(handles.TIEMPO/handles.Ts);
    handles.im=1:handles.MUESTRAS;    
    handles.tensiones=handles.tensionesINI(handles.CANAL_REGISTRO,:);
    handles.tensionesNOEVOCADOS=evocados(handles.triggers.triggers,handles.tensiones,0.05,handles.registros.Args.Fs);
    handles.TRIGGERED_FRAME=find(abs(handles.tensionesNOEVOCADOS)>handles.THRESHOLD);
    handles.MEDIAS_REEMPLAZO=mean(handles.tensionesNOEVOCADOS);
    handles.tensionesTHRESHOLD=handles.tensionesNOEVOCADOS;
    handles.tensionesTHRESHOLD(handles.TRIGGERED_FRAME)=handles.MEDIAS_REEMPLAZO; 
       
    for k=1:handles.PROMEDIOS
       P(k)=MaKPower_NEW(handles.tensionesTHRESHOLD(handles.im+handles.MUESTRAS*(k-1)),handles.registros.Args,handles.SelectedBand); 
    end
    handles.P=P;
    handles.PIXELES=sub2ind([handles.SY,handles.SX],handles.PY,handles.PX);
    handles.PARAMETER(handles.PIXELES)=handles.P;
    if handles.EXPORTARVECTORTIEMPOS==1
        %GUARDAR VARIABLE EN FICHEROS 
        POTENCIA=handles.P;
        TIEMPO_VARIABLE=handles.TIEMPOS;
        if handles.REPRESENTA==1
             figure,plot(TIEMPO_VARIABLE,POTENCIA)
        end
        [fname,pth] = uiputfile({'*.txt','Text File (*.txt)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Save as'); % Type in name of file.
        dlmwrite([pth,fname],[TIEMPO_VARIABLE', POTENCIA'],' ');  % Or choose format, etc..
        handles.POTENCIA=POTENCIA;
        set(handles.TAG_ESTADO,'String',['Se ha generado el fichero en formato: [TIEMPO PARAMETRO]']) ;
    end
end

if strcmp(handles.PARAMETRO,'VELOCIDAD')
    if handles.ORIGINAL_RESOL==1 %Resolucion Original
        handles.PIXELES=sub2ind([handles.SY,handles.SX],handles.py,handles.px);
        handles.PARAMETER(handles.PIXELES)=handles.v(1:end);
        %GUARDAR VARIABLE EN FICHEROS 
         if handles.EXPORTARVECTORTIEMPOS==1
            VELOCIDAD=handles.v;
            TIEMPO_VARIABLE=handles.t;
            if handles.REPRESENTA==1
                 figure,plot(TIEMPO_VARIABLE,VELOCIDAD);
            end
            [fname,pth] = uiputfile({'*.txt','Text File (*.txt)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Save as'); % Type in name of file.
            dlmwrite([pth,fname],[TIEMPO_VARIABLE' VELOCIDAD'],' ');  % Or choose format, etc..
            handles.VELOCIDAD=VELOCIDAD;
            set(handles.TAG_ESTADO,'String',['Se ha generado el fichero en formato: [TIEMPO PARAMETRO]']) ;
         end
    else
        handles.PIXELES=sub2ind([handles.SY,handles.SX],handles.PY,handles.PX);
        handles.PARAMETER(handles.PIXELES)=handles.velocidad(1:end);
        if handles.EXPORTARVECTORTIEMPOS==1
            %GUARDAR VARIABLE EN FICHEROS 
            VELOCIDAD=handles.velocidad;
            TIEMPO_VARIABLE=handles.TIEMPOS;
            if handles.REPRESENTA==1
                 figure,plot(TIEMPO_VARIABLE,VELOCIDAD);
            end
            [fname,pth] = uiputfile({'*.txt','Text File (*.txt)';'*.mat', 'M-files (*.mat)';'*.*','All Files (*.*)'},'Save as'); % Type in name of file.
            dlmwrite([pth,fname],[TIEMPO_VARIABLE' VELOCIDAD'],' ');  % Or choose format, etc..
            handles.VELOCIDAD=VELOCIDAD;
            set(handles.TAG_ESTADO,'String',['Se ha generado el fichero en formato: [TIEMPO PARAMETRO]']) ;  
        end
    end
end

if strcmp(handles.PARAMETRO,'ACELERACION')
    if handles.ORIGINAL_RESOL==1 %Resolucion Original
        handles.PIXELES=sub2ind([handles.SY,handles.SX],handles.py,handles.px);
        handles.PARAMETER(handles.PIXELES)=handles.a(1:end);
        if handles.EXPORTARVECTORTIEMPOS==1
            %GUARDAR VARIABLE EN FICHEROS 
            ACELERACION=handles.a;
            TIEMPOHERE=handles.t;
            if handles.REPRESENTA==1
                 figure,plot(TIEMPO_VARIABLE,ACELERACION);
            end
            [fname,pth] = uiputfile({'*.txt','Text File (*.txt)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Save as'); % Type in name of file.
            dlmwrite([pth,fname],[TIEMPO_VARIABLE' ACELERACION'],' ');  % Or choose format, etc..
            handles.ACELERACION=ACELERACION;
            set(handles.TAG_ESTADO,'String',['Se ha generado el fichero en formato: [TIEMPO PARAMETRO]']) ;
        end
    else
        handles.PIXELES=sub2ind([handles.SY,handles.SX],handles.PY,handles.PX);
        handles.PARAMETER(handles.PIXELES)=handles.aceleracion(1:end);
        if handles.EXPORTARVECTORTIEMPOS==1
            %GUARDAR VARIABLE EN FICHEROS 
            ACELERACION=handles.aceleracion;
            TIEMPO_VARIABLE=handles.TIEMPOS;
            if handles.REPRESENTA==1
                 figure,plot(TIEMPO_VARIABLE,ACELERACION)
            end
            [fname,pth] = uiputfile({'*.txt','Text File (*.txt)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Save as'); % Type in name of file.
            dlmwrite([pth,fname],[TIEMPO_VARIABLE' ACELERACION'],' ');  % Or choose format, etc..
            handles.ACELERACION=ACELERACION;
            set(handles.TAG_ESTADO,'String',['Se ha generado el fichero en formato: [TIEMPO PARAMETRO]']) ;
        end
    end
end
 
for ii=1:handles.SY/handles.N
    for jj=1:handles.SX/handles.N
        handles.NoCero(ii,jj)=length(find(handles.PARAMETER(handles.BASE+(ii-1)*handles.N,handles.BASE+(jj-1)*handles.N))); %almaceno el numero de valores donde hay A,V (por ahi pasa la rata)
        handles.DENSIDAD(handles.BASE+(ii-1)*handles.N,handles.BASE+(jj-1)*handles.N)= handles.NoCero(ii,jj)*ones(handles.N,handles.N);                  
        if strcmp(handles.OPERACION_MAPA_MOSTRAR,'Media') %ponerlo bien en los tres
            handles.Operacion(handles.BASE+(ii-1)*handles.N,handles.BASE+(jj-1)*handles.N)=mean(mean(handles.PARAMETER(handles.BASE+(ii-1)*handles.N,handles.BASE+(jj-1)*handles.N)));
        end
        if strcmp(handles.OPERACION_MAPA_MOSTRAR,'Maxima')
            handles.Operacion(handles.BASE+(ii-1)*handles.N,handles.BASE+(jj-1)*handles.N)=max(max(handles.PARAMETER(handles.BASE+(ii-1)*handles.N,handles.BASE+(jj-1)*handles.N)));
        end
    end
end
        if strcmp(handles.PARAMETRO,'POTENCIA')
           handles.Operacion=filter2(handles.H1,handles.Operacion);
           if handles.EXPORTARMAPAVALORES==1;
               [fname,pth] = uiputfile({'*.csv','CSV (*.csv)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Guardar Valores Mapa','MAPA'); % Type in name of file.
                dlmwrite([pth,fname],[handles.Operacion],',');  % Or choose format, etc..
           end
           if handles.EXPORTARMALLADOVALORES==1;
               [fname,pth] = uiputfile({'*.csv','CSV (*.csv)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Guardar Valores Mallado','MALLADO'); % Type in name of file.
               dlmwrite([pth,fname],[handles.DENSIDAD],',');  % Or choose format, etc..
           end
           handles.POTENCIA_MATRIZ=handles.Operacion;
           if (handles.EXPORTAR_MALLADO==1)
               axes(handles.TAG_IMAGEN),contourf(handles.DENSIDAD),colorbar,title(['Mallado Densidad Puntos'],'Color','black','FontSize',10);
               figure,contourf(handles.DENSIDAD),colorbar,title(['Mallado Densidad Puntos'],'Color','black','FontSize',10);
           else
               axes(handles.TAG_IMAGEN),contourf(handles.DENSIDAD),colorbar,title(['Mallado Densidad Puntos'],'Color','black','FontSize',10);
           end
           switch handles.PORCENTAJE
                case 0
                    if (handles.EXPORTAR==1)
                        axes(handles.TAG_MAPA),contourf(handles.Operacion,50),colorbar,title(['Potencia ' (handles.OPERACION_MAPA_MOSTRAR) '(mV^2) [Canal: ' num2str(handles.CANAL_REGISTRO) '],[Banda:{' num2str(handles.SelectedBand) '} Hz]'],'Color','black','FontSize',10),shading flat
                        figure,contourf(handles.Operacion,50),colorbar,title(['Potencia ' (handles.OPERACION_MAPA_MOSTRAR) '(mV^2) [Canal: ' num2str(handles.CANAL_REGISTRO) '],[Banda:{' num2str(handles.SelectedBand) '} Hz]'],'Color','black','FontSize',10),shading flat
                    else
                        axes(handles.TAG_MAPA),contourf(handles.Operacion,50),colorbar,title(['Potencia ' (handles.OPERACION_MAPA_MOSTRAR) '(mV^2) [Canal: ' num2str(handles.CANAL_REGISTRO) '],[Banda:{' num2str(handles.SelectedBand) '} Hz]'],'Color','black','FontSize',10),shading flat
                    end
                case 1
                   if (handles.EXPORTAR==1)
                       axes(handles.TAG_MAPA),contourf(100*handles.Operacion/(max(max(handles.Operacion))),50),colorbar,title(['Potencia/Max (%) [Canal: ' num2str(handles.CANAL_REGISTRO) '],[Banda:{' num2str(handles.SelectedBand) '}]'],'Color','black','FontSize',10),shading flat
                       figure,contourf(100*handles.Operacion/(max(max(handles.Operacion))),50),colorbar,title(['Potencia/Max (%) [Canal: ' num2str(handles.CANAL_REGISTRO) '],[Banda:{' num2str(handles.SelectedBand) '}]'],'Color','black','FontSize',10),shading flat
                   else
                       axes(handles.TAG_MAPA),contourf(100*handles.Operacion/(max(max(handles.Operacion))),50),colorbar,title(['Potencia/Max (%) [Canal: ' num2str(handles.CANAL_REGISTRO) '],[Banda:{' num2str(handles.SelectedBand) '}]'],'Color','black','FontSize',10),shading flat
                   end
                end
        end
        if strcmp(handles.PARAMETRO,'VELOCIDAD')
            handles.Operacion=filter2(handles.H2,handles.Operacion);
             if handles.EXPORTARMAPAVALORES==1;
                [fname,pth] = uiputfile({'*.csv','CSV (*.csv)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Guardar Valores Mapa','MAPA'); % Type in name of file.
                dlmwrite([pth,fname],[handles.Operacion],',');  % Or choose format, etc..
             end
             if handles.EXPORTARMALLADOVALORES==1;
                [fname,pth] = uiputfile({'*.csv','CSV (*.csv)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Guardar Valores Mallado','MALLADO'); % Type in name of file.
                dlmwrite([pth,fname],[handles.DENSIDAD],',');  % Or choose format, etc..
             end
            handles.VELOCIDAD_MATRIZ=handles.Operacion;
            if (handles.EXPORTAR_MALLADO==1)
                axes(handles.TAG_IMAGEN),contourf(handles.DENSIDAD),colorbar,title(['Mallado Densidad Puntos'],'Color','black','FontSize',10)
                figure,contourf(handles.DENSIDAD),colorbar,title(['Mallado Densidad Puntos'],'Color','black','FontSize',10)
            else
                axes(handles.TAG_IMAGEN),contourf(handles.DENSIDAD),colorbar,title(['Mallado Densidad Puntos'],'Color','black','FontSize',10)
            end
            switch handles.PORCENTAJE
                case 0
                     if (handles.EXPORTAR==1)
                        axes(handles.TAG_MAPA),contourf(handles.Operacion,50),colorbar,title(['Velocidad ' (handles.OPERACION_MAPA_MOSTRAR) ' (cm/s)'],'Color','black','FontSize',10),shading flat
                        figure,contourf(handles.Operacion,50),colorbar,title(['Velocidad ' (handles.OPERACION_MAPA_MOSTRAR) ' (cm/s)'],'Color','black','FontSize',10),shading flat
                     else
                        axes(handles.TAG_MAPA),contourf(handles.Operacion,50),colorbar,title(['Velocidad ' (handles.OPERACION_MAPA_MOSTRAR) ' (cm/s)'],'Color','black','FontSize',10),shading flat
                     end
                case 1
                     if (handles.EXPORTAR==1)
                        axes(handles.TAG_MAPA),contourf(100*handles.Operacion/(max(max(handles.Operacion))),50),colorbar,title(['Velocidad/Max (%)'],'Color','black','FontSize',10),shading flat
                        figure,contourf(100*handles.Operacion/(max(max(handles.Operacion))),50),colorbar,title(['Velocidad/Max (%)'],'Color','black','FontSize',10),shading flat
                     else
                        axes(handles.TAG_MAPA),contourf(100*handles.Operacion/(max(max(handles.Operacion))),50),colorbar,title(['Velocidad/Max (%)'],'Color','black','FontSize',10),shading flat
                     end
                end
        end
        if strcmp(handles.PARAMETRO,'ACELERACION')
            handles.Operacion=filter2(handles.H3,handles.Operacion);
             if handles.EXPORTARMAPAVALORES==1;
                 [fname,pth] = uiputfile({'*.csv','CSV (*.csv)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Guardar Valores Mapa','MAPA'); % Type in name of file.
                 dlmwrite([pth,fname],[handles.Operacion],',');  % Or choose format, etc..
             end
             if handles.EXPORTARMALLADOVALORES==1;
               [fname,pth] = uiputfile({'*.csv','CSV (*.csv)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Guardar Valores Mallado','MALLADO'); % Type in name of file.
                dlmwrite([pth,fname],[handles.DENSIDAD],',');  % Or choose format, etc..
             end
            handles.ACELERACION_MATRIZ=handles.Operacion;
             if (handles.EXPORTAR_MALLADO==1)
                axes(handles.TAG_IMAGEN),contourf(handles.DENSIDAD),colorbar,title(['Mallado Densidad Puntos'],'Color','black','FontSize',10);
                figure,contourf(handles.DENSIDAD),colorbar,title(['Mallado Densidad Puntos'],'Color','black','FontSize',10);
             else
                axes(handles.TAG_IMAGEN),contourf(handles.DENSIDAD),colorbar,title(['Mallado Densidad Puntos'],'Color','black','FontSize',10);
             end
             switch handles.PORCENTAJE     
                case 0
                     if (handles.EXPORTAR==1)
                        axes(handles.TAG_MAPA),contourf(handles.Operacion,50),colorbar,title(['Aceleracion ' (handles.OPERACION_MAPA_MOSTRAR)  ' (cm/s^2)'],'Color','black','FontSize',10),shading flat
                        figure,contourf(handles.Operacion,50),colorbar,title(['Aceleracion ' (handles.OPERACION_MAPA_MOSTRAR)  ' (cm/s^2)'],'Color','black','FontSize',10),shading flat
                     else
                        axes(handles.TAG_MAPA),contourf(handles.Operacion,50),colorbar,title(['Aceleracion ' (handles.OPERACION_MAPA_MOSTRAR)  ' (cm/s^2)'],'Color','black','FontSize',10),shading flat
                     end
                case 1
                     if (handles.EXPORTAR==1)
                        axes(handles.TAG_MAPA),contourf(100*handles.Operacion/(max(max(handles.Operacion))),50),colorbar,title(['Aceleracion/Max (%)'],'Color','black','FontSize',10),shading flat
                        figure,contourf(100*handles.Operacion/(max(max(handles.Operacion))),50),colorbar,title(['Aceleracion/Max (%)'],'Color','black','FontSize',10),shading flat
                     else
                        axes(handles.TAG_MAPA),contourf(100*handles.Operacion/(max(max(handles.Operacion))),50),colorbar,title(['Aceleracion/Max (%)'],'Color','black','FontSize',10),shading flat
                     end
                end
        end
% Activo tambien la operacion a relizar sobre el mapa
set(handles.OP_ROI_MAX,'Enable','on');
set(handles.OP_ROI_MEDIA,'Enable','on');   
set(handles.PROCESADO_POTENCIA_ROI,'Enable','on');
guidata(hObject,handles); 

% --- Executes on button press in TAG_ORIGINAL.
function TAG_ORIGINAL_Callback(hObject, ~, handles)
handles.ORIGINAL_RESOL=get(hObject,'Value');
    if (handles.ORIGINAL_RESOL==1) & (strcmp(handles.PARAMETRO,'VELOCIDAD')) 
        set(handles.TAG_RESOL,'Enable','off');
    end
    if (handles.ORIGINAL_RESOL==1) & (strcmp(handles.PARAMETRO,'ACELERACION')) 
        set(handles.TAG_RESOL,'Enable','off');
    end
    if (handles.ORIGINAL_RESOL==1) & (strcmp(handles.PARAMETRO,'POTENCIA')) 
        set(handles.TAG_RESOL,'Enable','off');
    end
    if (handles.ORIGINAL_RESOL==0) & (strcmp(handles.PARAMETRO,'VELOCIDAD')) 
        set(handles.TAG_RESOL,'Enable','on');
    end
    if (handles.ORIGINAL_RESOL==0) & (strcmp(handles.PARAMETRO,'ACELERACION')) 
        set(handles.TAG_RESOL,'Enable','on');
    end
guidata(hObject,handles);

% --- Executes on selection change in TAG_RESOL.
function TAG_RESOL_Callback(hObject, ~, handles)
handles.TIEMPO_INDEX=get(handles.TAG_RESOL,'Value');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_RESOL_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when selected object is changed in PANEL_OP_MAPA.
function PANEL_OP_MAPA_SelectionChangeFcn(hObject, ~, handles)
    if hObject==(handles.OP_MAPA_MEDIA)
        handles.OPERACION_MAPA_MOSTRAR='Media';
    end
    if hObject==(handles.OP_MAPA_MAX)
        handles.OPERACION_MAPA_MOSTRAR='Maxima';
    end
guidata(hObject,handles);

% --- Executes when selected object is changed in PANEL_OP_ROI.
function PANEL_OP_ROI_SelectionChangeFcn(hObject, ~, handles)
    if hObject==(handles.OP_ROI_MEDIA)
        handles.OPERACION_ROI_MOSTRAR='Media';
    end
    if hObject==(handles.OP_ROI_MAX)
        handles.OPERACION_ROI_MOSTRAR='Maxima';
    end
guidata(hObject,handles);

% --- Executes on button press in TAG_PROCESADO_ROI.
function TAG_PROCESADO_ROI_Callback(hObject, eventdata, handles)

axes(handles.TAG_MAPA),contourf(handles.Operacion,50),colorbar,shading flat,axes(handles.TAG_IMAGEN);
[handles.frameROI handles.ROI]=imcrop(handles.frame); %frame recortado   

% Coordenadas
handles.L=floor(handles.ROI(1));
handles.B=floor(handles.ROI(2));
handles.W=floor(handles.ROI(3));
handles.H=floor(handles.ROI(4));
[handles.SYROI, handles.SXROI]=size(handles.frameROI);
handles.SXROI= handles.SXROI/3;

%Medias de la ROI
handles.VALORES=handles.Operacion(handles.L:handles.L+handles.W, handles.B:handles.B+handles.H);
if strcmp(handles.OPERACION_ROI_MOSTRAR,'Media') 
     handles.OUTPUT=mean(mean(handles.VALORES));
end
if strcmp(handles.OPERACION_ROI_MOSTRAR,'Maxima')  
     handles.OUTPUT=max(max(handles.VALORES));
end
set(handles.TAG_ESTADO,'String',['Valor en la ROI de interes: ' num2str(handles.OUTPUT)]);
axes(handles.TAG_MAPA),plot(handles.tensionesTHRESHOLD(handles.registro_1:handles.registro_2,:)'),title([ 'Registros en electrodos del ' num2str(handles.registro_1) ' al ' num2str(handles.registro_2) ' para una V de ' num2str(handles.velocidad_dada) ' cm/s']),ylabel(['Tension (mV)']),xlabel(['Muestras']),axis tight;
guidata(hObject,handles);

function TAG_ELECTRODO1_Callback(hObject, eventdata, handles)
handles.registro_1=str2double(get(handles.TAG_ELECTRODO1,'String'));
disp(handles.registro_1)
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_ELECTRODO1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_ELECTRODO2_Callback(hObject, eventdata, handles)
handles.registro_2=str2double(get(handles.TAG_ELECTRODO2,'String'));
disp(handles.registro_2)
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_ELECTRODO2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function TAG_GUI_MAIN_CreateFcn(hObject, eventdata, handles)

% --- Executes on button press in TAG_ORIGINAL.
function TAG_PORCENTAJE_Callback(hObject, ~, handles)
handles.PORCENTAJE=get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in TAG_REPRESENTA.
function TAG_REPRESENTA_Callback(hObject, ~, handles)
handles.REPRESENTA=get(hObject,'Value');
guidata(hObject,handles);

function TAG_INICIAL_Callback(hObject, eventdata, handles)
handles.INICIAL=str2double(get(hObject,'String'));
set(handles.TAG_FRAME,'String',num2str(handles.INICIAL));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function TAG_INICIAL_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TAG_FINAL_Callback(hObject, eventdata, handles)
handles.FINAL=str2double(get(hObject,'String'));
guidata(hObject,handles);

function TAG_FINAL_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in TAG_EXPORTAR.
function TAG_EXPORTAR_Callback(hObject, eventdata, handles)
handles.EXPORTAR=get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in TAG_EXPORTAR_MALLADO.
function TAG_EXPORTAR_MALLADO_Callback(hObject, eventdata, handles)
handles.EXPORTAR_MALLADO=get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in PROCESADO_POTENCIA_ROI.
function PROCESADO_POTENCIA_ROI_Callback(hObject, eventdata, handles)

handles.Imin=min(handles.px);
handles.Imax=max(handles.px);
handles.Jmin=min(handles.py);
handles.Jmax=max(handles.py);

axes(handles.TAG_IMAGEN),imshow(handles.frame),hold on,rectangle('Position',[handles.Imin,handles.Jmin,handles.Imax-handles.Imin+1,handles.Jmax-handles.Jmin+1],'LineWidth',3, 'EdgeColor','b'),hold off
f=getframe(gca); %grabar imagen con el rectangulo de la arena
[handles.X, map] = frame2im(f);

set(handles.TAG_ESTADO,'String',['Selecciona solo la ARENA']);
[handles.framearenaROI handles.ARENAROI]=imcrop(handles.X); %arena dentro del cuadro

set(handles.TAG_ESTADO,'String',['Selecciona solo un OBJETO']);
[handles.objetoROI handles.ROI]=imcrop(handles.X); %frame recortado alrededor de objecto

%Tendremos en cuenta la ROI base (el laberinto de arena solamente)
handles.L_ARENA=floor(handles.ARENAROI(1));
handles.B_ARENA=floor(handles.ARENAROI(2));
handles.W_ARENA=floor(handles.ARENAROI(3));
handles.H_ARENA=floor(handles.ARENAROI(4));
 
%Coordenadas nueva ROI alerededor objeto
handles.L=floor(handles.ROI(1));
handles.B=floor(handles.ROI(2));
handles.W=floor(handles.ROI(3));
handles.H=floor(handles.ROI(4));
 
%Medias de la ROI en la arena
handles.VALORES_ARENA=handles.Operacion(handles.L_ARENA:handles.L_ARENA+handles.W_ARENA,handles.B_ARENA:handles.B_ARENA+handles.H_ARENA); 
[handles.XX,handles.YY] = meshgrid(handles.L_ARENA:handles.L_ARENA+handles.W_ARENA,handles.B_ARENA:handles.B_ARENA+handles.H_ARENA)
handles.IND_ARENA = sub2ind(size(handles.Operacion),handles.YY,handles.XX);

%Medias de la ROI objeto
handles.VALORES_OBJ=handles.Operacion(handles.L:handles.L+handles.W, handles.B:handles.B+handles.H);
[handles.XX,handles.YY] = meshgrid(handles.L:handles.L+handles.W,handles.B:handles.B+handles.H);
handles.IND_OBJ = sub2ind(size(handles.Operacion),handles.YY,handles.XX);
handles.IND_ARENA_NO_OBJ=setxor(handles.IND_ARENA(:),handles.IND_OBJ(:));
handles.OUTPUT_ARENA=mean(mean(handles.VALORES_ARENA));
handles.OUTPUT_OBJ=mean(mean(handles.VALORES_OBJ));
handles.OUTPUT_ARENA_NO_OBJ=mean(mean(handles.Operacion(handles.IND_ARENA_NO_OBJ)));
handles.PORCENTAJE=((handles.OUTPUT_OBJ)./(handles.OUTPUT_ARENA_NO_OBJ));
set(handles.TAG_ESTADO,'String',['Valor en: ROI COMPLETA (S1) = ' num2str(handles.OUTPUT_ARENA) ', ROI OBJETO (S2) = ' num2str(handles.OUTPUT_OBJ) ', (S2-S1) = ' num2str(handles.OUTPUT_ARENA_NO_OBJ) ' S2/(S2-S1) (%) ' num2str(handles.PORCENTAJE) ]);

if handles.EXPORTARROI==1
    %exporta los valores a un fichero de texto
    [fname,pth] = uiputfile({'*.txt','Text File (*.txt)';'*.mat', 'M-files (*.mat)'; '*.*','All Files (*.*)'},'Save as'); % Type in name of file.
    dlmwrite([pth,fname],[handles.OUTPUT_ARENA; handles.OUTPUT_OBJ; handles.OUTPUT_ARENA_NO_OBJ; handles.PORCENTAJE],'newline','pc');  % Or choose format, etc..
    set(handles.TAG_ESTADO,'String',['Se han guardado los valores ROI']) ;
end
guidata(hObject,handles);
% --- Executes on button press in EXPORTAR_VAL_ROI.
function EXPORTAR_VAL_ROI_Callback(hObject, eventdata, handles)
handles.EXPORTARROI=get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in TAG_EXPORTARVALORESTIEMPO.
function TAG_EXPORTARVALORESTIEMPO_Callback(hObject, eventdata, handles)
handles.EXPORTARVECTORTIEMPOS=get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in TAG_EXPORTAR_MALLADOVAL.
function TAG_EXPORTAR_MALLADOVAL_Callback(hObject, eventdata, handles)
handles.EXPORTARMALLADOVALORES=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on button press in TAG_EXPORTAR_MAPAVAL.
function TAG_EXPORTAR_MAPAVAL_Callback(hObject, eventdata, handles)
handles.EXPORTARMAPAVALORES=get(hObject,'Value');
guidata(hObject,handles);
