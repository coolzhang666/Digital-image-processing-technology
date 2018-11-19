function toGray(f)
    f_r = f(:,:,1);
    f_g = f(:,:,2);
    f_b = f(:,:,3);

    gray = 0.2125*f_r + 0.7154*f_g + 0.0721*f_b;

    figure;
    subplot(3,2,1); imshow(f); title('原始彩色图像');
    subplot(3,2,2); imshow(f_r); title('红色分量');
    subplot(3,2,3); imshow(f_g); title('绿色分量');
    subplot(3,2,4); imshow(f_b); title('蓝色分量');
    subplot(3,2,5); imshow(gray); title('灰度图像');
end