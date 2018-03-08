%Ruomei Ye A99074215
%plot the lines on the original image


lane = imread('lane.png');
lane = rgb2gray(lane);

 
 E= edge(lane,'sobel');
% imshow(E);hold on  
% this line is used to show the binary edge image of 'lane'

[H,W]=size(E);
[yEdge,xEdge]=find(E);
% imshow(lane);  hold on  %this line will plot the original picture
A = zeros(round(2*round(sqrt(H^2+W^2))),180);


theta=-90:89;
for i=1:numel(xEdge)
    rho = cos(theta*pi/180)*xEdge(i)+sin(theta*pi/180)*yEdge(i);
    

for j=1:180
    a=round(sqrt(H^2+W^2));
    A(round(rho(j))+a,j)=A(round(rho(j))+a,j)+1;
     
 
end
 
% [maxRho,maxtheta] = find(A>0.75*(max(A(:))));

end
   x = linspace(-90,90,9);
    y = linspace(-a,a,100);
    imagesc(x,y,A)
    colormap gray;
title('HW3 pro2 part3 HT');
colorbar
xlabel('theta');
ylabel('rho');


