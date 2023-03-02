clear
clc
close all
%%
load('MAB.mat')
load('msk.mat')
load('TOMO2.mat')
load('idx.mat')
C=15;
hcmp=HCal(3,15,64);%计算色标中黑色部分占比
GP=["A1","A2","A3","A4","B1","B2","B3"];
%%
for p=1:7
figure('Position',[2060,-801,1024*0.75,2048*0.75])
tiledlayout(4,2)
for k=1:8
nexttile
colormap(hcmp)
imagesc(TO{p,k},'AlphaData',msk,[-C,C]);axis off equal;%T值
colorbar
title(gnm{2}(k,:));%情绪名)

end
sgtitle(GP(p))
end
%%
hcmp=HCal(0,15,64);%计算色标中黑色部分占比
figure('Position',[1,41,2000,1000])
tiledlayout(2,4)

for k=1:4
nexttile
colormap("turbo")
imagesc(MA{2*k-1}-MB{2*k-1},'AlphaData',msk);axis off equal;%T值
colorbar
title(gnm{2}(2*k-1,:))
end

for k=1:4
nexttile
colormap("turbo")
imagesc(MA{2*k}-MB{2*k},'AlphaData',msk);axis off equal;%T值
colorbar
title(gnm{2}(2*k,:))
end
%%
function [hcmp]=HCal(thr,mxc,nmc)
nsg=round(thr/mxc*nmc);
hmp=hot(nmc-nsg);
cmp=flipud([hmp(:,3) hmp(:,2) hmp(:,1) ]);
hcmp=[cmp;zeros(2*nsg,3);hmp];
end
