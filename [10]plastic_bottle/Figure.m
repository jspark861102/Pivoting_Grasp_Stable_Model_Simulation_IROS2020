clear all
close all
clc

load l1G4H4S2.mat
load l3G4H4S2.mat
load l5G4H4S2.mat
load l7G4H4S2.mat
load l9G4H4S2.mat

load l85G4H4S2.mat
load l38G4H4S2.mat


k1 = zeros(size(D_l1G4H4S2));
k2 = k1; k3 = k1; k4 = k1; k5 = k1; k6 = k1;

for i = 1 : size(D_l1G4H4S2, 1)
    for j = 1 : size(D_l1G4H4S2, 2)
        
        if D_l1G4H4S2(i,j) == 1
            D_l1G4H4S2(i,j) = 6;
        elseif D_l1G4H4S2(i,j) == -2
            D_l1G4H4S2(i,j) = -0;
        end
        
        if D_l3G4H4S2(i,j) == 1
            D_l3G4H4S2(i,j) = 5;
        elseif D_l3G4H4S2(i,j) == -2
            D_l3G4H4S2(i,j) = -0;
        end
        
        if D_l5G4H4S2(i,j) == 1
            D_l5G4H4S2(i,j) = 4;
        elseif D_l5G4H4S2(i,j) == -2
            D_l5G4H4S2(i,j) = -0;
        end
        
        if D_l7G4H4S2(i,j) == 1
            D_l7G4H4S2(i,j) = 3;
        elseif D_l7G4H4S2(i,j) == -2
            D_l7G4H4S2(i,j) = -0;
        end
        
        if D_l9G4H4S2(i,j) == 1
            D_l9G4H4S2(i,j) = 2;
        elseif D_l9G4H4S2(i,j) == -2
            D_l9G4H4S2(i,j) = -0;
        end        
    end
end

mymap = [0 0 0;
    20 20 20;
    70 70 70;
    100 100 100;
    120 120 120;
    150 150 150;
    220 220 220]/255;

figure;a = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l9G4H4S2,'FaceAlpha',0.9);
hold on
b = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l7G4H4S2,'FaceAlpha',0.9);
c = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l5G4H4S2,'FaceAlpha',0.9);
d = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l3G4H4S2,'FaceAlpha',0.9);
e = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l1G4H4S2,'FaceAlpha',0.9);
xlabel('alpha (deg)')
ylabel('beta (deg)')
title('muS=2, muH=4, muG=4')
xticks([0 10 20 30 40 50 60 70 80 90])
yticks([0 10 20 30 40 50 60 70 80 90])
set(gca,'FontSize',15)
axis([0 90 0 90])
colormap(mymap)
% colorbar
a.EdgeColor = 'none';
b.EdgeColor = 'none';
c.EdgeColor = 'none';
d.EdgeColor = 'none';
e.EdgeColor = 'none';          

figure;
subplot(231)
e = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l1G4H4S2,'FaceAlpha',0.9);
title('la=0.1')
xlabel('alpha (deg)')
ylabel('beta (deg)')
xticks([0 10 20 30 40 50 60 70 80 90])
yticks([0 10 20 30 40 50 60 70 80 90])
set(gca,'FontSize',15)
axis([0 90 0 90])
% colormap(mymap)

subplot(232)
d = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l3G4H4S2,'FaceAlpha',0.9);
% title('muS=2, muH=4, muG=4')
title('la=0.3')
xlabel('alpha (deg)')
ylabel('beta (deg)')
xticks([0 10 20 30 40 50 60 70 80 90])
yticks([0 10 20 30 40 50 60 70 80 90])
set(gca,'FontSize',15)
axis([0 90 0 90])
% colormap(mymap)

subplot(233)
c = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l5G4H4S2,'FaceAlpha',0.9);
title('la=0.5')
xlabel('alpha (deg)')
ylabel('beta (deg)')
xticks([0 10 20 30 40 50 60 70 80 90])
yticks([0 10 20 30 40 50 60 70 80 90])
set(gca,'FontSize',15)
axis([0 90 0 90])
% colormap(mymap)

subplot(234)
b = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l7G4H4S2,'FaceAlpha',0.9);
title('la=0.7')
xlabel('alpha (deg)')
ylabel('beta (deg)')
xticks([0 10 20 30 40 50 60 70 80 90])
yticks([0 10 20 30 40 50 60 70 80 90])
set(gca,'FontSize',15)
axis([0 90 0 90])
% colormap(mymap)

subplot(235)
a = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l9G4H4S2,'FaceAlpha',0.9);
title('la=0.9')
xlabel('alpha (deg)')
ylabel('beta (deg)')
xticks([0 10 20 30 40 50 60 70 80 90])
yticks([0 10 20 30 40 50 60 70 80 90])
set(gca,'FontSize',15)
axis([0 90 0 90])
% colormap(mymap)





figure;
a = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l85G4H4S2,'FaceAlpha',0.9);
title('la=0.85')
xlabel('alpha (deg)')
ylabel('beta (deg)')
xticks([0 10 20 30 40 50 60 70 80 90])
yticks([0 10 20 30 40 50 60 70 80 90])
set(gca,'FontSize',20)
axis([0 90 0 90])
% colormap(mymap)

figure;
a = surface(X_l1G4H4S2,Y_l1G4H4S2,D_l38G4H4S2,'FaceAlpha',0.9);
title('la=0.38')
xlabel('alpha (deg)')
ylabel('beta (deg)')
xticks([0 10 20 30 40 50 60 70 80 90])
yticks([0 10 20 30 40 50 60 70 80 90])
set(gca,'FontSize',20)
axis([0 90 0 90])
% colormap(mymap)
            
            