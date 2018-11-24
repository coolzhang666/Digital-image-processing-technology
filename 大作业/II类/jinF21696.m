clear;
clc;

% 读取图像
f = imread('../image/II类/晋F21696.jpg');

% 灰度图
g = rgb2gray(f);

% 2值图像
g1 = imbinarize(g);


% 制作切割模板，切割车牌信息部分（去掉边框）
g2 = imopen(g1, strel('rectangle', [3, 3]));
bg1 = imclose(g2, strel('rectangle', [100, 100]));
bg2 = imopen(bg1, strel('rectangle', [5, 5]));

% 连通区域标记
[l, m] = bwlabel(bg2);
status = regionprops(l, 'BoundingBox');
centroid = regionprops(l, 'Centroid');
  

% 根据坐标进行图像分割
X = status(1).BoundingBox(1);
Y = status(1).BoundingBox(2);
width = status(1).BoundingBox(3);
height = status(1).BoundingBox(4);
g3 = imcrop(g1, [X, Y, width, height]);

g4 = imopen(g3, strel('rectangle', [2, 2]));

figure('NumberTitle', 'off', 'Name', '晋F21696');
subplot(2, 3, 1); imshow(f); title('原始图');
subplot(2, 3, 2); imshow(g); title('灰度图');
subplot(2, 3, 3); imshow(g1); title('2值图像');
subplot(2, 3, 4); imshow(bg2); title('切割模板');
subplot(2, 3, 5); imshow(g3); title('切割后图像');
subplot(2, 3, 6); imshow(g4); title('最终结果');