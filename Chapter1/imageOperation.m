% �������������б������ͷ��ڴ�
clear

% ������������
clc

% ʹ�� imread() ������ͼ����� MATLAB ������
image = imread('image\cameraman.jpg');

% ʹ�� imshow���� ������ͼ����ʾ�� MATLAB ������
imshow(image)

image1 = imread('image\lena_Soderberg.jpg');
% image1 ���Ḳ��ͼ�� image
% imshow(image1)

% ��������ͼ��ķ���
figure, imshow(image1)

% ��ͼ��д�뵽��ǰĿ¼��
% imwrite(image, 'iamge\cameraman.png')
