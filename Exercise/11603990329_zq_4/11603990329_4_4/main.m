clear;
clc;

A = imread('image/image1.jpg');
A = A(:,:,1);
B = demo(A);
figure;imshow(A);
figure;
imhist(A);
[h, x] = hist(B(:)*512, 512);
figure; bar(x,h,'k'); title('预测误差直方图');


A = double(A);
B = double(B);
deviation = SNRrms(A,B)