function g = MysCale(f, sc, sr)
    [M, N] = size(f);
    M1 = floor(M*sr);
    N1 = floor(N*sc);
    g1 = zeros(M1, N1);
    g = im2uint8(g1);
    for i = 1: M1
        for j = 1:N1
            x = floor(i/sr);
            y = floor(j/sc);
            if (x <= 0)
                x = 1;
            end
            if (y <= 0)
                y = 1;
            end
            if (x < M && y < N)
                g(i, j) = f(x, y);
            end
        end
    end
end