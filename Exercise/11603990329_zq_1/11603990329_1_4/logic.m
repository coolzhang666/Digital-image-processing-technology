function logic(a, b)
    p1 = a&(~b);
    p2 = (~a)&b;
    p3 = (~a)&(~b);
    p4 = ~(a&b);
    p5 = a|(~b);
    p6 = (~a)|b;
    p7 = (~a)|(~b);
    p8 = ~(a|b);
    p9 = xor(a, ~b);
    p10 = xor(~a, b);
    p11 = xor(~a, ~b);
    p12 = ~xor(a, b);

    figure;
    subplot(3, 4, 1); imshow(p1); title('1');
    subplot(3, 4, 2); imshow(p2); title('2');
    subplot(3, 4, 3); imshow(p3); title('3');
    subplot(3, 4, 4); imshow(p4); title('4');
    subplot(3, 4, 5); imshow(p5); title('5');
    subplot(3, 4, 6); imshow(p6); title('6');
    subplot(3, 4, 7); imshow(p7); title('7');
    subplot(3, 4, 8); imshow(p8); title('8');
    subplot(3, 4, 9); imshow(p9); title('9');
    subplot(3, 4, 10); imshow(p10); title('10');
    subplot(3, 4, 11); imshow(p11); title('11');
    subplot(3, 4, 12); imshow(p12); title('12');
end