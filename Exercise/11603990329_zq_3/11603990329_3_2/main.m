f = imread('image/image.png');

g1 = edge(f, 'Sobel');
g2 = edge(f, 'LoG');
g3 = edge(f, 'Canny');

figure;
subplot(2, 2, 1); imshow(f); title('原始图像');
subplot(2, 2, 2); imshow(g1); title('Sobel边缘检测器');
subplot(2, 2, 3); imshow(g2); title('LoG边缘检测器');
subplot(2, 2, 4); imshow(g3); title('Canny边缘检测器');

[H, theta, rho] = hough(g3, 'ThetaResolution', 0.2);
imshow(H, [], 'XData', theta, 'YData', rho, 'InitialMagnification', 'fit');
axis on, axis normal;
xlabel('\theta'), ylabel('\rho');

peaks = houghpeaks(H, 5);
hold on;
plot(theta(peaks(:, 2)), rho(peaks(:, 1)), 'linestyle', 'none', 'marker', 's', 'color', 'w');

lines = houghlines(g3, theta, rho, peaks);
figure, imshow(g3), hold on;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'lineWidth', 4, 'Color', [.8 .8 .8]);
end