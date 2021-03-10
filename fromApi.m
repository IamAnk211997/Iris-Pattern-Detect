list = dir('F:\C#.Net\win64\Sample Executable');

row = size(list);

for ctr = 3:row(1,1)
    name = list(ctr,1).name;
    len = size(name);
    len = len(1,2);
    min_len = len-3;
    name(min_len:len);
     if strcmp(name(min_len:len),'.bmp')
         img_Path = strcat('F:\C#.Net\win64\Sample Executable\',name)
         I = imread(img_Path);
         I = rgb2gray(I);
         imwrite(I,img_Path);
         verify(img_Path);
     end
end
delete(img_Path);
clear all