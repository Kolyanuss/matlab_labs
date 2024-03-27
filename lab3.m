% 1. Завантажити з бібліотеки MATLAB тестове зображення.
I = imread('cameraman.tif');

% 2. Відобразити вихідні зображення на екрані ПК.
figure, imshow(I), title('Початкове зображення');

% 3. Здійснити процедуру перекручення зображення змінюючи параметри LEN і THETA.
LEN = 15; % Довжина розмиття
THETA = 0; % Кут розмиття
motionBlur = fspecial('motion', LEN, THETA);
blurred = imfilter(I, motionBlur, 'conv', 'circular');

% 4. Відобразити перекручене зображення.
figure, imshow(blurred), title('Перекручене зображення');

% 5. Виконати процедуру відновлення зображення.
restored = deconvwnr(blurred, motionBlur);

% 6. Відобразити зображення після відновлення.
figure, imshow(restored), title('Відновлене зображення');

% 7. Виконати зашумлення початкового зображення та повторити пункти 2-6.
noisy = imnoise(I, 'gaussian', 0.0001);
figure, imshow(noisy), title('noisy зображення');

blurred = imfilter(noisy, motionBlur, 'conv', 'circular');

figure, imshow(blurred), title('Перекручене noisy зображення');

restored = deconvwnr(blurred, motionBlur);

figure, imshow(restored), title('Відновлене noisy зображення');

pause;
close all;