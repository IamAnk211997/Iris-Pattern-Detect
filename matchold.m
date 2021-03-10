clc;
clear all;
close all;


X=imread('F:\code_done\data\ankit_left1-template.bmp');
B=imread('F:\code_done\data\ashu_rt1-template.bmp');

A=im2bw(X);
B=im2bw(B);

c=0;
for i=1:4
    for j=1:45
     if( A(i,j)==B(i,j))
       c=c+1;
     end
    end
end




if(c>110)
    disp('matched');
else
    disp('mismatched');
end
    
    
    
