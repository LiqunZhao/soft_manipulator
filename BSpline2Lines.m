function [Lines] = BSpline2Lines(t,RES)
RESN = cell2mat(RES);
n = size(RESN,2);
numb = n/3;
FI = zeros(1,numb);
THETA = zeros(1,numb);
L = zeros(1,numb);
for i = 1:1:numb
    A = [RESN(3*i-2),RESN(3*i-1),RESN(3*i)];
    [fi,theta,l] = point2linefor1(A);
    FI(1,i) = fi;
    THETA(1,i) = theta;
    L(1,i) = l;
end
Lines = Config2linesfor1(FI,THETA,L,t);
end
    