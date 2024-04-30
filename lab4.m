% 1. Завантажте з бібліотеки MATLAB кілька різних зображень.
img1 = imread('peppers.png');
img2 = imread('cameraman.tif');

% 2. Сформуйте й відобразіть двовимірні спектри зображень.
F1 = fft2(double(img1));
F2 = fft2(double(img2));

% Використовуємо логарифмічний масштаб для відображення спектра
figure, imshow(log(abs(F1)), []), title('Спектр peppers.png');
figure, imshow(log(abs(F2)), []), title('Спектр cameraman.tif');
pause;

% 3. Приведіть нульову частоту в спектрі до центру вікна відображення.
F1_shifted = fftshift(F1);
F2_shifted = fftshift(F2);

figure, imshow(log(abs(F1_shifted)), []), title('Спектр peppers.png з нульовою частотою в центрі');
figure, imshow(log(abs(F2_shifted)), []), title('Спектр cameraman.tif з нульовою частотою в центрі');
pause;

% 4. Відновіть зображення за його спектром.
img1_restored = ifft2(ifftshift(F1_shifted));
img2_restored = ifft2(ifftshift(F2_shifted));

figure, imshow(uint8(abs(img1_restored))), title('Відновлене зображення peppers.png');
figure, imshow(uint8(abs(img2_restored))), title('Відновлене зображення cameraman.tif');
pause;

% 5. Задайте двовимірний фільтр із параметрами [M N], sigma.
h = fspecial('gaussian', [3 3], 0.5);

% 6. Визначте вигляд частотної характеристики даного фільтра.
H = fft2(h, size(img1, 1), size(img1, 2));
H_shifted = fftshift(H);

figure, imshow(abs(H_shifted), []), title('Частотна характеристика фільтра');
pause;

% 7. Змініть параметр sigma фільтра, і повторіть п.п. 5,6.
h2 = fspecial('gaussian', [3 3], 1.0);
H2 = fft2(h2, size(img1, 1), size(img1, 2));
H2_shifted = fftshift(H2);

figure, imshow(abs(H2_shifted), []), title('Частотна характеристика фільтра з sigma = 1.0');
pause;

% 8. Виконайте фільтрацію зображень у частотній області.
G1 = H .* F1;
g1 = real(ifft2(G1));
G2 = H2 .* F1;
g2 = real(ifft2(G2));

figure, imshow(uint8(g1)), title('Фільтроване зображення peppers.png');
figure, imshow(uint8(g2)), title('Фільтроване зображення peppers.png з sigma = 1.0');
pause;

% 9. Виконайте фільтрацію зображення в області просторових змінних.
g1_spatial = imfilter(img1, h, 'symmetric', 'conv');
g2_spatial = imfilter(img1, h2, 'symmetric', 'conv');

figure, imshow(g1_spatial), title('Фільтроване зображення peppers.png в області просторових змінних');
figure, imshow(g2_spatial), title('Фільтроване зображення peppers.png в області просторових змінних з sigma = 1.0');
pause;
close all;
