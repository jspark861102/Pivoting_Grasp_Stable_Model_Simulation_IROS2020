clear all
% close all
clc
%�Ʒ� �Ķ���� ����� ����, �ϴ� ó�� ������ �� 7�� ������ �����ϴ� �ؿ������� �����ϰ�, ���� ���� 64�� ����������� ������
%���۵Ǵ� �׷����� ���� ����� ���̱� �Ѵ�.
load kset_l9G5H4S1.mat 

Fs1 = kset(5,:);
Fs2 = kset(6,:);

for i = 1 : length(Fs1)
    if abs(Fs1(i)) <= 1e-8 
        mFs1(i) = 0;
    elseif Fs1(i) == -1
        mFs1(i) = -1;
    else
        mFs1(i) = 1;
    end
    if abs(Fs2(i)) <= 1e-8
        mFs2(i) = 0;
    elseif Fs2(i) == -1
        mFs2(i) = -1;
    else
        mFs2(i) = 1;
    end
end

data = zeros(length(Fs1),1);
for i = 1 : length(Fs1)
    if mFs1(i) == 0
        if mFs2(i) == 1
            data(i) = 1;
        end
    end
    if mFs1(i) == 1
        if mFs2(i) == 0
            data(i) = 2;
        end
    end
end

[X,Y] = meshgrid([0.01 : 0.01 : pi/2]*180/pi, [0 : 0.05 : pi/2]*180/pi); %alpha�� ����, beta�� ����
D_Fs1 = reshape(mFs1,length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2])); %beta�� ����, alpha�� ����
D_Fs2 = reshape(mFs2,length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2])); %beta�� ����, alpha�� ����
Data = reshape(data,length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2]));

% figure;surface(X,Y,D_Fs1)
% xlabel('alpha (deg)')
% ylabel('beta (deg)')
% colorbar
% % title(['l =' num2str(l) 'muG =' num2str(muG) ', muH =' num2str(muH) ', muS =' num2str(muS)])
% 
% figure;surface(X,Y,D_Fs2)
% xlabel('alpha (deg)')
% ylabel('beta (deg)')
% colorbar
% % title(['l =' num2str(l) 'muG =' num2str(muG) ', muH =' num2str(muH) ', muS =' num2str(muS)])

figure;surface(X,Y,Data)
xlabel('alpha (deg)')
ylabel('beta (deg)')
colorbar
title(['l9G6H4S4'])
