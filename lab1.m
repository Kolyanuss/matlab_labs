imshow('peppers.png');
figure; imshow('cameraman.tif');

img = imread('C:\Users\Kolyanys\Desktop\matcad_labs/conor-mcgregor-ka.jpg');
figure; imshow(img);

info = imfinfo('C:\Users\Kolyanys\Desktop\matcad_labs/conor-mcgregor-ka.jpg');
disp(info);

imwrite(img, 'C:\Users\Kolyanys\Desktop\KONOR_save.jpg');

figure; imhist(img);

img_adjusted = imadjust(rgb2gray(img));
figure; imshow(img_adjusted);

img_negative = imcomplement(img);
figure; imshow(img_negative);

help imadjust