f = imread('image/gray_image.jpg');
[M, N] = size(f);
e = ellipseMask(N/2,M/2);
g = times(f, e);

figure;
subplot(2,1,1); imshow(f); title("原图");
subplot(2,1,2); imshow(g); title("处理后");