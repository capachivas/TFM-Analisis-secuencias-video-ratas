function cortotal = comparalancetas_corr_modificado(lanceta1,lanceta2)

%function [x,y,cortotal]=comparalancetas_corr(lanceta1,lanceta2)
%Esta función nos devuelve la correlación entre dos lancetas diferentes
%para cada uno de los canales
N1 = size(lanceta1,1);
N2 = size(lanceta2,1);

cortotal = zeros(N1,N2);

for k = 1:N1,
    R = corrcoef([lanceta1(k,:)' lanceta2']);
    cortotal(k,:) = R(1,2:end);
end