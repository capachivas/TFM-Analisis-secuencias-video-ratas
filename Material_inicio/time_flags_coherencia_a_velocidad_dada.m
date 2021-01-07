function [time_flags] = time_flags_coherencia_a_velocidad_dada(velocidad_tiempo, igual_mayor_menor, velocidad_dada, tensiones, registro_1, registro_2,Fs,FreqBands)
%saca la coherencia entre los dos registros para el intervalo temporal en
%el que la velocidad cumple la condicion

%registro_1, registro_2: (escalar del 1 al 31)
%velocidad_dada: valor velocidad referencia en cm/s
%igual_mayor_menor: 0-->igual, 1-->mayor, 2-->menor 
%Matriz de velocidades que sale del GUI

fichero_velocidad_tiempo=load(velocidad_tiempo);
VELOCIDAD=fichero_velocidad_tiempo.VELOCIDAD;
TIEMPOS=fichero_velocidad_tiempo.TIEMPOS;

%EJEMPLO: time_flags_coherencia_a_velocidad_dada(fichero, 0, 35, 10, 28)
%Coherencia entre registros 10 y 28 cuando la velocidad sea 35 cm/s
LENGTH=size(tensiones,2)
Tregistro=(LENGTH-1)*(1/Fs); %duracion del registro
Tr=0:1/Fs:Tregistro;
% plot(TIEMPOS,VELOCIDAD)

switch(igual_mayor_menor)
    case 0 %No esta claro si la media seria lo mejor
        Indices=find(VELOCIDAD==velocidad_dada)
    case 1 %maximo sera mejor comparar la MAX
        Indices=find(VELOCIDAD>velocidad_dada)
    case 2 %minimo sera mejor comparar la MIN     
        Indices=find(VELOCIDAD<velocidad_dada)
end

time_flags=Tr(Indices); % Valores temporales correspondientes a los indices donde se da CONDICION
Tanalisis=Tr(max(Indices))-Tr(min(Indices)) %cojo desde el instante inicial donde se da la condicion hasta el instante final
TINI=Tr(min(Indices));
ventana= Tanalisis/10;
[Media_coh_controlDELTA SD_coh_controlDELTA Media_coh_controlTHETA SD_coh_controlTHETA Media_coh_controlGAMMA SD_coh_controlGAMMA]=correlaciones_mejorada(tensiones,registro_1,registro_2,TINI,Tanalisis,ventana,Fs,FreqBands)

