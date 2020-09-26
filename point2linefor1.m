function [fi,theta,l] = point2linefor1(B)
a=B(1,1);
b=B(1,2);
c=B(1,3);
%求弯曲平面角
if a>0
    fi=atan(b/a);
    if fi<0
        fi = 2*pi+fi;
    end
end
if a<0
    fi=atan(b/a)+pi;
end
%求曲率和半径
k=2*((a^2+b^2)^0.5)/(a^2+b^2+c^2);
r=1/k;
%求圆心角
if c>0
    theta=acos(1-k*((a^2+b^2)^0.5));
else
    theta=2*pi-acos(1-k*((a^2+b^2)^0.5));
end
l=r*theta;
% %求圆心
% C = [r*cos(fi) r*sin(fi) 0];
% 
% %绘制圆弧
% vx=[1,0,0];
% vy=[0,1,0];
% vz=[0,0,1];
% v1=-C;
% v1=unitVec(v1);
% if c >0
% v3=cross(v1,(B-C));
% else
%     v3=cross(v1,(C-B));
% end
% v3=unitVec(v3);
% v2=cross(v3,v1);
% v2=unitVec(v2);
% %求变换矩阵
% r11=vecDot(v1,vx);r12=vecDot(v2,vx);r13=vecDot(v3,vx);
% r21=vecDot(v1,vy);r22=vecDot(v2,vy);r23=vecDot(v3,vy);
% r31=vecDot(v1,vz);r32=vecDot(v2,vz);r33=vecDot(v3,vz);
% Tr=[r11,r12,r13,0;
%     r21,r22,r23,0;
%     r31,r32,r33,0;
%     0,0,0,1];
% Tt=[1,0,0,C(1);
%     0,1,0,C(2);
%     0,0,1,C(3);
%     0,0,0,1];
% %局部坐标系数据点的坐标
% t=0:(theta)/200:theta;
% x1=r*cos(t);
% y1=r*sin(t);
% z1=t*0;
% pt=[x1;y1;z1;ones(size(x1))];
% %局部坐标表达变换到基坐标表达
% pt=Tt*Tr*pt;
% 
% tubemesh([pt(1,:)',pt(2,:)',pt(3,:)'],0.5);
% %plot3(pt(1,:),pt(2,:),pt(3,:), 'LineWidth',8);
% xlabel('x')
% ylabel('y')
% zlabel('z')
% 
% figure(1);
% view(-37.5,30)
% shading interp;
% light
% lighting gouraud 
% %view(2)
% 
% axis equal
% axis vis3d
    
end