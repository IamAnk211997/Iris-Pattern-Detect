clc;
clear all;
close all;

A = zeros(4,90);
X=imread('F:\code_done\data\ankit_left1-template.bmp');
X=im2bw(X);
B=imread('F:\code_done\data\ankit_left2-template.bmp');
B=im2bw(B);

for i=1:4
    for j=1:45
            A(i,j)=X(i,j);
    end
end

for i=1:4
     for k=11:35
         A(i,k)=X(i,j);
     end
end