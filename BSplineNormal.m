function [res] = BSplineNormal(p1,p2,a)
A = [-1, 3, -3, 1;3, -6, 3, 0;-3, 0, 3, 0;1,4, 1, 0];
B = [1/6, 1 ,-1/6, 0; 0, 1, 0, 0; -1/6, 1, 1/6, 0; 0, 1/6, 1, -1/6];
C = [-1,3,-3,1;3,-6,3,0;-3,0,3,0;1,4,1,0];
D = [ 0, 1, 0, 0; -1/6, 1, 1/6, 0; 0, 1/6, 1, -1/6;0,0,1,0];
E = [-1,3,-3,1;3,-6,3,0;-3,0,3,0;1,4,1,0];
F = [ -1/6, 1, 1/6, 0; 0, 1/6, 1, -1/6;0,0,1,0;0,-1/6,1,1/6];
if ((a>=0) && (a<=1))
    tool = 1/6*[a^3, a^2, a^1, 1] * A ;
    res = tool(1,1) * p1 + tool(1,2) * p1 + tool(1,3) * p1 + tool(1,4) * p2;               
elseif ((a>1) && (a<=2))
    a = a - 1;
    tool = 1/6*[a^3, a^2, a^1, 1] * C ;
    res = tool(1,1) * p1 + tool(1,2) * p1 + tool(1,3) * p2 + tool(1,4) * p2;                                
elseif ((a>2) && (a<=3))
    a = a - 2;
    tool = 1/6*[a^3, a^2, a^1, 1] * E ;
    res = tool(1,1) * p1 + tool(1,2) * p2 + tool(1,3) * p2 + tool(1,4) * p2;
end
end