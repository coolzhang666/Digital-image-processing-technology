f = imread('image/image.png');

g = localthresh(f, ones(9), 10.5, 0.8, 'global');
SIG = stdfilt(f, ones(9));

figure;
subplot(1, 2, 1); imshow(f); title('原始图像');
subplot(1, 2, 2); imshow(g); title('局部统计可变阈值方法');