f = imread('image/pic020201A.tif');
g = move(f, 20, 20);
figure;
subplot(2,2,1); imshow(f); title('ԭʼͼ��');
subplot(2,2,2); imshow(g); title('ƽ�ƺ�ͼ��');
a = imsubtract(f, g);
subplot(2,2,3); imshow(a); title('f-g');
b = imdivide(f, g);
subplot(2,2,4); imshow(b); title('f/g');
