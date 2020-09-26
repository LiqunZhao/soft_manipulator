R_min=17;%% please input mm
d = 0.5;
N_length=36;
N_radius=36;
N=N_length*N_radius;%% please input 
syms theta; 
u = 4*pi*10^(-7);%%element
I = 3.5;%%current
Ri = R_min+d/2:d:(R_min-d/2+d*N_radius);
R_1 = 1/R_min;

for i = 1:1:N_radius
    R_1= R_1 + 1/Ri(i);
end
    
R = round(1/(R_1/N_radius),0);
p0 = -R:1:R;%%y, the distance between two points is the X of "-R:X:R" 
z0 = -50:2:50;%%x
m = length(p0);
n = length(z0);

P = (ones(n,1)*p0/R)';%%lie same
Z = ones(m,1)*z0/R;%%hang same

z1 =50/R-Z;%% the number depends on the distance between two coils
z2 =50/R+Z;%% the number depends on the distance between two coils
z = z1;
p = abs(P);
k = (4*p./((1+p).^2+z.^2)).^0.5;
f = 1./(1-k.^2.*(sin(theta)).^2).^0.5;
e = (1-k.^2.*(sin(theta)).^2).^0.5;
F = quadv(inline(f), 0,pi/2-0.000001);
E = quadv(inline(e), 0,pi/2);
Cp1 = 1/pi*(z./p./((1+p).^2+z.^2).^0.5).*(-F+E.*(1+p.^2+z.^2)./((1-p).^2+z.^2));
Cz1 = 1/pi*(1./((1+p).^2+z.^2).^0.5).*(F+E.*(1-p.^2-z.^2)./((1-p).^2+z.^2));
Cp1(R/1+1,:) = zeros(1,n); %% the X of "R/X + 1 " is the distance

z = z2;
p = abs(P);
k = (4*p./((1+p).^2+z.^2)).^0.5;
f = 1./(1-k.^2.*(sin(theta)).^2).^0.5;
e = (1-k.^2.*(sin(theta)).^2).^0.5;
F = quadv(inline(f), 0,pi/2-0.000001);
E = quadv(inline(e), 0,pi/2);
Cp2 = 1/pi*(z./p./((1+p).^2+z.^2).^0.5).*(-F+E.*(1+p.^2+z.^2)./((1-p).^2+z.^2));
Cz2 = 1/pi*(1./((1+p).^2+z.^2).^0.5).*(F+E.*(1-p.^2-z.^2)./((1-p).^2+z.^2));
Cp2(R/1+1,:) = zeros(1,n); %% the X of "R/X + 1 " is the distance

Cp = Cp1+Cp2;
Cz = Cz1+Cz2;
C = (Cp.^2 + Cz.^2).^0.5;
B0 = N*u*I/2/R*1000*1000;%%mm-m,T-mT
B = B0*C;

figure(1)
surf(Z.*R,P.*R,B)
shading interp
mesh(Z.*R,P.*R,B)



