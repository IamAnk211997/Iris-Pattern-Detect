% createiristemplate - generates a biometric template from an iris in
%                      an eye image.

% Usage: 
% [template, mask] = createiristemplate(eyeimage_filename)

% Arguments:
%	eyeimage_filename   - the file name of the eye image

% Output:
%	template		    - the binary iris biometric template
%	mask			    - the binary iris noise mask


function [imagewithcircles,imagewithnoise2] = createiristemplate(eyeimage_filename)

%normalisation parameters
radial_res = 64;
angular_res = 360;

%feature encoding parameters
nscales=1;
minWaveLength=18;
mult=1; 
sigmaOnf=0.5;

eyeimage = imread(eyeimage_filename); 
%eyeimage=eyeimage_filename;
%%savefile = [eyeimage_filename,'-houghpara.mat'];
%savefile = [eyeimage_filename,'-houghpara.mat'];
%%[stat,mess]=fileattrib(savefile);

% %if stat == 1
    % if this file has been processed before
    % then load the circle parameters and
    % noise information for that file.
  % load(savefile);
    
% %%else
    
    % if this file has not been processed before
    % then perform automatic segmentation and
    % save the results to a file
    
    [circleiris circlepupil imagewithnoise] = segmentiris(eyeimage);
  %%  save(savefile,'circleiris','circlepupil','imagewithnoise');
    
%%end

% WRITE NOISE IMAGE
imagewithnoise2 = uint8(imagewithnoise);
imagewithcircles = uint8(eyeimage);

%get pixel coords for circle around iris
[x,y] = circlecoords([circleiris(2),circleiris(1)],circleiris(3),size(eyeimage));
ind2 = sub2ind(size(eyeimage),double(y),double(x)); 

%get pixel coords for circle around pupil
[xp,yp] = circlecoords([circlepupil(2),circlepupil(1)],circlepupil(3),size(eyeimage));
ind1 = sub2ind(size(eyeimage),double(yp),double(xp));


% Write noise regions
imagewithnoise2(ind2) = 255;
imagewithnoise2(ind1) = 255;

% Write circles overlayed
imagewithcircles(ind2) = 255;
imagewithcircles(ind1) = 255;

% WRITE SEGMENTED IMAGE AND IMAGE WITH NOISE REGION
%imwrite(imagewithnoise2,[eyeimage_filename,'-noise.bmp'],'bmp');
%imwrite(imagewithcircles,[eyeimage_filename,'-segmented.bmp'],'bmp');
%imwrite(imagewithnoise2,[eyeimage,'-noise.bmp'],'bmp');
%imwrite(imagewithcircles,[eyeimage,'-segmented.bmp'],'bmp');
% perform normalisation


[polar_array noise_array] = normaliseiris(imagewithnoise, circleiris(2),...
    circleiris(1), circleiris(3), circlepupil(2), circlepupil(1), circlepupil(3),eyeimage_filename, radial_res, angular_res);


% WRITE NORMALISED PATTERN AND NOISE PATTERN
%imwrite(polar_array,[eyeimage_filename,'-polar.bmp'],'bmp');
%imwrite(noise_array,[eyeimage_filename,'-polarnoise.bmp'],'bmp');
%imwrite(polar_array,[eyeimage,'-polar.bmp'],'bmp');
%imwrite(noise_array,[eyeimage,'-polarnoise.bmp'],'bmp');

% perform feature encoding
[template mask] = encode(polar_array, noise_array, nscales, minWaveLength, mult, sigmaOnf); 

% WRITE TEMPLATE PATTERN AND MASK PATTERN
%imwrite(template,[eyeimage_filename,'-template.bmp'],'bmp');
%imwrite(mask,[eyeimage_filename,'-mask.bmp'],'bmp');
%imwrite(template,[eyeimage,'-template.bmp'],'bmp');
%imwrite(mask,[eyeimage,'-mask.bmp'],'bmp');

% CREATES THE PATTERN MATCHING INPUTS OF TEMPLATE AND MASK 
m_temp = create_pattern_temp(template);
m_mask = create_pattern_mask(mask);

% WRITE TEMPLATE PATTERN AND MASK PATTERN WHICH IS TO BE USED FOR ...
% CALCULATION OF HAMMING DISTANCE
%imwrite(m_mask,[eyeimage_filename,'-m_mask.bmp'],'bmp');
%imwrite(m_temp,[eyeimage,'-m_temp.bmp'],'bmp');
%imwrite(m_mask,[eyeimage,'-m_mask.bmp'],'bmp');

end

