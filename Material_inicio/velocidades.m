function v=velocidades(xi,yi,t,Tt)
%script que calcula la velocidad a partir de las coordenadas extraidas del Tracker
vx=zeros(length(xi),1);
vy=vx;
vx(2:end-1,1)=(xi(3:end)-xi(1:end-2))/(2*Tt);
vy(2:end-1,1)=(yi(3:end)-yi(1:end-2))/(2*Tt);
v=sqrt(vx.^2+vy.^2); %cm/s (las medidas son en cm)