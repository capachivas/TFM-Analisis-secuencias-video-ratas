function slidingWindows=chunkaveragevel(x,nwind,FRAMES)
%nwind cantidad de muestras con las que hago la media
% x=ones(4,15) % los canales van por filas
%# compute indices
nx= length(x);
idx = bsxfun(@plus, (1:nwind)', 1+(0:(fix(nx/nwind)-1))*nwind)-1 ;
quedan=nx-prod(size(idx));
slidingWindows=zeros(ceil(nx/nwind));

     if quedan==0
          
         slidingWindows = mean(reshape(x(idx),nwind,[]),1);
     else
           
         slidingWindows = [mean(reshape(x(idx),nwind,[]),1) mean(x(end-(quedan-1):end))];
     end

 
 slidingWindows=slidingWindows(1:FRAMES);