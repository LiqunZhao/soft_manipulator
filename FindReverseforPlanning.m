function [p12,p23,p34]=FindReverseforPlanning(A,n)
a30=A(1,1);
b30=A(1,2);
c30=A(1,3);
s=0;
for a1 = 20:n:300
    for b1 = 20:n:300
        for c1 = -300:n:-20
            if a1>0
                f(1)=atan(b1/a1);
                if f(1)<0
                    f(1)=2*pi+f(1);
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
            %%l(1)=1/2*atan2((-2*a1^2*c1-2*b1^2*c1)/(a1^2+b1^2+c1^2)/(a1^2+b1^2)^(1/2),(-a1^2-b1^2+c1^2)/(a1^2+b1^2+c1^2))*(a1^2+b1^2+c1^2)/(a1^2+b1^2)^(1/2);
            R12 = [((cos(f(1)))^2)*(cos(-k(1)*l(1))-1)+1 sin(f(1))*cos(f(1))*(cos(-k(1)*l(1))-1) cos(f(1))*sin(k(1)*l(1)); sin(f(1))*cos(f(1))*(cos(-k(1)*l(1))-1) ((sin(f(1)))^2)*(cos(-k(1)*l(1))-1)+1 sin(f(1))*sin(k(1)*l(1));-cos(f(1))*sin(k(1)*l(1)) -sin(f(1))*sin(k(1)*l(1)) cos(-k(1)*l(1))];
            for a2 = 20:n:300
                for b2 = 20:n:300
                    for c2 = -300:n:-20
                        s = s+1;
                        if a2>0
                            f(2)=atan(b2/a2);
                            if f(2)<0
                                f(2)=2*pi+f(2);
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
                        %%l(2)=1/2*atan2((-2*a2^2*c2-2*b2^2*c2)/(a2^2+b2^2+c2^2)/(a2^2+b2^2)^(1/2),(-a2^2-b2^2+c2^2)/(a2^2+b2^2+c2^2))*(a2^2+b2^2+c2^2)/(a2^2+b2^2)^(1/2);
                        R23 = [((cos(f(2)))^2)*(cos(-k(2)*l(2))-1)+1 sin(f(2))*cos(f(2))*(cos(-k(2)*l(2))-1) cos(f(2))*sin(k(2)*l(2)); sin(f(2))*cos(f(2))*(cos(-k(2)*l(2))-1) ((sin(f(2)))^2)*(cos(-k(2)*l(2))-1)+1 sin(f(2))*sin(k(2)*l(2));-cos(f(2))*sin(k(2)*l(2)) -sin(f(2))*sin(k(2)*l(2)) cos(-k(2)*l(2))];
                        p12 = [a1;b1;c1];
                        p23 = [a2;b2;c2];
                        p3 = p12+R12*p23;
                        p4 = [a30;b30;c30];
                        pp = p4-p3;
                        q=det(R12);
                        w=det(R23);
                        invvR23 = inv(R23);
                        invvR12 = inv(R12);
                        p34 = invvR23*invvR12*pp;
                        a3 = p34(1,1);
                        b3 = p34(2,1);
                        c3 = p34(3,1);
                        if a3>0
                            f(3)=atan(b3/a3);
                            if f(3)<0
                               f(3)=2*pi+f(3);
                            end
                        end
                        if a3<0
                            f(3)=atan(b3/a3)+pi;
                        end
                        %%f(3)=atan2(b3/(a3^2+b3^2)^(1/2),a3/(a3^2+b3^2)^(1/2));
                        k(3)=2*(a3^2+b3^2)^(1/2)/(a3^2+b3^2+c3^2);
                        L(1,s) = (1/k(1)) + (1/k(2)) + (1/k(3));
                        A1(1,s) = p12(1,1);
                        B1(1,s) = p12(2,1);
                        C1(1,s) = p12(3,1);
                        A2(1,s) = p23(1,1);
                        B2(1,s) = p23(2,1);
                        C2(1,s) = p23(3,1);
                        A3(1,s) = p34(1,1);
                        B3(1,s) = p34(2,1);
                        C3(1,s) = p34(3,1);
                        K1(1,s) = k(1);
                        K2(1,s) = k(2);
                        K3(1,s) = k(3);
                    end
                end
            end
        end
    end
end
[y,index]=sort(L);
min = y(1,1);
INDEX = index(1,1);
a1=A1(1,INDEX);
b1=B1(1,INDEX);
c1=C1(1,INDEX);
a2=A2(1,INDEX);
b2=B2(1,INDEX);
c2=C2(1,INDEX);
a3=A3(1,INDEX);
b3=B3(1,INDEX);
c3=C3(1,INDEX);
k1=K1(1,INDEX);
k2=K2(1,INDEX);
k3=K3(1,INDEX);
K=[k1;k2;k3];
p12 = [a1;b1;c1];
p23 = [a2;b2;c2];
p34 = [a3;b3;c3];
end