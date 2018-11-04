clc;
clear;
f1 = imread('1.jpeg');
f1 = rgb2gray(f1);
g1 = histeq(f1,256);

f2 = imread('2.jpeg');
f2 = rgb2gray(f2);
g2 = histeq(f2,256);

f3 = imread('3.jpeg');
f3 = rgb2gray(f3);
g3 = histeq(f3,256);

f4 = imread('4.jpeg');
f4 = rgb2gray(f4);
g4 = histeq(f4,256);

f5 = imread('5.jpeg');
f5 = rgb2gray(f5);
g5 = histeq(f5,256);

f6 = imread('6.jpeg');
%f6 = rgb2gray(f6);
g6 = histeq(f6,256);

f7 = imread('7.jpeg');
f7 = rgb2gray(f7);
g7 = histeq(f7,256);

f8 = imread('8.jpeg');
%f8 = rgb2gray(f8);
g8 = histeq(f8,256);

f9 = imread('9.jpeg');
%f9 = rgb2gray(f9);
g9 = histeq(f9,256);

f10 = imread('10.jpeg');
%f10 = rgb2gray(f10);
g10 = histeq(f10,256);

subplot(5,4,1);imshow(f1);title('原始图像');
subplot(5,4,2);imshow(g1);title('直方图均衡化后的图像');
subplot(5,4,3);imshow(f2);title('原始图像');
subplot(5,4,4);imshow(g2);title('直方图均衡化后的图像');
subplot(5,4,5);imshow(f3);title('原始图像');
subplot(5,4,6);imshow(g3);title('直方图均衡化后的图像');
subplot(5,4,7);imshow(f4);title('原始图像');
subplot(5,4,8);imshow(g4);title('直方图均衡化后的图像');
subplot(5,4,9);imshow(f5);title('原始图像');
subplot(5,4,10);imshow(g5);title('直方图均衡化后的图像');
subplot(5,4,11);imshow(f6);title('原始图像');
subplot(5,4,12);imshow(g6);title('直方图均衡化后的图像');
subplot(5,4,13);imshow(f7);title('原始图像');
subplot(5,4,14);imshow(g7);title('直方图均衡化后的图像');
subplot(5,4,15);imshow(f8);title('原始图像');
subplot(5,4,16);imshow(g8);title('直方图均衡化后的图像');
subplot(5,4,17);imshow(f9);title('原始图像');
subplot(5,4,18);imshow(g9);title('直方图均衡化后的图像');
subplot(5,4,19);imshow(f10);title('原始图像');
subplot(5,4,20);imshow(g10);title('直方图均衡化后的图像');

figure;
subplot(5,4,1);imhist(f1);ylim('auto');title('原图直方图');
subplot(5,4,2);imhist(g1);ylim('auto');title('均衡化直方图');
subplot(5,4,3);imhist(f2);ylim('auto');title('原图直方图');
subplot(5,4,4);imhist(g2);ylim('auto');title('均衡化直方图');
subplot(5,4,5);imhist(f3);ylim('auto');title('原图直方图');
subplot(5,4,6);imhist(g3);ylim('auto');title('均衡化直方图');
subplot(5,4,7);imhist(f4);ylim('auto');title('原图直方图');
subplot(5,4,8);imhist(g4);ylim('auto');title('均衡化直方图');
subplot(5,4,9);imhist(f5);ylim('auto');title('原图直方图');
subplot(5,4,10);imhist(g5);ylim('auto');title('均衡化直方图');
subplot(5,4,11);imhist(f6);ylim('auto');title('原图直方图');
subplot(5,4,12);imhist(g6);ylim('auto');title('均衡化直方图');
subplot(5,4,13);imhist(f7);ylim('auto');title('原图直方图');
subplot(5,4,14);imhist(g7);ylim('auto');title('均衡化直方图');
subplot(5,4,15);imhist(f8);ylim('auto');title('原图直方图');
subplot(5,4,16);imhist(g8);ylim('auto');title('均衡化直方图');
subplot(5,4,17);imhist(f9);ylim('auto');title('原图直方图');
subplot(5,4,18);imhist(g9);ylim('auto');title('均衡化直方图');
subplot(5,4,19);imhist(f10);ylim('auto');title('原图直方图');
subplot(5,4,20);imhist(g10);ylim('auto');title('均衡化直方图');