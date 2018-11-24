clear;
clc;

% 读取图像
f = imread('../image/I类/黑G77777.jpg');

% 灰度图
g = rgb2gray(f);

% 2值图像
g1 = imbinarize(g, 0.5);

% 制作切割模板，切割车牌信息部分（去掉边框）
bg1 = imclose(g1, strel('rectangle', [100, 100]));
bg2 = imopen(bg1, strel('rectangle', [5, 105]));

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

figure('NumberTitle', 'off', 'Name', '黑G77777');
subplot(2, 2, 1); imshow(f); title('原始图像');
subplot(2, 2, 2); imshow(g1); title('二值图像');
subplot(2, 2, 3); imshow(bg2); title('分割模板');
subplot(2, 2, 4); imshow(g3); title('最终结果');