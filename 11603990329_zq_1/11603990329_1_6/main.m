f = imread('image/icon.jpg');
g = rgbRotate(f, 45);
figure;
subplot(1,2,1); imshow(f); title("ԭͼ");
subplot(1,2,2); imshow(g); title("��ת��");