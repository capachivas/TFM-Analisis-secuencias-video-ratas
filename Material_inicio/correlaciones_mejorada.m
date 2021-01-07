%SCRIPT_CORR_COH_modificado.m
%Este script calcula la correlación, la coherencia en 3 bandas y las 
%desviaciones estándar en cada caso, entre todos los canales de ambos lados
%% Set environment

function [Media_coh_controlDELTA SD_coh_controlDELTA Media_coh_controlTHETA SD_coh_controlTHETA Media_coh_controlGAMMA SD_coh_controlGAMMA]=correlaciones_mejorada(registros,R1,R2,TINI,t_ctrl,w,Fs,Fbands)

% t_ctrl=40;  %tamaño de la etapa de control %Si no trabajas con LTP, modifica el programa eliminando los tiempo de LTP y LTP3h de cada sitio y en t_ctrl trabaja con la duración de tu registro
% t_LTP=40;   %tamaño de la etapa de LTP
% t_LTP3h=40; %tamaño de la etapa de LTP+3h
% Fbands = [0 2.5; 2.5 8; 32 64]; % bandas delta, theta y gamma  INICIALES


%% Leer datos

LFP_Lado1 = registros;
LFP_Lado2 = registros;

%% DECLARACIÓN MATRICES
W = round(w*Fs);
INI=(1:W)+TINI*Fs;
% data_LTP_e1=[];
% data_LTP3h_e1=[];

% data_control_e2=[];
% data_LTP_e2=[];
% data_LTP3h_e2=[];

corrcontrol=[];
% corrLTP=[];
% corrLTP3h=[];

%FRAGMENTACIÓN DATOS EN VENTANAS
a = floor(t_ctrl/w);
% b = floor(t_LTP/w);
% c = floor(t_LTP3h/w);

data_control_e1=zeros(a,size(LFP_Lado1,1),W);
data_control_e2=zeros(a,size(LFP_Lado2,1),W);
corrcontrol=zeros(a,size(LFP_Lado2,1),size(LFP_Lado2,1));

% %determinar size de estas tres que no esta aun
% cohcontrolDELTA=size(corrcontrol);
% cohcontrolTHETA=size(corrcontrol);
% cohcontrolGAMMA=size(corrcontrol);
for k = 1:a
    data_control_e1(k,:,:) = LFP_Lado1(:, (k-1)*W + INI);
    data_control_e2(k,:,:) = LFP_Lado2(:, (k-1)*W + INI);
end

%% CÁLCULO CORRELACIÓN


for i=1:a
    corrcontrol(i,:,:) = comparalancetas_corr_modificado_mejorada(squeeze(data_control_e1(i,:,:)),squeeze(data_control_e2(i,:,:)));
end

%% CÁLCULO MEDIA Y DESVIACIÓN ESTÁNDAR DE LA CORRELACIÓN

Media_corr_control = squeeze(mean(corrcontrol,1));
SD_corr_control = squeeze(std(corrcontrol,[],1));

%% REPRESENTACIÓN
% 

% RepresentaCorr(Media_corr_control,SD_corr_control)


%%

%CÁLCULO COHERENCIA (DELTA)

for i=1:a
    cohcontrolDELTA(i,:,:)=comparalancetas_coh_modificado_mejorada(squeeze(data_control_e1(i,:,:)),squeeze(data_control_e2(i,:,:)),Fs,Fbands(1,1),Fbands(1,2));
end

%%
%CÁLCULO MEDIA Y DESVIACIÓN ESTÁNDAR DE LA CORRELACIÓN

Media_coh_controlDELTA = squeeze(mean(cohcontrolDELTA,1));
SD_coh_controlDELTA = squeeze(std(cohcontrolDELTA,[],1));

Media_coh_controlDELTA=Media_coh_controlDELTA(R1,R2);
SD_coh_controlDELTA=SD_coh_controlDELTA(R1,R2);

%% REPRESENTACIÓN

% RepresentaCorr(Media_coh_controlDELTA,SD_coh_controlDELTA)


%%

%CÁLCULO COHERENCIA (THETA)

for i=1:a
    cohcontrolTHETA(i,:,:)=comparalancetas_coh_modificado_mejorada(squeeze(data_control_e1(i,:,:)),squeeze(data_control_e2(i,:,:)),Fs,Fbands(2,1),Fbands(2,2));
end

%%
%CÁLCULO MEDIA Y DESVIACIÓN ESTÁNDAR DE LA CORRELACIÓN

Media_coh_controlTHETA = squeeze(mean(cohcontrolTHETA,1));
SD_coh_controlTHETA = squeeze(std(cohcontrolTHETA,[],1));

Media_coh_controlTHETA=Media_coh_controlTHETA(R1,R2);
SD_coh_controlTHETA=SD_coh_controlTHETA(R1,R2);
%% REPRESENTACIÓN

% RepresentaCorr(Media_coh_controlTHETA,SD_coh_controlTHETA)


%%
%CÁLCULO COHERENCIA (GAMMA)

for i=1:a
    cohcontrolGAMMA(i,:,:)=comparalancetas_coh_modificado_mejorada(squeeze(data_control_e1(i,:,:)),squeeze(data_control_e2(i,:,:)),Fs,Fbands(3,1),Fbands(3,2));
end

%%
%CÁLCULO MEDIA Y DESVIACIÓN ESTÁNDAR DE LA CORRELACIÓN

Media_coh_controlGAMMA = squeeze(mean(cohcontrolGAMMA,1));
SD_coh_controlGAMMA = squeeze(std(cohcontrolGAMMA,[],1));

Media_coh_controlGAMMA=Media_coh_controlGAMMA(R1,R2);
SD_coh_controlGAMMA=SD_coh_controlGAMMA(R1,R2);

%% REPRESENTACIÓN
% 
% RepresentaCorr(Media_coh_controlGAMMA,SD_coh_controlGAMMA)

