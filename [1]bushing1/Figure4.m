
D_FG1 = reshape(FG1,length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2])); %beta가 먼저, alpha가 나중
D_FG2 = reshape(FG2,length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2])); %beta가 먼저, alpha가 나중
D_FH1 = reshape(FH1,length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2])); %beta가 먼저, alpha가 나중
D_FH2 = reshape(FH2,length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2])); %beta가 먼저, alpha가 나중
D_FS1 = reshape(FS1,length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2])); %beta가 먼저, alpha가 나중
D_FS2 = reshape(FS2,length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2])); %beta가 먼저, alpha가 나중

figure;plot([0 : 0.05 : pi/2]*180/pi,D_FG1(:,31),'b')
hold on
plot([0 : 0.05 : pi/2]*180/pi,D_FG2(:,31),'r')
title('G')
legend('1','2')

figure;plot([0 : 0.05 : pi/2]*180/pi,D_FH1(:,31),'b')
hold on
plot([0 : 0.05 : pi/2]*180/pi,D_FH2(:,31),'r')
title('H')
legend('1','2')

figure;plot([0 : 0.05 : pi/2]*180/pi,D_FS1(:,31),'b')
hold on
plot([0 : 0.05 : pi/2]*180/pi,D_FS2(:,31),'r')
title('S')
legend('1','2')
