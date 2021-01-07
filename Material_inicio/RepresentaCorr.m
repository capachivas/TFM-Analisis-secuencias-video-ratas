function RepresentaCorr(x,y)

figure('color','w','position',[100 100 1400 300]);
% subplot(1,3,1)
imagesc(x,[0 0.6])
set(gca,'YDir','normal')
colorbar
xlabel('electrodo 2','FontSize',14)
ylabel('electrodo 1','FontSize',14)
title('Coherencia media ','FontSize',14)

figure('color','w','position',[100 100 1400 300]);
% subplot(1,3,1)
imagesc(y,[0 0.25])
set(gca,'YDir','normal')
colorbar
xlabel('electrodo 2','FontSize',14)
ylabel('electrodo 1','FontSize',14)
title('Desviacion Coherencia ','FontSize',14)