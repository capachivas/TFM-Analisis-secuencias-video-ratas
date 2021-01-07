function a=aceleraciones(v,t,Tt)
%la aceleracion la saca a partir de la velocidad
ax=zeros(length(v),1);
ay=ax;
a=ax;
a(2:end-1,1)=(v(3:end)-v(1:end-2))/(2*Tt);