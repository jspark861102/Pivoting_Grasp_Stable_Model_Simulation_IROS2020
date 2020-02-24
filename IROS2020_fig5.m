clear all
close all
clc

%% system parameters
g = 9.81;
m = 0.15; %mass of bushing

% D = 0.030; %outer diameter
% d = 0.025; %inner diameter
% a = 0.161/2; %half of length

D = 0.034; %outer diameter
d = 0.028; %inner diameter
a = 0.068/2; %half of length

b = D/2; %half of outer diameter
w = 0.02; %width of girpper

delta = (D-d)/2 + d/2 - d/2*sin(acos(w/d)); %position of gripper in hole
% delta = (D-d)/2 + d/2 - d/2*sin(acos(w/d)) + 0.013; %position of gripper in hole
% delta = (D-d); %position of gripper in hole, duct and rail case

% for l = 0.01 : 0.01 : 2*a
% for la = 0.1 : 0.2 : 0.9
for la = [0.28] 

    l = la * 2*a;

    dataset = [];
    kset = [];

% dependent parameters
%alpha : angle between bushing and gripper
%beta : angle between ground and bushing
for alpha = 0.01 : 0.01 : pi/2
    for beta = 0 : 0.05 : pi/2   
% for alpha = pi/10
%     for beta = pi/6   

        %% control parameters
        %length between gripper in closed state
%         l = (2*a)*3/4; 
        
        % friction coefficient
        muG = 0.4;
        muS = 0.2;
        muH = 0.4;

        %% angle of moment labels
        gammaG = atan(muG);
        gammaS = atan(muS);
        gammaH = atan(muH);
        
        %% G        
        fxG1 = -sin(gammaG);
        fyG1 = cos(gammaG);
        mG1 = -cos(gammaG - beta)*a - sin(gammaG - beta)*b;

        fxG2 = sin(gammaG);
        fyG2 = cos(gammaG);
        mG2 = -cos(gammaG + beta)*a + sin(gammaG + beta)*b;

        FG1 = [mG1;fxG1;fyG1]; FG2 = [mG2;fxG2;fyG2];

        %% H
        fxH1 = -cos(gammaH - (alpha-beta));
        fyH1 = -sin(gammaH - (alpha-beta));
        mH1 = cos(alpha - gammaH)*(b-delta) + sin(alpha-gammaH)*a;

        fxH2 = -cos(gammaH + (alpha-beta));
        fyH2 =  sin(gammaH + (alpha-beta));
        mH2 = sin(alpha + gammaH)*a + cos(alpha+gammaH)*(b-delta);

        FH1 = [mH1;fxH1;fyH1]; FH2 = [mH2;fxH2;fyH2];

        %% S
        fxS1 = sin(beta + gammaS);
        fyS1 = -cos(beta + gammaS);
        mS1 = cos(gammaS)*(l - a) - sin(gammaS)*b;

        fxS2 = sin(beta - gammaS);
        fyS2 = -cos(beta - gammaS);
        mS2 = cos(gammaS)*(l - a) + sin(gammaS)*b;

        FS1 = [mS1;fxS1;fyS1]; FS2 = [mS2;fxS2;fyS2];

        %% simulation
        F = [FG1 FG2 FH1 FH2 FS1 FS2];
%         fprintf('RANK of F is %d %n', rank(F));
        % A*k <= b, Aeq*k = beq ==> k >= 1, F*k = 0
        f = [1 1 1 1 1 1];
        Aineq = -eye(6);
        if muG==0 && muS==0 && muH==0
            bineq = -ones(6,1);
            beq = [0;0;0];
        else
            bineq = zeros(6,1);
            beq = [0;0;m*g];
        end
        Aeq = F;
        beq = [0;0;m*g];
        [k,fval,flag] = linprog(f,Aineq,bineq,Aeq,beq);
%         [k,fval,flag, output] = quadprog(diag(f),zeros(6,1),Aineq,bineq,Aeq,beq);
        
        dataset = [dataset; [alpha beta flag]];
        
        if length(k) == 0
            kdata = -1*ones(6,1);
        else
            kdata = k;
        end
        kset = [kset kdata];
    end
end
[X,Y] = meshgrid([0.01 : 0.01 : pi/2]*180/pi, [0 : 0.05 : pi/2]*180/pi); %alpha가 먼저, beta가 나중
Data = reshape(dataset(:,3),length([0 : 0.05 : pi/2]),length([0.01 : 0.01 : pi/2])); %beta가 먼저, alpha가 나중

figure;surface(X,Y,Data)
xlabel('alpha (deg)')
ylabel('beta (deg)')
colorbar
title(['l =' num2str(l) 'muG =' num2str(muG) ', muH =' num2str(muH) ', muS =' num2str(muS)])

%normal case
%     eval(['X_', 'l', num2str(la*10), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '=X;']);    
%     eval(['Y_', 'l', num2str(la*10), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '=Y;']);    
%     eval(['D_', 'l', num2str(la*10), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '=Data;']);    
%     save(['l', num2str(la*10), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '.mat'],['X_', 'l', num2str(la*10), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10)],['Y_', 'l', num2str(la*10), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10)],['D_', 'l', num2str(la*10), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10)])
%     saveas(gcf,['l' num2str(la*10) 'muG' num2str(muG*10) 'muH' num2str(muH*10) 'muS' num2str(muS*10)],'png')
% 
%     save(['kset_','l', num2str(la*10), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '.mat'],'kset')
    
%specific case (la*100)    
%     eval(['X_', 'l', num2str(la*100), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '=X;']);    
%     eval(['Y_', 'l', num2str(la*100), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '=Y;']);    
%     eval(['D_', 'l', num2str(la*100), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '=Data;']);    
%     save(['l', num2str(la*100), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '.mat'],['X_', 'l', num2str(la*100), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10)],['Y_', 'l', num2str(la*100), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10)],['D_', 'l', num2str(la*100), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10)])
%     saveas(gcf,['l' num2str(la*100) 'muG' num2str(muG*10) 'muH' num2str(muH*10) 'muS' num2str(muS*10)],'png')
% 
%     save(['kset_','l', num2str(la*100), 'G', num2str(muG*10), 'H', num2str(muH*10), 'S', num2str(muS*10), '.mat'],'kset')
end    
    
    
    