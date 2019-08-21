%This script will find the homography between 4 points and their repsective
%projection 

%These points are for vertex of a square in world cordinate system, the
%lengh of square is 150

clc;
aud = imread('Audrey.jpg');
imshow(aud);

[rows,columns] = size(aud);

for i=1:rows
    for j=1:columns
        if(aud(i,j) == 0)
           aud(i,j) = aud(i,j)+1;
        end
    end
end


x0=0;
y0=0;

x1=0;
y1=507;

x2=499;
y2=0;

x3=499;
y3=507;

x1m=249;
y1m=0;

x2m=249;
y2m=506;

x3m=0;
y3m=253;

x4m=499;
y4m=253;

%The projected position of points
xp0=186;
yp0=153;

xp1=184;
yp1=464;

xp2=346;
yp2=174;

xp3=344;
yp3=433;

x1mp=266;
y1mp=164;

x2mp=264;
y2mp=448;

x3mp=186;
y3mp=308;

x4mp=345;
y4mp=303;
 

fprintf('Estimated homography matrix is:')
H=homography(x0,y0, x1,y1, x2,y2, x3,y3,x1m, y1m, x2m, y2m, x3m, y3m, x4m, y4m, xp0, yp0, xp1, yp1, xp2, yp2, xp3, yp3,x1mp, y1mp, x2mp, y2mp, x3mp, y3mp, x4mp, y4mp)


tform = projective2d(H);
J = imwarp(aud, tform, 'SmoothEdges', true);
imshow(J);


frm = imread('Frame.jpg');

[rows2, columns2, jk] = size(J);
[rows1, columns1, ab] = size(frm);

r1 = 154;
c1 = 186;
r2 = r1 + rows2 - 1;
r2 = min([r2 rows1]);
c2 = c1 + columns2 - 1;
c2 = min([c2, columns1]);


frm = imageOverlay(r1, c1, ab, frm, rows2, columns2, jk, J);

imshow(frm);


