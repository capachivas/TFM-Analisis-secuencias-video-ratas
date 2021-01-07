function coherenmedia=comparalancetas_coh_modificado(lanceta1,lanceta2,fs,f1,f2)

%function [x,y,coherenmedia]=comparalancetas_coh(lanceta1,lanceta2)
%Esta función nos devuelve la coherencia entre dos lancetas diferentes
%para cada uno de los canales
n=length(lanceta1(:,1));
coh=zeros(n,n,((2^round(log2(length(lanceta1(1,:))/4))/2)+1)); %(nfft/2+1)

for i=1:n
    for j=1:n
        coh(i,j,:)=mscohere(lanceta1(i,:),lanceta2(j,:));
    end
end

l1=length(coh(1,1,:));

inicio=ceil(f1*(l1/(fs/2)));
final=ceil(f2*(l1/(fs/2)));
if f1==0
    inicio=1;
end
coherencia_f=coh(:,:,inicio:final);

for i=1:n
    for j=1:n
        coherenmedia(i,j)=abs(mean(coherencia_f(i,j,:)));
    end
end