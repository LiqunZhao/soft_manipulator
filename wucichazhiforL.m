function [t,q,v,acc] = wucichazhiforL(TIME,Q,V,ACC)

%位置和速度（a）
t0 = TIME(1,1);
t1 = TIME(1,2);
q0 = Q(1,1);
q1 = Q(1,2);
v0 = V(1,1);
v1 = V(1,2);
acc0 = ACC(1,1);
acc1 = ACC(1,2);

%利用公式（1-25）求系数
h=q1-q0;
T=t1-t0;
a0=q0;
a1=v0;
a2=(1.0/2)*acc0;
a3=(1.0/(2*T*T*T))*(20*h-(8*v1+12*v0)*T-(3*acc0-acc1)*(T*T));
a4=1.0/(2*T*T*T*T)*(-30*h+(14*v1+16*v0)*T+(3*acc0-2*acc1)*(T*T));
a5=1.0/(2*T*T*T*T*T)*(12*h-6*(v1+v0)*T+(acc1-acc0)*(T*T));
%轨迹生成
t=t0:0.05:t1;
%位置
q=a0+a1*power((t-t0),1)+a2*power((t-t0),2)+a3*power((t-t0),3)+...
    a4*power(t-t0,4)+a5*power(t-t0,5);
%速度
v=a1+2*a2*power((t-t0),1)+3*a3*power((t-t0),2)+4*a4*power(t-t0,3)+...
    5*a5*power(t-t0,4);
%加速度
acc=2*a2+6*a3*power((t-t0),1)+12*a4*power(t-t0,2)+20*a5*power(t-t0,3);
%绘图
figure(7);
plot(t,q,'r');
xlabel('time/s');
% axis([0,8,0,11])
ylabel('the value of L/m')
title('L');
grid on;
hold on;
figure(8);
% subplot(3,2,3)
plot(t,v,'b');
xlabel('time');
% axis([0,8,-1,2.5])
ylabel('velocity of the changing of L/(m/s)')
title('velocity of the changing of L');
grid on
hold on;
figure(9);
% subplot(3,2,5)
plot(t,acc,'g');
xlabel('time');
% xlabel('(a)');
ylabel('acceleration of the changing of L/(L/(s^2))')
title('acceleration of the changing of L');
grid on
hold on;
end