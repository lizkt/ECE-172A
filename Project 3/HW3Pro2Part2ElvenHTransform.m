%pro2_(ii)_Hough transform


% "tryimage" is the 11*11 image with five non-zero values
tryimage = zeros(11);
tryimage(1,1)=1;
tryimage(11,11)=1;
tryimage(1,11)=1;
tryimage(11,1)=1;
tryimage(6,6)=1;
% imagesc(tryimage);
% hold on 
% colormap gray; 
%these three lines above  will show original 11*11 image


[W,H]=size(tryimage);
[yEdge,xEdge]=find(tryimage);

A = zeros(round(2*sqrt(H^2+W^2))+1,180);


for i=1:numel(xEdge)
     theta=-90:89;
    rho = cos(theta*pi/180)*xEdge(i)+sin(theta*pi/180)*yEdge(i);
    

for j=1:180
    a=round(sqrt(H^2+W^2));
    A(round(rho(j))+a,j)=A(round(rho(j))+a,j)+1;
    
    
    x = linspace(-90,90,9);
    y = linspace(-a,a,5);
    imagesc(x,y,A)
    colormap gray;hold on
   
end
[maxRho,maxtheta] = find(A>2);
 

end
title('HW3 pro2 part1 HT');
colorbar
xlabel('theta');
ylabel('rho');

