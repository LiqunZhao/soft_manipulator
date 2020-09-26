function [XX YY ZZ]=tubemesh(curve,r,theta,f)
% rotmesh(curve,r,theta,fun)用于绘制圆柱面
%   矩阵curve=[x,y,z]为中轴线，其中x,y,z为列向量，分别代表中轴线的三维坐标
%   r为半径
%     当r为向量时，r的个数必须与列向量x的个数相同，代表处于对应位置时的半径
%     当r为标量时，代表各处半径相同
%   向量theta为旋转弧度，默认为linspace(-pi,pi,37)
%   句柄fun为绘图函数，默认为@mesh
% h=rotsurf(...)
%  绘制曲面的同时返回该旋转体的句柄h
%
%例1：绘制中轴线为螺旋线x=sin(t);y=cos(t);z=t，半径为1的圆柱体
%t=linspace(0,10)'; 
%tubemesh([sin(t),cos(t),t],1) 
%xlabel('x');ylabel('y');zlabel('z');axis equal
%例2：绘制抛物线z=x^2+y^2
%t=[0,2.^(-2:0.2:2)]'; 
%tubemesh([t-t,t-t,t.^2],t,[],@surfc) 
%例3：
%t=linspace(0,4*pi)'; 
%tubemesh([sin(t),cos(t),-t],t*10,t/2,@surf);
%axis equal off;view(50,60);
%colormap hsv;shading interp;camlight;lighting phong;camzoom(1.8)
   
assert(nargin>=2 && nargin<=4,'参数个数错误！请看帮助！');
if nargin<4
    f=@surf;
    if nargin<3
        theta=linspace(-pi,pi,37)';
    end
end
if isempty(theta)
    theta=linspace(-pi,pi,37)';
end
curve=squeeze(curve);
assert(ismatrix(curve),'参数1格式错误！请看帮助！');
if size(curve,2)~=3
    curve=curve.';
end
assert(size(curve,2)==3 && size(curve,1)>1,'参数1格式错误！请看帮助！');
r=squeeze(r);
if size(r,2)~=1
    curve=curve.';
end
if(length(r)==1)
    r=r*ones(size(curve,1),1);
end
assert(size(r,2)==1 && size(r,1)==size(curve,1),'参数2格式错误！请看帮助！');
theta=squeeze(theta);
if size(theta,2)~=1
    theta=theta.';
end
assert(size(theta,2)==1,'参数3格式错误！请看帮助！');
  
x=curve(:,1);
y=curve(:,2);
z=curve(:,3);
direct=diff(curve);
direct=direct./repmat(sqrt(sum(direct.^2,2)),1,3);
direct=[direct(1,:);(direct(1:end-1,:)+direct(2:end,:))/2;direct(end,:)];
direct=direct./repmat(sqrt(sum(direct.^2,2)),1,3);
sint=sin(theta);
cost=cos(theta);
  
mm=[-direct(:,2),direct(:,1)];
mm=mm./repmat(sqrt(sum(mm.^2,2)),1,2);
mm(isnan(mm))=0;
mx=mm(:,1);
my=mm(:,2);
alph = acos(direct(:,3));
cosa = cos(alph);
sina = sin(alph);
vera = 1 - cosa;
XX=zeros(length(theta),length(x));
YY=XX;
ZZ=XX;
view(3)
hold on
for k=1:length(x)
    rot = [cosa(k)+mx(k)^2*vera(k) mx(k)*my(k)*vera(k) my(k)*sina(k); ...
        mx(k)*my(k)*vera(k) cosa(k)+my(k)^2*vera(k) -mx(k)*sina(k); ...
        -my(k)*sina(k) mx(k)*sina(k) cosa(k)]';
    X=r(k)*cost;
    Y=r(k)*sint;
    Z=X-X;
    newxyz = [X,Y,Z]*rot;
       
    XX(:,k)=newxyz(:,1)+x(k);
    YY(:,k)=newxyz(:,2)+y(k);
    ZZ(:,k)=newxyz(:,3)+z(k);
end
hh=f(XX,YY,ZZ);
 if nargout==1
     h=hh;
 end