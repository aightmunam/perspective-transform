%This script will find the homography between 4 points and their repsective
%projection 

%These points are for vertex of a square in world cordinate system, the
%lengh of square is 150

clc;
aud = imread('Thanos.jpg');

[rows,columns] = size(aud);

for i=1:rows
    for j=1:columns
        if(aud(i,j) == 0)
           aud(i,j) = aud(i,j)+1;
        end
    end
end

imshow(aud);

x0=0;
y0=0;

x1=0;
y1=240;

x2=479;
y2=0;

x3=479;
y3=240;

x1m=239;
y1m=0;

x2m=239;
y2m=240;

x3m=0;
y3m=120;

x4m=479;
y4m=120;

%The projected position of points
xp0=543;
yp0=81;

xp1=553;
yp1=474;

xp2=965;
yp2=81;

xp3=1053;
yp3=457;

x1mp=756;
y1mp=80;

x2mp=806;
y2mp=465;

x3mp=549;
y3mp=278;

x4mp=1009;
y4mp=270;
 

fprintf('Estimated homography matrix is:')
H=homography(x0,y0, x1,y1, x2,y2, x3,y3,x1m, y1m, x2m, y2m, x3m, y3m, x4m, y4m, xp0, yp0, xp1, yp1, xp2, yp2, xp3, yp3,x1mp, y1mp, x2mp, y2mp, x3mp, y3mp, x4mp, y4mp)


tform = projective2d(H);
J = imwarp(aud, tform, 'SmoothEdges', true);
%J = homography_transform(size(aud,1), size(aud,2), H, aud);

imshow(J);


frm = imread('wallframe.jpeg');

[rows2, columns2, jk] = size(J);
[rows1, columns1, ab] = size(frm);

r1 = 83;
c1 = 543;
r2 = r1 + rows2 - 1;
r2 = min([r2 rows1]);
c2 = c1 + columns2 - 1;
c2 = min([c2, columns1]);


frm = imageOverlay(r1, c1, ab, frm, rows2, columns2, jk, J);

%imshow(frm);


