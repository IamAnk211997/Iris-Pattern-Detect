clc;
clear all;
close all;

image=imread('F:\code_done\iris\coding\eye\001_1_2.bmp');
image_resize=imresize(image, [160,160]);
image_double=im2double(image_resize);


theta=3*pi/4; %either 0 or pi/4 or pi/2 or 3pi/4
lambda=3.5;
gamma=0.3;
sigma=2.8;
psi=0;




a=gaborfn12345(sigma,theta,lambda,psi,gamma);
filtered = conv2(image_double,a);

%imshow(filtered);
%title('Filtered Image..');
im=histeq(a);
figure,imshow(filtered);

theta=pi/4;
b=gaborfn12345(sigma,theta,lambda,psi,gamma);
filtered1 = conv2(image_double,b);
figure,imshow(filtered1);

c=conv2(filtered,filtered1);
figure,imshow(c);

