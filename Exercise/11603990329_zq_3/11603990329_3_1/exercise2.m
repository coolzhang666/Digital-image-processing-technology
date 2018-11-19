f = imread('image/image1.png');
g = edge(f, 'Sobel');
g1 = edge(f, 'LoG');
g2 = edge(f, 'Canny');

figure;
subplot(2, 2, 1); imshow(f); title('原始图像');
subplot(2, 2, 2); imshow(g); title('Sobel边缘检测器');
subplot(2, 2, 3); imshow(g1); title('LoG边缘检测器');
subplot(2, 2, 4); imshow(g2); title('Canny边缘检测器');