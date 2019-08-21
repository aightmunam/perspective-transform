function H=homography(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8,xp1,yp1,xp2,yp2,xp3,yp3,xp4,yp4,xp5,yp5,xp6,yp6,xp7,yp7,xp8,yp8)
%This function will find the homography betweeb 4 points using svd


A=[
x1  y1  1   0    0    0   -x1*xp1   -y1*xp1   -xp1;
 0    0    0 x1   y1  1   -x1*yp1   -y1*yp1   -yp1;
x2  y2  1   0    0    0   -x2*xp2   -y2*xp2   -xp2;
 0    0    0 x2   y2  1   -x2*yp2   -y2*yp2   -yp2;
x3  y3  1   0    0    0   -x3*xp3   -y3*xp3   -xp3;
 0    0    0 x3   y3  1   -x3*yp3   -y3*yp3   -yp3;
x4  y4   1  0    0    0   -x4*xp4   -y4*xp4   -xp4;
 0    0    0  x4  y4  1   -x4*yp4   -y4*yp4   -yp4;
x3  y3  1   0    0    0   -x3*xp3   -y3*xp3   -xp3;
 0    0    0 x3   y3  1   -x3*yp3   -y3*yp3   -yp3;
x4  y4   1  0    0    0   -x4*xp4   -y4*xp4   -xp4;
 0    0    0  x4  y4  1   -x4*yp4   -y4*yp4   -yp4;
 x5  y5   1  0    0    0   -x5*xp5   -y5*xp5   -xp5;
 0    0    0  x5  y5  1   -x5*yp5   -y5*yp5   -yp5;
 x6  y6   1  0    0    0   -x6*xp6   -y6*xp6   -xp6;
 0    0    0  x6  y6  1   -x6*yp6   -y6*yp6   -yp6;
 x7  y7   1  0    0    0   -x7*xp7   -y7*xp7   -xp7;
 0    0    0  x7  y7  1   -x7*yp7   -y7*yp7   -yp7;
 x8  y8   1  0    0    0   -x8*xp8   -y8*xp8   -xp8;
 0    0    0  x8  y8  1   -x8*yp8   -y8*yp8   -yp8];

[U,S,V] = svd(A);
disp(S);
disp(V)
H=V(:,end);
H=reshape(H,3,3);

