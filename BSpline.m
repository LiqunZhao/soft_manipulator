function [t,RES,Lines] = BSpline(A)
[x,y] = size(A);
n = y/3;
num = 0;
T = 3 * (n - 1);
t = 0:0.3:T;
numb = size(t,2);
for i = 1:1:n
    figure(1)
    plot3(A(3*i-2),A(3*i-1),A(3*i),'or');
    hold on;
end
RES = cell(1,(numb-1));
for i = 1:1:(numb-1)
    a = mod(t(1,i),3);
    b = (t(1,i) - a)/3;
    if b == 0
        p1 = [A(1),A(2),A(3)];
        p2 = [A(4),A(5),A(6)];
        p3 = [A(7),A(8),A(9)];
        res = BSplineNormal1(p1,p2,p3,a);
    elseif b == (n-2)
        p1 = [A(3*b-2),A(3*b-1),A(3*b)];
        p2 = [A(3*b+1),A(3*b+2),A(3*b+3)];
        p3 = [A(3*b+4),A(3*b+5),A(3*b+6)];
        res = BSplineNormal2(p1,p2,p3,a);
    else
        p1 = [A(3*b-2),A(3*b-1),A(3*b)];
        p2 = [A(3*b+1),A(3*b+2),A(3*b+3)];
        p3 = [A(3*b+4),A(3*b+5),A(3*b+6)];
        p4 = [A(3*b+7),A(3*b+8),A(3*b+9)];
        res = BSplineImproved(p1,p2,p3,p4,a);
    end
    num = num + 1;
    RES{1,num} = res;
end
RESN = cell2mat(RES);
for i = 1:1:(numb-1)
    figure(1)
    plot3(RESN(3*i-2),RESN(3*i-1),RESN(3*i),'*y')
    hold on;
    grid on;
end
[Lines] = BSpline2Lines(t,RES);
end
        
