function [ gabor_reout, gabor_imout ] = gabor_fn(sigma, theta, lambda, psi, gamma,image_double)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
sigma_x = sigma;
sigma_y = sigma/gamma;

nstds = 5;
xmax = max(abs(nstds*sigma_x*cos(theta)),abs(nstds*sigma_y*sin(theta)));
xmax = ceil(max(1,xmax));
ymax = max(abs(nstds*sigma_x*sin(theta)),abs(nstds*sigma_y*cos(theta)));
ymax = ceil(max(1,ymax));
xmin = -xmax; 
ymin = -ymax;
[x,y] = meshgrid(xmin:xmax,ymin:ymax);

x_theta=x*cos(theta)+y*sin(theta);
y_theta=-x*sin(theta)+y*cos(theta);

gb_r= exp(-.5*(x_theta.^2/sigma_x^2+y_theta.^2/2*sigma_y^2)).*cos(2*pi/lambda*x_theta+psi);

gb_i= exp(-.5*(x_theta.^2/sigma_x^2+y_theta.^2/2*sigma_y^2)).*sin(2*pi/lambda*x_theta+psi);
% 
% 
% exp(-(...) / (2*sigma^2))
figure; imshow(gb_r+.5); title('Gabor mask..');

gabor_reout = conv2(image_double,gb_r);

gabor_imout = conv2(image_double,gb_i);
size(gb_r)

end

