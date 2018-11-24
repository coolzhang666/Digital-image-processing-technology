clc;
clear;

% 读入图像并转换为灰度图
image = imread('../image/III类/云AU7526.jpg');
f = rgb2gray(image);

% 对原始图像进行开操作得到背景图像
s = strel('disk', 13);
i1 = imopen(f, s);

% 原始图像减去背景图像，对图像进行增强
i2 = imsubtract(f, i1);

% 边缘检测
i3 = edge(i2, 'Canny', 0.6);

% 制作切割模板，用于将车牌从整个图片中切割出来
% 对图像进行闭运算，将几个细微部分连接在一起
bg1 = imclose(i3, strel('rectangle', [50, 70]));
% 对图像进行开运算，将细微部分去掉
bg2 = imopen(bg1, strel('rectangle', [90, 90]));

% 连通区域标记
[l, m] = bwlabel(bg2);
status = regionprops(l, 'BoundingBox');
%centroid = regionprops(l, 'Centroid');
  

% 根据坐标进行图像分割
for i = 1:m
    X = status(i).BoundingBox(1);
    Y = status(i).BoundingBox(2);
    width = status(i).BoundingBox(3);
    height = status(i).BoundingBox(4);
    rato = width / height;
    if rato >= 2.6 && rato <=6
        g = imcrop(image, [X, Y, width, height]); % 切割后的图像
        break;
    end
end

% 转换为灰度图像并进行2值处理
g1 = rgb2gray(g);
g1 = imbinarize(g1, 0.6);


% 制作切割模板，切割车牌信息部分（去掉边框）
g2 = imopen(g1, strel('rectangle', [5, 5]));
g2 = bwareaopen(g2, 340);
bg3 = imclose(g2, strel('rectangle', [100, 100]));
bg4 = imopen(bg3, strel('rectangle', [5, 5]));

% 连通区域标记
[l, m] = bwlabel(bg4);
status = regionprops(l, 'BoundingBox');
centroid = regionprops(l, 'Centroid');
  

% 根据坐标进行图像分割
X = status(1).BoundingBox(1);
Y = status(1).BoundingBox(2);
width = status(1).BoundingBox(3);
height = status(1).BoundingBox(4);
g3 = imcrop(g1, [X, Y, width, height]);

g4 = bwareaopen(g3, 100);

figure('NumberTitle', 'off', 'Name', '云AU7526');
subplot(4, 3, 1); imshow(image); title('原图');
subplot(4, 3, 2); imshow(f); title('灰度图');
subplot(4, 3, 3); imshow(i1); title('图像背景');
subplot(4, 3, 4); imshow(i2); title('灰度图减去背景');
subplot(4, 3, 5); imshow(i3); title('边缘检测');
subplot(4, 3, 6); imshow(bg2); title('切割模板1');
subplot(4, 3, 7); imshow(g); title('切割后图像');
subplot(4, 3, 8); imshow(g1); title('灰度并2值化');
subplot(4, 3, 9); imshow(bg4); title('切割模板2');
subplot(4, 3, 11); imshow(g4); title('最终结果');