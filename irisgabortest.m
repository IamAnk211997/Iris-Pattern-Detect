close all
clear all
clc


%define the five parameters
theta=3*pi/4; %either 0 or pi/4 or pi/2 or 3pi/4
            %Original    GoodResult
lambda=3.5;  %3.5           5.5
gamma= .3;   %0.3           0.3
sigma=2.8;   %2.8           2.8
psi=0;       %   0           0
[I,imagewithcircles] = createiristemplate1('F:\code_done\ankitdata\1001_0_3.bmp');

image_resize=imresize(I, [280,280]);
%image_gray=rgb2gray(image_resize);
image_double=im2double(image_resize);
figure; imshow(image_double);
[r,c] = size(image_double)

[gabor_reout1, gabor_imout]=gabor_fn(sigma, theta, lambda, psi, gamma,image_double);
%gabor_reout1 = gaborfn12345(sigma, theta, lambda, psi, gamma,image_double);
[r1,c1] = size(gabor_reout1)
gabor_reout1a = gabor_reout1((r1-r)/2+1:(r1-r)/2+r,(c1-c)/2+1:(c1-c)/2+c);  
[r2,c2] = size(gabor_reout1a)
%figure; imshow(gabor_reout1a);title('theta 3pi/4');
theta =pi/4;
[ gabor_reout3, gabor_imout ]=gabor_fn(sigma, theta, lambda, psi, gamma,image_double);

figure; imshow(gabor_reout3);title('theta pi/4');
