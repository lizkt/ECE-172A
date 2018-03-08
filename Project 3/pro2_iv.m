
%Ruomei Ye A99074215

lane = imread('lane.png');
 lane = rgb2gray(lane);

 
 E= edge(lane,'sobel');

[H,W]=size(E);
[yEdge,xEdge]=find(E);
 imshow(lane); hold on
A = zeros(round(2*round(sqrt(H^2+W^2))),30);


theta=-54;  %detect the right side of the lane "\"
%theta=-54:-40;  
for i=1:numel(xEdge)
    rho = cos(theta*pi/180)*xEdge(i)+sin(theta*pi/180)*yEdge(i);
    

for j=1:1
    a=round(sqrt(H^2+W^2));
    A(round(rho(j))+a,j)=A(round(rho(j))+a,j)+1;
     
%     imagesc(A)
%     colormap gray;
end
 
[maxRho,maxtheta] = find(A>0.75*(max(A(:))));

end

line=zeros(4,2); 
for k=1:numel(maxRho)
    th = (maxtheta(k)-55)*pi/180;
    x1 = ((maxRho(k)-a)-1*sin(th))/cos(th);
    x2 = ((maxRho(k)-a)-H*sin(th))/cos(th);
    y1 = ((maxRho(k)-a)-1*cos(th))/sin(th);
    y2 = ((maxRho(k)-a)-W*cos(th))/sin(th);
    

      line(1,:)=[x1,1];  

      line(3,:)=[x2,H];  

      line(2,:)=[1,y1];  

      line(4,:)=[W,y2];  

     plot(line(:,1),line(:,2),'b');hold on


end



theta2=-125;  % find the left side of lane "/"
for i=1:numel(xEdge)
    rho = cos(theta2*pi/180)*xEdge(i)+sin(theta2*pi/180)*yEdge(i);
    

for j=1:1;
    a=round(sqrt(H^2+W^2));
    A(round(rho(j))+a,j)=A(round(rho(j))+a,j)+1;
     

end
 
[maxRho,maxtheta] = find(A>0.75*(max(A(:))));

end

line=zeros(4,2);
for k=1:numel(maxRho)
    th = (maxtheta(k)-126)*pi/180;
    x1 = ((maxRho(k)-a)-1*sin(th))/cos(th);
    x2 = ((maxRho(k)-a)-H*sin(th))/cos(th);
    y1 = ((maxRho(k)-a)-1*cos(th))/sin(th);
    y2 = ((maxRho(k)-a)-W*cos(th))/sin(th);

      line(1,:)=[x1,1];  

      line(3,:)=[x2,H];  

      line(2,:)=[1,y1];  

      line(4,:)=[W,y2];  

     plot(line(:,1),line(:,2),'b'); hold on


end

    

