f = imread('image/image1.png');

w1 = [2, -1, -1; -1, 2, -1; -1, -1, 2]; % 正45度
w2 = [-1, 2, -1; -1, 2, -1; -1, 2, -1]; % 垂直
w3 = [-1, -1, -1; 2, 2, 2; -1, -1, -1]; % 水平
w4 = [-1, -1, 2; -1, 2, -1; 2, -1, -1]; % 负45度
g = exercise1(f, w4);
imshow(g);