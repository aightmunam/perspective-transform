%This script will find the homography between 4 points and their repsective
%projection 

%These points are for vertex of a square in world cordinate system, the
%lengh of square is 150

clc;
wht = imread('White knight.jpg');

[rows,columns] = size(wht);

for i=1:rows
    for j=1:columns
        if(wht(i,j) == 0)
           wht(i,j) = wht(i,j)+1;
        end
    end
end



x0=0;
y0=0;

x1=0;
y1=276;

x2=182;
y2=0;

x3=182;
y3=276;

x1m=91;
y1m=0;

x2m=91;
y2m=276;

x3m=0;
y3m=138;

x4m=182;
y4m=138;


%The projected position of points
xp0=708;
yp0=151;

xp1=710;
yp1=330;

xp2=870;
yp2=132; 

xp3=872;
yp3=325;

x1mp=788;
y1mp=141;

x2mp=791;
y2mp=327;

x3mp=707;
y3mp=240;

x4mp=872;
y4mp=228;





fprintf('Estimated homography matrix is:')
H=homography(x0,y0, x1,y1, x2,y2, x3,y3,x1m, y1m, x2m, y2m, x3m, y3m, x4m, y4m, xp0, yp0, xp1, yp1, xp2, yp2, xp3, yp3,x1mp, y1mp, x2mp, y2mp, x3mp, y3mp, x4mp, y4mp)



%We project the point (x2 y2) by H and we should get (xp2 yp2)
projected_point=[x2 y2 1] * H;
tform = projective2d(H);
J = imwarp(wht,tform,'SmoothEdges', true);
imshow(J)

frm = imread('FAST_lhr.jpg');

[rows2, columns2, jk] = size(J);
[rows1, columns1, ab] = size(frm);

r1 = 134;
c1 = 709;
r2 = r1 + rows2 - 1;
r2 = min([r2 rows1]);
c2 = c1 + columns2 - 1;
c2 = min([c2, columns1]);

frm = imageOverlay(r1, c1, ab, frm, rows2, columns2, jk, J);
imshow(frm)

