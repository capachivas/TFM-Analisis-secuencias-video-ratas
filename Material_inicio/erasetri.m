

function out=erasetri(triggers,data,ventanaenseg,Fr)
% Esta función reproduce una matriz de señales "data", eliminando fragmentos en
% los puntos temporales indicados en el vector "triggers", y de un tamaño
% en segundos especificado en "ventanaenseg". "Fr" es la frecuencia de
% muestreo, que si se obvia es de 2500Hz.

if nargin == 3
    Fr=2500;
end
cortes=[];


for i =1:numel(triggers)
cortes=[cortes,triggers(i),(triggers(i)+ventanaenseg)];
end
out=erase(cortes,data,Fr);
end

function var = erase(cortes,data,Fr)

if nargin == 2
    Fr=2500;
end
var=data;

for i=1:2:numel(cortes)-1
    j=i+1;
    a=ceil(cortes(i)*Fr)-2;
    b=ceil(cortes(j)*Fr);
    for h=1:size(data,1)
        e=a-(b-a);
        media=mean(data(h,e:a));
        var(h,a:b)=linspace(media,media,(b-a)+1);
    end
end

end

