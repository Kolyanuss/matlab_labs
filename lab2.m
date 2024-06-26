Img = imread("eight.tif");
imshow(Img), title("Origin");
pause;
I1_noise = imnoise(Img,'gaussian',0,0.01);
I2_noise = imnoise(Img,'salt & pepper',0.02);
figure, imshow(I1_noise), title('Noisy Image 1');
figure, imshow(I2_noise), title('Noisy Image 2');
pause;
h = fspecial('average', [3 3]);
I1_filtered = imfilter(I1_noise,h);
I2_filtered = imfilter(I2_noise,h);
figure, imshow(I1_filtered), title('Filtered Image 1');
figure, imshow(I2_filtered), title('Filtered Image 2');
pause;
h2 = fspecial('laplacian');
I1_filtered2 = imfilter(I1_noise,h2);
I2_filtered2 = imfilter(I2_noise,h2);
figure, imshow(I1_filtered2), title('Filtered Image 1 with Laplacian filter');
figure, imshow(I2_filtered2), title('Filtered Image 2 with Laplacian filter');
pause;
I1_filtered3 = wiener2(I1_noise,[5 5]);
I2_filtered3 = wiener2(I2_noise,[5 5]);
figure, imshow(I1_filtered3), title('Filtered Image 1 with Wiener filter');
figure, imshow(I2_filtered3), title('Filtered Image 2 with Wiener filter');
pause;
I1_filtered4 = medfilt2(I1_noise);
I2_filtered4 = medfilt2(I2_noise);
figure, imshow(I1_filtered4), title('Filtered Image 1 with Median filter');
figure, imshow(I2_filtered4), title('Filtered Image 2 with Median filter');
pause;
close all;