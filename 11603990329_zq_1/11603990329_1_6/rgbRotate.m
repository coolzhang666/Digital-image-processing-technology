function g = rgbRotate(f, angle)
    f_r = f(:,:,1);
    f_g = f(:,:,2);
    f_b = f(:,:,3);
    [M, N] = size(f_r);
    g1_r = zeros(M, N);
    g_r = im2uint8(g1_r);
    g1_g = zeros(M, N);
    g_g = im2uint8(g1_g);
    g1_b = zeros(M, N);
    g_b = im2uint8(g1_b);
    centerx = round(M/2);
    centery = round(N/2);
    for i = 1:M
        for j = 1:N
            s = [i;j;1];
            a = [1,0,-centerx;0,1,-centery;0,0,1];
            b = [cos((angle * pi)/180),-sin((angle * pi)/180),0;sin((angle * pi)/180),cos((angle * pi)/180),0;0,0,1];
            c = [1,0,centerx;0,1,centery;0,0,1];
            e = c * (b * (a * s));
            x = round(e(1));
            y = round(e(2));
            if (x > 0 && x <= M && y > 0 && y <= N)
                g_r(x, y) = f_r(i, j);
                g_g(x, y) = f_g(i, j);
                g_b(x, y) = f_b(i, j);
            end
        end
    end
    g = cat(3, g_r, g_g, g_b);
end