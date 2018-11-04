f = imread('image/image1.png');

w1 = [2, -1, -1; -1, 2, -1; -1, -1, 2]; % 正45度
w2 = [-1, 2, -1; -1, 2, -1; -1, 2, -1]; % 垂直
w3 = [-1, -1, -1; 2, 2, 2; -1, -1, -1]; % 水平
w4 = [-1, -1, 2; -1, 2, -1; 2, -1, -1]; % 负45度
g = imfilter(tofloat(f), w1);
g1 = imfilter(tofloat(f), w2);
g2 = imfilter(tofloat(f), w3);
g3 = imfilter(tofloat(f), w4);

figure;
subplot(3, 2, 1); imshow(f); title('原始图像');
subplot(3, 2, 2); imshow(g); title('正45度');
subplot(3, 2, 3); imshow(g1); title('垂直');
subplot(3, 2, 4); imshow(g2); title('水平');
subplot(3, 2, 5); imshow(g3); title('负45度');