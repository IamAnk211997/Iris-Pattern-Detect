clc;
clear all;
close all;

[image,mask] = createiristemplate1('F:\code_done\ankitdata\1001_0_1.bmp');
c1 = mat2cell(image,[16,16,16,16],[45,45,45,45,45,45,45,45]);

for i=1:4
    for j=1:8
        
        s(i,j)=(sum(sum(c1{i,j})))/(16);
       
    end
end

B=s(:);
B=B';
