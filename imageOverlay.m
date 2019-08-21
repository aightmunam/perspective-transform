function imageSrc = imageOverlay(rows1, columns1, color1, imageSrc, rows2, columns2, color2, imageOvr)

i1=rows1;
j1=columns1;

for i2=1:rows2
    for j2=1:columns2   
        if imageOvr(i2,j2)>0
            imageSrc(i1,j1,1:color1)=imageOvr(i2,j2,1:color2);
        end     
        j1=j1+1;
    end
    i1=i1+1;
    j1=columns1;
end

end