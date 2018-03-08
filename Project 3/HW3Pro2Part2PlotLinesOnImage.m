%pro2_(ii)_lines on the original image


tryimage = zeros(11);
tryimage(1,1)=1;
tryimage(11,11)=1;
tryimage(1,11)=1;
tryimage(11,1)=1;
tryimage(6,6)=1;
imagesc(tryimage);hold on
colormap gray; 



[W,H]=size(tryimage);
[yEdge,xEdge]=find(tryimage);

A = zeros(round(2*sqrt(H^2+W^2))+1,180);


for i=1:numel(xEdge)
     theta=-90:89;
    rho = cos(theta*pi/180)*xEdge(i)+sin(theta*pi/180)*yEdge(i);


for j=1:180
    a=round(sqrt(H^2+W^2));
    A(round(rho(j))+a,j)=A(round(rho(j))+a,j)+1;
     

end

 
[maxRho,maxtheta] = find(A>2);

end
line = zeros(4,2);
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




