% 1 Завантажте кольорове зображення
colorImage = imread('peppers.png');

% 2 Перетворіть його в чорно-біле i Відобразіть результат
grayImage = rgb2gray(colorImage);

figure; subplot(1,2,1); imshow(colorImage);
title('Кольорове зображення');

subplot(1,2,2); imshow(grayImage);
title('Чорно-біле зображення');
pause;

% 3 виконайте поблочне дискретне косинусне перетворення зображень.
T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(double(grayImage), [8 8], dct);

% 4 Відобразіть результат
figure; imshow(log(abs(B)), []);
title('ДКП коефіцієнти в логарифмічному масштабі');
pause;

% 5 відновіть зображення за його ДКП-спектром
invdct = @(block_struct) T' * block_struct.data * T;
I2 = blockproc(B, [8 8], invdct);
figure; imshow(uint8(I2));
title('Відновлене зображення за ДКП-спектром');
pause;

% 6 Виконайте квантування ДКП-коефіцієнтів
N = 10; 
J = N * round(B / N);
figure; imshow(log(abs(J)), []);
title('Квантовані ДКП-коефіцієнти в логарифмічному масштабі');
pause;

% 6.1 відновіть зображення за його квант. ДКП-спектром
invdct = @(block_struct) T' * block_struct.data * T;
I2 = blockproc(J, [8 8], invdct);
figure; imshow(uint8(I2));
title('Відновлене зображення за його квант. ДКП-спектром');
pause;

% 7 Виконаєте квантування коефіцієнтів ДКП
mask = [1 1 1 1 0 0 0 0
    1 1 1 0 0 0 0 0
    1 1 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    ];
B2 = blockproc(B, [8 8], @(block_struct) mask .* block_struct.data);
figure; imshow(log(abs(B2)), []);
title('Квантовані ДКП-коефіцієнти в логарифмічному масштабі 2.0');
pause;

% 8 відновіть зображення за його квант. ДКП-спектром
invdct = @(block_struct) T' * block_struct.data * T;
I2 = blockproc(B2, [8 8], invdct);
figure; imshow(uint8(I2));
title('Відновлене зображення за його квант. ДКП-спектром 2.0');
pause;

close all;



