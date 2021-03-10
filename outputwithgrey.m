clc;
clear all;
close all;

[Image,Mask] = createiristemplate1('F:\code_done\ankitdata\1003_0_2.bmp');
m_mask = create_pattern_mask(Image);
