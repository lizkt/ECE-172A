function Gmag = HW4_pro1(filename,threshold)

geisel = imread(filename);
geisel = double(rgb2gray(geisel));

k_gaussian = 1/159 * [2 4 5 4 2;4 9 12 9 4;5 12 15 12 5;4 9 12 9 4;2 4 5 4 2];
smoothImage = conv2(geisel,k_gaussian,'same');
figure
imshow(uint8(smoothImage));
title('smoothImage')
hold on



kx = [-1 0 1;-2 0 2;-1 0 1];
ky = [-1 -2 -1;0 0 0;1 2 1];
Gx = conv2(smoothImage,kx,'same');
Gy = conv2(smoothImage,ky,'same');
Gmag = sqrt(Gx.^2+Gy.^2);
Gtheta = atan2d(Gy,Gx);
Gtheta = round(Gtheta./45)*45;

figure 
imshow(uint8(Gmag));
title('gradient magnitude iamge')
hold on

[height,width]=size(Gmag); %h=476,w=640
for i=2:height-1
    for j=2:width-1
       if Gtheta(i,j)==0 || Gtheta(i,j)==180 || Gtheta(i,j)==-180
           W = Gmag(i,j-1);
           E = Gmag(i,j+1);
           if Gmag(i,j)<=W||Gmag(i,j)<=E  %Gmag(i,j)<max(W,E)
               Gmag(i,j)=0;
             
           end
       end
       if Gtheta(i,j)==45 || Gtheta(i,j)==-135
           SW = Gmag(i+1,j-1);
           NE = Gmag(i-1,j+1);
           if Gmag(i,j)<=SW || Gmag(i,j)<=NE
               Gmag(i,j)=0;
           end
       end
       if Gtheta(i,j)==135||Gtheta(i,j)==-45
           NW = Gmag(i-1,j-1);
           SE = Gmag(i+1,j+1);
           if Gmag(i,j)<=NW ||Gmag(i,j)<=SE
               Gmag(i,j)=0;
           end     
      
       end
       if Gtheta(i,j)==90||Gtheta(i,j)==-90
           N = Gmag(i-1,j);
           S = Gmag(i+1,j);
           if Gmag(i,j)<=S ||Gmag(i,j)<=N
               Gmag(i,j)=0;
           end
       end
    
    end
end

Gmag = Gmag.*(Gmag>threshold);
figure
imshow(uint8(Gmag))
title('non-maximumn supression image with threshold')
