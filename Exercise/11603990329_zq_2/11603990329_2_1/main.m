f = imread('images/image1.jpg');

s1 = 100;
s2 = 170;

% 默认处理
g = enhance(f, s1, s2);
% 同时增大S1， S2
g1 = enhance(f, s1+30, s2+30);
% 同时减小S1，S2
g2 = enhance(f, s1-30, s2-30);
% 增大S1，减小S2
g3 = enhance(f, s1+30, s2-30);
% 减小S1，增大S2
g4 = enhance(f, s1-30, s2+30);

figure;
subplot(2, 3, 1); imshow(f); title("原始图像");
subplot(2, 3, 2); imshow(g); title("默认处理");
subplot(2, 3, 3); imshow(g1); title("ͬ同时增大s1，s2");
subplot(2, 3, 4); imshow(g2); title("ͬ同时减小s1，s2");
subplot(2, 3, 5); imshow(g3); title("增大s1减小s2");
subplot(2, 3, 6); imshow(g4); title("减小s1增大s2");