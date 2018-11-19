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

g = im2bw(f, T/255);
figure;
subplot(2, 2, 1); imshow(f); title('原图');
subplot(2, 2, 2); imhist(f); title('直方图');
subplot(2, 2, 3); imshow(g); title('全局阈值分割结果');