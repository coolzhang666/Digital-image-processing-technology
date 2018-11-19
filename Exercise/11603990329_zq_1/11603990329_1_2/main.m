f = imread('image/icon.jpg');
g = MyScale(f(:,:,1), 50, 20);

figure;
subplot(1,2,1); imshow(f(:,:,1)); title('原始图像');
subplot(1,2,2); imshow(g); title('缩放后');