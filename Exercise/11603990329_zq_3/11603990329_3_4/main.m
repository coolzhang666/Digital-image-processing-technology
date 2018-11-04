f = imread('image/image.png');

count = 0;
T = mean2(f);
done = false;
while ~done
    count = count + 1;
    g = f > T;
    Tnext = 0.5*(mean(f(g)) + mean(f(~g)));
    done = abs(T - Tnext) < 0.5;
    T = Tnext;
end
g1 = im2bw(f, T/255);

[T, SM] = graythresh(f);

g2 = im2bw(f, T);

f1 = tofloat(f);
[Tf, SMf] = graythresh(f1);
g3 = im2bw(f1, Tf);

[g4, NR, SI, TI] = regiongrow(f, 1, 0.26);

figure;
subplot(2, 3, 1); imshow(f); title('原始图像');
subplot(2, 3, 2); imshow(g1); title('全局阈值处理方法');
subplot(2, 3, 3); imshow(g2); title('Otsu方法');
subplot(2, 3, 4); imshow(g3); title('拉普拉斯算子边缘改进的全局阈值');
subplot(2, 3, 5); imshow(TI); title('区域生长法');