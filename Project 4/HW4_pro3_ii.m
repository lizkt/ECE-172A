letters = imread('Letters.jpg');
template = imread('LettersTemplate.jpg');

letters = double(letters);
template = double(template);

original = letters;
[temph,tempw] = size(template);



corrIm = normxcorr2(template,letters);
figure
imagesc(corrIm)
colormap gray
colorbar
hold on
maxVal = max(corrIm(:));
[maxr,maxc] = find(corrIm==maxVal);
figure
imagesc(original)
colormap gray; 
colorbar
rectangle('Position',[maxc-size(template,2)+1 maxr-size(template,1)+1 tempw temph],'EdgeColor','r');
