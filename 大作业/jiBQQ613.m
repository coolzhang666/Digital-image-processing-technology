clear;
clc;

% 读入图像
f = imread('image/II类/冀BQQ613.jpg');
% 转化为灰度图
f = rgb2gray(f);
% 转化为浮点类型
f = tofloat(f);

% 滤波
g = medfilt2(f,[2,2],'symmetric');


% 转化为2值图像
g1 = imbinarize(g, 0.45);
g2 = imopen(g1, strel('rectangle', [1, 2]));

% 制作切割模板，切割车牌信息部分（去掉边框）
g3 = bwareaopen(g2, 350);
bg1 = imclose(g3, strel('rectangle', [3, 100]));
bg2 = imopen(bg1, strel('rectangle', [15, 170]));

% 连通区域标记
[l, m] = bwlabel(bg2);
status = regionprops(l, 'BoundingBox');
centroid = regionprops(l, 'Centroid');
  

% 根据坐标进行图像分割
X = status(1).BoundingBox(1);
Y = status(1).BoundingBox(2);
width = status(1).BoundingBox(3);
height = status(1).BoundingBox(4);
g4 = imcrop(g2, [X, Y, width, height]);

% 去掉小连通区域
g5 = bwareaopen(g4, 30);


figure('NumberTitle', 'off', 'Name', '冀BQQ613');
subplot(2, 3, 1); imshow(f); title('原始图像');
subplot(2, 3, 2); imshow(g); title('转化成灰度图像并滤波');
subplot(2, 3, 3); imshow(g1); title('2值图像');
subplot(2, 3, 4); imshow(g2); title('去掉细微部分');
subplot(2, 3, 5); imshow(bg2); title('切割模板');
subplot(2, 3, 6); imshow(g5); title('最终结果');