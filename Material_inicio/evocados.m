

function data=evocados(triggers,data,ventanaenseg,Fr)
% Esta funcion elimina los evocados de los registros electrofisiológicos
cortes=zeros(1,length(triggers));
cortes(1:2:2*length(triggers))=zeros(1,length(1:2:2*length(triggers)))+triggers';
cortes(2:2:2*length(triggers))=ones(1,length(2:2:2*length(triggers)))*ventanaenseg+triggers';
a=ceil(cortes(1:2:length(cortes)-1)*Fr)-2;
b=ceil(cortes(2:2:length(cortes))*Fr);
E=a-(b-a);
[CHANNELS, LENGTH]=size(data);

for i=1:length(a)
    for k=1:CHANNELS
        medias(i)=mean(data(k,E(i):a(i)));
        data(k,a(i):b(i))=linspace(medias(i),medias(i),(b(i)-a(i))+1);
    end
end
end


