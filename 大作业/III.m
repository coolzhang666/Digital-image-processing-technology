clc;
clear;

% 读入图像并转换为灰度图
image = imread('image/3/晋A00002.jpg');
f = rgb2gray(image);

% 对原始图像进行开操作得到背景图像
s = strel('disk', 13);
i1 = imopen(f, s);

% 原始图像减去背景图像，对图像进行增强
i2 = imsubtract(f, i1);

% 边缘检测
i3 = edge(i2, 'Canny', 0.2);

% 转换为二值图像
i4 = im2bw(i3);

% 对图像进行闭运算，将几个细微部分连接在一起
bg1 = imclose(i4, strel('rectangle', [5, 10]));
% 对图像进行开运算，将细微部分去掉
bg2 = imopen(bg1, strel('rectangle', [20, 60]));

[l, m] = bwlabel(bg2);
status = regionprops(l, 'BoundingBox');
centroid = regionprops(l, 'Centroid');
  

% 根据坐标进行图像分割
for i = 1:m
    X = status(i).BoundingBox(1);
    Y = status(i).BoundingBox(2);
    width = status(i).BoundingBox(3);
    height = status(i).BoundingBox(4);
    rato = width / height;
    if rato >= 2.6 && rato <=6 && width >=20 && width <=300 && height >= 10 && height <= 150
        g = imcrop(image, [X, Y, width, height]);
        g1 = im2bw(g);
        break;
    end
end
% g = imcrop(image,[status(1).BoundingBox(1), status(1).BoundingBox(2), status(1).BoundingBox(3), status(1).BoundingBox(4)]);
% g1 = im2bw(g);

figure;
subplot(4, 3, 1); imshow(image); title('原图');
subplot(4, 3, 2); imshow(f); title('灰度图');
subplot(4, 3, 3); imshow(i1); title('图像背景');
subplot(4, 3, 4); imshow(i2); title('灰度图减去背景');
subplot(4, 3, 5); imshow(i3); title('边缘检测');
subplot(4, 3, 6); imshow(i4); title('二值图像');
subplot(4, 3, 7); imshow(bg1); title('对二值图像闭操作');
subplot(4, 3, 8); imshow(bg2); title('对二值图像开操作');
subplot(4, 3, 9); imshow(bg2); title('对图像大小进行过滤');
subplot(4, 3, 10); imshow(g); title('分割后图像');
subplot(4, 3, 11); imshow(g1); title('处理后');