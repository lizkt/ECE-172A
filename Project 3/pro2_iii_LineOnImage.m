%Ruomei Ye A99074215
%plot the lines on the original image


lane = imread('lane.png');
lane = rgb2gray(lane);

 
 E= edge(lane,'sobel');
% imshow(E);hold on  
% this line is used to show the binary edge image of 'lane'

[H,W]=size(E);
[yEdge,xEdge]=find(E);
imshow(lane);  hold on  %this line will plot the original picture
A = zeros(round(2*round(sqrt(H^2+W^2))),180);


theta=-90:89;
for i=1:numel(xEdge)
    rho = cos(theta*pi/180)*xEdge(i)+sin(theta*pi/180)*yEdge(i);
    

for j=1:180
    a=round(sqrt(H^2+W^2));
    A(round(rho(j))+a,j)=A(round(rho(j))+a,j)+1;
     
%     imagesc(A)
%     colormap gray;
end
 
[maxRho,maxtheta] = find(A>0.75*(max(A(:))));

end

line=zeros(4,2);
for k=1:numel(maxRho)
    x1 = ((maxRho(k)-a)-1*sin((maxtheta(k)-89)*pi/180))/cos((maxtheta(k)-89)*pi/180);
    x2 = ((maxRho(k)-a)-H*sin((maxtheta(k)-89)*pi/180))/cos((maxtheta(k)-89)*pi/180);
    y1 = ((maxRho(k)-a)-1*cos((maxtheta(k)-89)*pi/180))/sin((maxtheta(k)-89)*pi/180);
    y2 = ((maxRho(k)-a)-W*cos((maxtheta(k)-89)*pi/180))/sin((maxtheta(k)-89)*pi/180);
    line(1,:)=[x1,1];  
    line(3,:)=[x2,H];  
    line(2,:)=[1,y1];  
    line(4,:)=[W,y2];  
    plot(line(:,1),line(:,2),'b');
     

end

