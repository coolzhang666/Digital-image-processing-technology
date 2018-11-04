T = 0.6;
f = imread('cameraman.jpg');
A=fspecial('average',3); %生成系统预定义的3X3滤波器
%g1 = medfilt2(f,[3,3]);
f = tofloat(f);
g1=filter2(A,f);%平滑后的图像  
g = enhance(g1,T);
subplot(1,3,1);imshow(f);title('原始图像');
subplot(1,3,2);imshow(g1);title('平滑后的图像');
subplot(1,3,3);imshow(g);title('增强后的图像');