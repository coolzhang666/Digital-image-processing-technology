f = imread('image/gray_image.jpg');
[M, N] = size(f);
e = ellipseMask(N/2,M/2);
g = times(f, e);

figure;
subplot(2,1,1); imshow(f); title("ԭͼ");
subplot(2,1,2); imshow(g); title("�����");