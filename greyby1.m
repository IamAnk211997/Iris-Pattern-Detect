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
                s(i1111,j1111)=(sum(sum(c1{i1111,j1111})));
        end
    end
                    col=s(:);
                    col=col';
         n=str2num(m);
            switch n
               case 100101
                   A=col;
               case 100102
                   B=col;
               case 100103
                   C=col;
               case 100201
                   D=col;
               case 100202
                   E=col;
               case 100203
                   F=col;
               case 100301
                   G=col;
               case 100302
                   H=col;
               case 100303
                   I=col;
                 
               case 100401
                   J=col;
               case 100402
                   K=col;
                          
                otherwise 
                   L=col;
                   
           end
         
    end
end
 datafull={A;B;C;D;E;F;G;H;I;J;K;L};
 set=cell2mat(datafull);
 
 