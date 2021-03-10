clc;
clear all;
close all;


X=imread('F:\data\ashutosh_rt1-template.bmp');
B=imread('F:\data\ashutosh_rt4-template.bmp');

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

disp(c);