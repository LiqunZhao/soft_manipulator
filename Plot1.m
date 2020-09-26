function Plot1(A)
l1=A(1,1);
l2=A(1,2);
l3=A(1,3);
d=1;
%3个几何参数
k=2*((l1^2+l2^2+l3^2-l1*l2-l2*l3-l1*l3)^0.5)/(d*(l1+l2+l3));
l=(l1+l2+l3)/3;
Q=l*k
fi=atan((3^0.5)/3*(l3+l2-2*l1)/(l2-l3));
  if fi>0
     if l2>l1
         fi=fi;
      else
          fi=fi-pi;
      end
  else       
if l3<l1
         fi=fi;
     else
          fi=fi+pi;
     end
  end       
 fi

%末端坐标
a=cos(fi)*(1-cos(l*k))/k;
b=sin(fi)*(1-cos(l*k))/k;
c=-sin(l*k)/k;

%求圆心
[x,y,z]=solve('x^2+y^2+z^2=(1/k)^2','(x-a)^2+(y-b)^2+(z-c)^2=(1/k)^2','y=x*tan(fi)','x','y','z');
x=eval(x);
y=eval(y);
z=eval(z);
 if abs(z(2,1))>abs(z(1,1))
     v=1;
 else
     v=2;
 end
 x=x(v,1);
 y=y(v,1);
 z=z(v,1);
 [x y z]
 
%求中间点
 if c>0
   z1=0;
   [x1,y1]=solve('(x1-x)^2+(y1-y)^2+(z1-z)^2==(1/k)^2','y1=x1*tan(fi)','x1','y1');
   x1=eval(x1);
   y1=eval(y1);
   X1=abs(x1(1,1));
   Y1=abs(y1(1,1));
   if X1+Y1<1e-5
      v=2;
   else
       v=1;
   end
    x1=x1(v,1); 
    y1=y1(v,1);
 else   
 z1=rand(1)*(0-c)+c;
 [x1,y1]=solve('(x1-x)^2+(y1-y)^2+(z1-z)^2==(1/k)^2','y1=x1*tan(fi)','x1','y1');
 x1=eval(x1);
 y1=eval(y1);
  if x1(1,1)^2+y1(1,1)^2<x1(2,1)^2+y1(2,1)^2
     x1=x1(1,1); 
     y1=y1(1,1);
  else x1=x1(2,1);
     y1=y1(2,1);
  end
 end
 
%三个点的坐标
pos=[0 0 0; x1 y1 z1; a,b,c]

p1=pos(1,:);
p2=pos(2,:);
p3=pos(3,:);
%求半径和圆心坐标
p1p2=p2-p1;
u1=p1p2/sum(p1p2.^2);
p2p3=p3-p2;
u2=unitVec(p2p3);
normal=cross(p1p2,p2p3);
normal=unitVec(normal);
per2=cross(normal,u2);
per2=unitVec(per2);
mid1=(p1+p2)/2;
mid2=(p2+p3)/2;
dis2=sqrt(sum(p2p3.^2));
L=(vecDot(mid1,u1)-vecDot(mid2,u1))/vecDot(per2,u1);
arc_R=sqrt(L^2+1.0/4*dis2^2);
C=mid2+L*per2;
%求圆心角
vec1=p1-C;
vec1=unitVec(vec1);
vec2=p3-C;
vec2=unitVec(vec2);
theta=vecDot(vec1,vec2);
normal2=cross(vec1,vec2);
theta=acos(theta);
if c>0
theta=2*pi-theta;
end
 %if(sqrt(sum((normal-normal2).^2))>1.0e-5)
  %   theta=2*pi-theta;
 %end
theta
%计算数据点
%圆弧的局部坐标系单位向量
vx=[1,0,0];
vy=[0,1,0];
vz=[0,0,1];
v1=vec1;
v3=normal;
v2=cross(v3,v1);
v2=unitVec(v2);
%求变换矩阵
r11=vecDot(v1,vx);r12=vecDot(v2,vx);r13=vecDot(v3,vx);
r21=vecDot(v1,vy);r22=vecDot(v2,vy);r23=vecDot(v3,vy);
r31=vecDot(v1,vz);r32=vecDot(v2,vz);r33=vecDot(v3,vz);
Tr=[r11,r12,r13,0;
    r21,r22,r23,0;
    r31,r32,r33,0;
    0,0,0,1];
Tt=[1,0,0,C(1);
    0,1,0,C(2);
    0,0,1,C(3);
    0,0,0,1];
%局部坐标系数据点的坐标
t=0:(theta)/200:theta;
x1=arc_R*cos(t);
y1=arc_R*sin(t);
z1=t*0;
pt=[x1;y1;z1;ones(size(x1))];
%局部坐标表达变换到基坐标表达
pt=Tt*Tr*pt;

%画图
tubemesh([pt(1,:)',pt(2,:)',pt(3,:)'],1);
%plot3(pt(1,:),pt(2,:),pt(3,:), 'LineWidth',1);
shading interp;
light
lighting gouraud 
axis vis3d
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
hold off
view(-37.5,30)

grid on

end