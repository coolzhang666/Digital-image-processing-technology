% 清理工作区间所有变量，释放内存
clear

% 清楚命令窗口内容
clc

% 使用 imread() 函数将图像读入 MATLAB 环境中
image = imread('image\cameraman.jpg');

% 使用 imshow（） 函数将图像显示在 MATLAB 桌面上
imshow(image)

image1 = imread('image\lena_Soderberg.jpg');
% image1 将会覆盖图像 image
% imshow(image1)

% 保留两张图像的方法
figure, imshow(image1)

% 将图像写入到当前目录中
% imwrite(image, 'iamge\cameraman.png')
