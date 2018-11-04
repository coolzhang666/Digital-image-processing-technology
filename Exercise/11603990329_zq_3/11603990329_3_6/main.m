f = imread('image/image.png');

g = localthresh(f, ones(3), 8.5, 1.15, 'global');
SIG = stdfilt(f, ones(3));

figure;
subplot(1, 2, 1); imshow(f); title('原始图像');
subplot(1, 2, 2); imshow(g); title('局部统计可变阈值方法');