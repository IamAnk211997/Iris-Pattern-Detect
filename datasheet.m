clc;
clear all;
close all;

for i=1001:1004
    for j=1:3
     m=strcat(num2str(i),'0',num2str(j));   
     fna = strcat('F:\code_done\ankitdata\ndata\',m,'.bmp');
     [image,mask] = createiristemplate1(fna);
     c1 = mat2cell(image,[16,16,16,16],[45,45,45,45,45,45,45,45]);

    for i1111=1:4
        for j1111=1:8
                s(i1111,j1111)=(sum(sum(c1{i1111,j1111})))/(16);
        end
    end
    
        for ia=1:12
            B=s(:);
            B(ia)=B';
        end
    end
end



