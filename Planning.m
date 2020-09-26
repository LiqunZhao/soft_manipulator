function Planning(A,B,TIME)
[fi0,theta0,l0] = point2linefor1(A);
[fi1,theta1,l1] = point2linefor1(B);
FI = [fi0, fi1];
THETA = [theta0, theta1];
L = [l0, l1];
% TIME = [0,5];
V1 = [0,0];
ACC1 = [0,0];
V2 = [0,0];
ACC2 = [0,0];
V3 = [0,0];
ACC3 = [0,0];
[t,qfi,vfi,accfi] = wucichazhiforFi(TIME,FI,V1,ACC1);
[t,qtheta,vtheta,acctheta] = wucichazhiforTheta(TIME,THETA,V2,ACC2);
[t,ql,vl,accl] = wucichazhiforL(TIME,L,V3,ACC3);
P = Config2pointfor1(qfi,qtheta,ql);
Lines = Config2lines(P,qfi,qtheta,ql,t);
[P0,m] = Lines2pointforPlanning(Lines);
Add = zeros(1,m);
figure(15);
plot3(P(:,1),P(:,2),P(:,3),'-b');
hold on;
plot3(P0(:,1),P0(:,2),P0(:,3),'*r');
grid on;
hold on;
PP0 = P-P0;
for i = 1:1:m
    Add(1,i) = sum(PP0(i,:).^2);
end
suum = sum(Add);
end




