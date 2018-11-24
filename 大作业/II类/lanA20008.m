clear;
clc;

f = imread('../image/II类/兰A20008.jpg');

f = rgb2gray(f);
f = tofloat(f);

%滤波
g = medfilt2(f,[8,8],'symmetric');

% 转化为2值图像
%g1 = im2bw(g);
g1 = imbinarize(g, 0.46);
g1 = ~g1; %求反

% 去掉边缘部分
g2 = removeLageArea(g1, 2000);

% 开操作，去掉细微部分连接
g3 = imopen(g2, strel('rectangle', [2, 2]));

% 去掉小连通区域
g4 = bwareaopen(g3, 100);

% 制作切割模板，切割车牌信息部分（去掉边框）
bg1 = imclose(g4, strel('rectangle', [100, 100]));
bg2 = imopen(bg1, strel('rectangle', [50, 50]));

% 连通区域标记
[l, m] = bwlabel(bg2);
status = regionprops(l, 'BoundingBox');
centroid = regionprops(l, 'Centroid');


% 根据坐标进行图像分割
X = status(1).BoundingBox(1);
Y = status(1).BoundingBox(2);
width = status(1).BoundingBox(3);
height = status(1).BoundingBox(4);
g5 = imcrop(g4, [X, Y, width, height]);

g6 = bwareaopen(g5, 100);




figure('NumberTitle', 'off', 'Name', '兰A20008');
subplot(3, 3, 1); imshow(f); title('原始图像');
subplot(3, 3, 2); imshow(g); title('经过非线性滤波的图像');
subplot(3, 3, 3); imshow(g1); title('二值图像');
subplot(3, 3, 4); imshow(g2); title('去掉边缘');
subplot(3, 3, 5); imshow(g3); title('去掉细微的连接');
subplot(3, 3, 6); imshow(g4); title('中间结果');
subplot(3, 3, 7); imshow(bg2); title('切割模板');
subplot(3, 3, 8); imshow(g5); title('切割结果');
subplot(3, 3, 9); imshow(g6); title('最终结果');