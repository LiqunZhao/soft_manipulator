function [FIS,THETAS,LS] = GetConfigsforPlanning(p12,p23,p34)
d=20;
FIS = zeros(1,3);
THETAS = zeros(1,3);
LS = zeros(1,3);
a1=p12(1,1);
b1=p12(2,1);
c1=p12(3,1);
a2=p23(1,1);
b2=p23(2,1);
c2=p23(3,1);
a3=p34(1,1);
b3=p34(2,1);
c3=p34(3,1);
if a1>0
    f(1)=atan(b1/a1);
    if f(1)<0
        f(1) = 2*pi+f(1);
    end
end
if a1<0
    f(1)=atan(b1/a1)+pi;
end
%%f(1)=atan2(b1/(a1^2+b1^2)^(1/2),a1/(a1^2+b1^2)^(1/2));
k(1)=2*(a1^2+b1^2)^(1/2)/(a1^2+b1^2+c1^2);
r(1)=1/k(1);
if c1>0
    theta(1)=acos(1-k(1)*((a1^2+b1^2)^0.5));
else
    theta(1)=2*pi-acos(1-k(1)*((a1^2+b1^2)^0.5));
end
l(1)=r(1)*theta(1);
%%l(1)=abs(1/2*atan2((-2*a1^2*c1-2*b1^2*c1)/(a1^2+b1^2+c1^2)/(a1^2+b1^2)^(1/2),(-a1^2-b1^2+c1^2)/(a1^2+b1^2+c1^2))*(a1^2+b1^2+c1^2)/(a1^2+b1^2)^(1/2));
% [l1,l2,l3]=solve('k(1)=2*((l1^2+l2^2+l3^2-l1*l2-l2*l3-l1*l3)^0.5)/(d*(l1+l2+l3))','l(1)=(l1+l2+l3)/3','f(1)=atan((3^0.5)/3*(l3+l2-2*l1)/(l2-l3))','l1','l2','l3');
% l1 = eval(l1);
% l2 = eval(l2);
% l3 = eval(l3);
% if tan(f(1))>0
%     if a1>0
%         if l3(1,1)+l2(1,1)-2*l1(1,1)>0
%             j=1;
%         else
%             j=2;
%         end
%     else
%         if l3(1,1)+l2(1,1)-2*l1(1,1)>0
%             j=2;
%         else
%             j=1;
%         end
%     end
% else
%     if a1>0
%         if l2(1,1)-l3(1,1)>0
%             j=1;
%         else
%             j=2;
%         end
%     else
%         if l2(1,1)-l3(1,1)>0
%             j=2;
%         else
%             j=1;
%         end
%     end
% end           
% l1=l1(j,1);
% l2=l2(j,1);
% l3=l3(j,1);
if a2>0
    f(2)=atan(b2/a2);
    if f(2)<0
        f(2) = 2*pi+f(2);
    end
end
if a2<0
    f(2)=atan(b2/a2)+pi;
end
%%f(2)=atan2(b2/(a2^2+b2^2)^(1/2),a2/(a2^2+b2^2)^(1/2));
k(2)=2*(a2^2+b2^2)^(1/2)/(a2^2+b2^2+c2^2);
r(2)=1/k(2);
if c2>0
    theta(2)=acos(1-k(2)*((a2^2+b2^2)^0.5));
else
    theta(2)=2*pi-acos(1-k(2)*((a2^2+b2^2)^0.5));
end
l(2)=r(2)*theta(2);
%%l(2)=abs(1/2*atan2((-2*a2^2*c2-2*b2^2*c2)/(a2^2+b2^2+c2^2)/(a2^2+b2^2)^(1/2),(-a2^2-b2^2+c2^2)/(a2^2+b2^2+c2^2))*(a2^2+b2^2+c2^2)/(a2^2+b2^2)^(1/2));
% [l4,l5,l6]=solve('k(2)=2*((l4^2+l5^2+l6^2-l4*l5-l5*l6-l4*l6)^0.5)/(d*(l4+l5+l6))','l(2)=(l4+l5+l6)/3','f(2)=atan((3^0.5)/3*(l6+l5-2*l4)/(l5-l6))','l4','l5','l6');
% l4=eval(l4);
% l5=eval(l5);
% l6=eval(l6);
% if tan(f(2))>0
%     if a2>0
%         if l6(1,1)+l5(1,1)-2*l4(1,1)>0
%             j=1;
%         else
%             j=2;
%         end
%     else
%         if l6(1,1)+l5(1,1)-2*l4(1,1)>0
%             j=2;
%         else
%             j=1;
%         end
%     end
% else
%     if a>0
%         if l5(1,1)-l6(1,1)>0
%             j=1;
%         else
%             j=2;
%         end
%     else
%         if l5(1,1)-l6(1,1)>0
%             j=2;
%         else
%             j=1;
%         end
%     end
% end           
% l4=l4(j,1);
% l5=l5(j,1);
% l6=l6(j,1);
if a3>0
    f(3)=atan(b3/a3);
    if f(3)<0
        f(3) = 2*pi+f(3);
    end
end
if a3<0
    f(3)=atan(b3/a3)+pi;
end
%%f(3)=atan2(b3/(a3^2+b3^2)^(1/2),a3/(a3^2+b3^2)^(1/2));
k(3)=2*(a3^2+b3^2)^(1/2)/(a3^2+b3^2+c3^2);
r(3)=1/k(3);
if c3>0
    theta(3)=acos(1-k(3)*((a3^2+b3^2)^0.5));
else
    theta(3)=2*pi-acos(1-k(3)*((a3^2+b3^2)^0.5));
end
l(3)=r(3)*theta(3);
%%l(3)=abs(1/2*atan2((-2*a3^2*c3-2*b3^2*c3)/(a3^2+b3^2+c3^2)/(a3^2+b3^2)^(1/2),(-a3^2-b3^2+c3^2)/(a3^2+b3^2+c3^2))*(a3^2+b3^2+c3^2)/(a3^2+b3^2)^(1/2));
% [l7,l8,l9]=solve('k(3)=2*((l7^2+l8^2+l9^2-l7*l8-l8*l9-l7*l9)^0.5)/(d*(l7+l8+l9))','l(3)=(l7+l8+l9)/3','f(3)=atan((3^0.5)/3*(l9+l8-2*l7)/(l8-l9))','l7','l8','l9');
% l7=eval(l7);
% l8=eval(l8);
% l9=eval(l9);
% if tan(f(3))>0
%     if a3>0
%         if l9(1,1)+l8(1,1)-2*l7(1,1)>0
%             j=1;
%         else
%             j=2;
%         end
%     else
%         if l9(1,1)+l8(1,1)-2*l7(1,1)>0
%             j=2;
%         else
%             j=1;
%         end
%     end
% else
%     if a3>0
%         if l8(1,1)-l9(1,1)>0
%             j=1;
%         else
%             j=2;
%         end
%     else
%         if l8(1,1)-l9(1,1)>0
%             j=2;
%         else
%             j=1;
%         end
%     end
% end           
% l7=l7(j,1);
% l8=l8(j,1);
% l9=l9(j,1);
FIS = [f(1),f(2),f(3)];
THETAS = [theta(1),theta(2),theta(3)];
LS = [l(1),l(2),l(3)];
% A=[l1,l2,l3;l4,l5,l6;l7,l8,l9];
end