letters = imread('Letters.jpg');
template = imread('LettersTemplate.jpg');

letters = double(letters);
template = double(template);

original = letters;
[temph,tempw] = size(template);

letters = flip(letters,1);
letters = flip(letters,2);


convolvedIm = conv2(letters,template,'same');

figure
imagesc(convolvedIm);
colormap gray
colorbar
hold on


maxVal = max(convolvedIm(:));
[maxr,maxc] = find(convolvedIm==maxVal);

figure
imagesc(original)
colormap gray
colorbar

rectangle('Position',[maxc-tempw/2-1 maxr-temph/2-1 tempw temph],'EdgeColor','r');
