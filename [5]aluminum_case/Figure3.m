clear all
close all
clc

load kset_l9G4H4S2.mat 
FG1 = kset(1,:);
FG2 = kset(2,:);
FH1 = kset(3,:);
FH2 = kset(4,:);
FS1 = kset(5,:);
FS2 = kset(6,:);

EG1=0;EG2=0;EH1=0;EH2=0;ES1=0;ES2=0;
for i = 1 : length(FG1)
    if FG1(i) ~= -1
        EG1 = EG1 + FG1(i);
    end
    if FG2(i) ~= -1
        EG2 = EG2 + FG2(i);
    end
    if FH1(i) ~= -1
        EH1 = EH1 + FH1(i);
    end
    if FH2(i) ~= -1
        EH2 = EH2 + FH2(i);
    end
    if FS1(i) ~= -1
        ES1 = ES1 + FS1(i);
    end
    if FS2(i) ~= -1
        ES2 = ES2 + FS2(i);
    end
end
E = [EG1 EG2 EH1 EH2 ES1 ES2];
    
figure;bar(E)
% xlim([1 6])
yticks([0 1000 2000 3000 4000])
yticklabels({'0', '1e+3', '2e+3', '3e+3', '4e+3'})
xticklabels({'FG1','FG2','FH1','FH2','FS1','FS2'})
grid on
ylabel('sum of k')
title('Contribution of each unit contact wrench')
set(gca,'FontSize',15)

