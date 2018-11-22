clear;
clc;

% 读取图像
f = imread('image/I类/KW507.jpg');

% 灰度图
g = rgb2gray(f);

% 2值图像
g1 = imbinarize(g, 0.5);

% 去掉过大和过小的连通区域
g2 = imopen(g1, strel('rectangle', [6, 6]));
g3 = removeLageArea(g2, 140000);
g4 = bwareaopen(g3, 46000);

% 制作切割模板，切割车牌信息部分（去掉边框）
bg1 = imclose(g4, strel('rectangle', [200, 400]));
bg2 = imopen(bg1, strel('rectangle', [5, 800]));

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

g6 = imclose(g5, strel('rectangle', [9, 9]));

figure('NumberTitle', 'off', 'Name', 'KW507');
subplot(2, 2, 1); imshow(f); title('原始图像');
subplot(2, 2, 2); imshow(g4); title('二值化并过滤掉过大和过小区域');
subplot(2, 2, 3); imshow(bg2); title('分割模板');
subplot(2, 2, 4); imshow(g6); title('最终结果');