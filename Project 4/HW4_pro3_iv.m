crowd = imread('crowd.jpg');
template = imread('face1.jpeg');
template2 = imread('face2.jpeg');
template3 = imread('face3.jpeg');
original = crowd;
crowd = double(rgb2gray(crowd));
template = double(rgb2gray(template));
template2 = double(rgb2gray(template2));
template3 = double(rgb2gray(template3));

[temph,tempw] = size(template);
[temph2,tempw2] = size(template2);
[temph3,tempw3] = size(template3);

corrIm = normxcorr2(template,crowd);
corrIm2 = normxcorr2(template2,crowd);
corrIm3 = normxcorr2(template3,crowd);

threshold = 0.59* max(corrIm(:));
threshold2 = 0.75* max(corrIm2(:));
threshold3 = 0.74* max(corrIm3(:));

[maxr,maxc] = find(corrIm>threshold);
[maxr2,maxc2] = find(corrIm2>threshold2);
[maxr3,maxc3] = find(corrIm3>threshold3);


imagesc(original)
colormap gray;hold on
colorbar

for i = 1:numel(maxc)
rectangle('Position',[maxc(i)-size(template,2)+1 maxr(i)-size(template,1)+1 tempw temph],'EdgeColor','r');
end

for j = 1:numel(maxc2)
rectangle('Position',[maxc2(j)-size(template2,2)+1 maxr2(j)-size(template2,1)+1 tempw2 temph2],'EdgeColor','g');
end

for k = 1:numel(maxc3)
rectangle('Position',[maxc3(k)-size(template3,2)+1 maxr3(k)-size(template3,1)+1 tempw3 temph3],'EdgeColor','b');
end
