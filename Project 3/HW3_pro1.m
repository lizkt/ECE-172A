function [sampling,newImage] = HW3_pro1(filename) %the newImage is the sampled and quantized image

%Ruomei Ye A99074215
pepper = imread(filename);
%subplot(1,3,1);
imshow(pepper); %this line will print the original image; 
%since this function should only return sampled and quantized images, I did
%not add this image to the output

[H,W] = size(pepper);

sampling = pepper(1,1);
for i = 1:H/10
    for j = 1:W/10
        sampling(i,j)=pepper(i*10,j*10);
        
    end
    
end
 subplot(1,2,1);
imshow(sampling); 
k=0;
newImage = uint8(zeros(size(sampling))); 
[sampleH,sampleW]=size(sampling);
while(k<255)

   for m = 1:sampleH
    for n = 1:sampleW
       if(k<sampling(m,n)&&sampling(m,n)<=k+51)
           newImage(m,n)=round((k+(k+51))/2);
       end
     end
    end
    k=k+51;
end
subplot(1,2,2);
imshow(newImage);
 

