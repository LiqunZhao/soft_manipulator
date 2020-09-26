function [XX YY ZZ]=tubemesh(curve,r,theta,f)
% rotmesh(curve,r,theta,fun)���ڻ���Բ����
%   ����curve=[x,y,z]Ϊ�����ߣ�����x,y,zΪ���������ֱ���������ߵ���ά����
%   rΪ�뾶
%     ��rΪ����ʱ��r�ĸ���������������x�ĸ�����ͬ�������ڶ�Ӧλ��ʱ�İ뾶
%     ��rΪ����ʱ����������뾶��ͬ
%   ����thetaΪ��ת���ȣ�Ĭ��Ϊlinspace(-pi,pi,37)
%   ���funΪ��ͼ������Ĭ��Ϊ@mesh
% h=rotsurf(...)
%  ���������ͬʱ���ظ���ת��ľ��h
%
%��1������������Ϊ������x=sin(t);y=cos(t);z=t���뾶Ϊ1��Բ����
%t=linspace(0,10)'; 
%tubemesh([sin(t),cos(t),t],1) 
%xlabel('x');ylabel('y');zlabel('z');axis equal
%��2������������z=x^2+y^2
%t=[0,2.^(-2:0.2:2)]'; 
%tubemesh([t-t,t-t,t.^2],t,[],@surfc) 
%��3��
%t=linspace(0,4*pi)'; 
%tubemesh([sin(t),cos(t),-t],t*10,t/2,@surf);
%axis equal off;view(50,60);
%colormap hsv;shading interp;camlight;lighting phong;camzoom(1.8)
   
assert(nargin>=2 && nargin<=4,'�������������뿴������');
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
assert(ismatrix(curve),'����1��ʽ�����뿴������');
if size(curve,2)~=3
    curve=curve.';
end
assert(size(curve,2)==3 && size(curve,1)>1,'����1��ʽ�����뿴������');
r=squeeze(r);
if size(r,2)~=1
    curve=curve.';
end
if(length(r)==1)
    r=r*ones(size(curve,1),1);
end
assert(size(r,2)==1 && size(r,1)==size(curve,1),'����2��ʽ�����뿴������');
theta=squeeze(theta);
if size(theta,2)~=1
    theta=theta.';
end
assert(size(theta,2)==1,'����3��ʽ�����뿴������');
  
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