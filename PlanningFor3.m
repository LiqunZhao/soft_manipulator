function PlanningFor3(A,B,n,TIME)
[p12,p23,p34]=FindReverseforPlanning(A,n);
[p12f,p23f,p34f]=FindReverseforPlanning(B,n);
[FIS,THETAS,LS] = GetConfigsforPlanning(p12,p23,p34);
[FISF,THETASF,LSF] = GetConfigsforPlanning(p12f,p23f,p34f);
FI1 = [FIS(1,1), FISF(1,1)];
FI2 = [FIS(1,2), FISF(1,2)];
FI3 = [FIS(1,3), FISF(1,3)];
THETA1 = [THETAS(1,1), THETASF(1,1)];
THETA2 = [THETAS(1,2), THETASF(1,2)];
THETA3 = [THETAS(1,3), THETASF(1,3)];
L1 = [LS(1,1), LSF(1,1)];
L2 = [LS(1,2), LSF(1,2)];
L3 = [LS(1,3), LSF(1,3)];
% THETA = [theta0, theta1];
% L = [l0, l1];
% TIME = [0,5];
V1 = [0,0];
ACC1 = [0,0];
V2 = [0,0];
ACC2 = [0,0];
V3 = [0,0];
ACC3 = [0,0];
[t,qfi1,vfi1,accfi1] = wucichazhiforFi(TIME,FI1,V1,ACC1);
[t,qfi2,vfi2,accfi2] = wucichazhiforFi(TIME,FI2,V1,ACC1);
[t,qfi3,vfi3,accfi3] = wucichazhiforFi(TIME,FI3,V1,ACC1);
[t,qtheta1,vtheta1,acctheta1] = wucichazhiforTheta(TIME,THETA1,V2,ACC2);
[t,qtheta2,vtheta2,acctheta2] = wucichazhiforTheta(TIME,THETA2,V2,ACC2);
[t,qtheta3,vtheta3,acctheta3] = wucichazhiforTheta(TIME,THETA3,V2,ACC2);
[t,ql1,vl1,accl1] = wucichazhiforL(TIME,L1,V3,ACC3);
[t,ql2,vl2,accl2] = wucichazhiforL(TIME,L2,V3,ACC3);
[t,ql3,vl3,accl3] = wucichazhiforL(TIME,L3,V3,ACC3);
% P1 = Config2pointfor1(qfi1,qtheta1,ql1);
% P2 = Config2pointfor1(qfi2,qtheta2,ql2);
% P3 = Config2pointfor1(qfi3,qtheta3,ql3);
Line1s = Config2linesfor1(qfi1,qtheta1,ql1,t);
Line2s = Config2linesfor2(qfi2,qtheta2,ql2,t);
Line3s = Config2linesfor3(qfi3,qtheta3,ql3,t);
mn = length(t);
for i = 1:1:mn
    if (mod(i:25) == 0 )
        LINE = [Line1s(i,:);Line2s(i,:);Line3s(i,:)];
        figure(19);
        Plot31(LINE);
        hold on;
    end
end
% [P0,m] = Lines2pointforPlanning(Lines);
% Add = zeros(1,m);
% figure(15);
% plot3(P(:,1),P(:,2),P(:,3),'-b');
% hold on;
% plot3(P0(:,1),P0(:,2),P0(:,3),'*r');
% grid on;
% hold on;
% PP0 = P-P0;
% for i = 1:1:m
%     Add(1,i) = sum(PP0(i,:).^2);
% end
% suum = sum(Add);
end