crowd = imread('crowd.jpg');
template = imread('face1.jpeg');
original = crowd;
crowd = double(rgb2gray(crowd));
template = double(rgb2gray(template));


[temph,tempw] = size(template);


corrIm = normxcorr2(template,crowd);

maxVal = 0.59* max(corrIm(:));
[maxr,maxc] = find(corrIm>maxVal);

imagesc(original)
colormap gray; hold on
colorbar
for i = 1:numel(maxc)
rectangle('Position',[maxc(i)-size(template,2)+1 maxr(i)-size(template,1)+1 tempw temph],'EdgeColor','r');
end