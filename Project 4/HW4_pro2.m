function newImage = HW4_pro2(filename,win_size)


beach = imread(filename);
im = double(beach);
newImage = im;
%this part simply using built in function histeq() to get the HE image
figure
im2 = imread(filename); 
im2 = histeq(im2);
imshow(im2)
title('HE with built in function')
hold on
pad_size = round(win_size/2);
[h,w]=size(im);

im = padarray(im,[pad_size pad_size],'symmetric','both');

for x= pad_size :h+pad_size
    for y= pad_size :w+pad_size
        rank = 0;
         region = im(x-(round(win_size/2)-1):x+(round(win_size/2)-1),y-(round(win_size/2)-1):y+(round(win_size/2)-1));
         largerPixel = im(x,y)>region;
         rank = sum(sum(largerPixel));
%         for i=x-(round(win_size/2)-1):x+(round(win_size/2)-1)
%             for j=y-(round(win_size/2)-1):y+(round(win_size/2)-1)
%                 if im(x,y)>im(i,j)
%                     rank = rank+1;
%                 end
%             end
%         end
        newImage(x,y) = rank*255/(win_size*win_size);
    end
end
newImage = newImage(pad_size:h+pad_size,pad_size:w+pad_size);
figure
imshow(uint8(newImage))