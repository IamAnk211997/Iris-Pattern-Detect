

function minn = funmain(template1, mask1)

%[template1, mask1] = createiristemplate1('003_2_1.bmp');



%template1=create_pattern_temp(template);
%mask1=create_pattern_mask(mask);
scales = 2;


for person =  1:26

    image1 = strcat('person' ,num2str(person),'temp' ,'.bmp');
    
    template2 = im2bw(imread(image1));

    image2 = strcat('person' ,num2str(person),'mask' , '.bmp');
    mask2 = im2bw(imread(image2));



template1 = logical(template1);
mask1 = logical(mask1);

template2 = logical(template2);
mask2 = logical(mask2);

hd = NaN;

% shift template left and right, use the lowest Hamming distance
for shifts=-8:8

    template1s = shiftbits(template1, shifts,scales);
    mask1s = shiftbits(mask1, shifts,scales);


    mask = mask1s | mask2;

    nummaskbits = sum(sum(mask == 1));

    totalbits = (size(template1s,1)*size(template1s,2)) - nummaskbits;

    C = xor(template1s,template2);

    C = C & ~mask;
    bitsdiff = sum(sum(C==1));

    if totalbits == 0

        hd = NaN;

    else

        hd1 = bitsdiff / totalbits;

        if  hd1 < hd || isnan(hd)

            hd = hd1;

        end


    end

end

%if hd < 0.35
 %   disp('THIS EYE BELONG TO PERSON')
  %  disp(person )
m( 1 ,person) = hd ;


end
%mini=min(m)
[minval,minpos]=min(m)
if minpos<3.2
minn=minpos;
else
    minn='Eye not found';
end
disp(strcat('EYE belong to PERSON','-',num2str(minn)));
end