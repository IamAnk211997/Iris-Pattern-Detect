name = '640_480_260_136_162324.bmp'        
img_Path = strcat('F:\C#.Net\win64\Sample Executable\',name);
         I = imread(img_Path);
         I = rgb2gray(I);
         imwrite(I,img_Path);
         verify(img_Path);
         