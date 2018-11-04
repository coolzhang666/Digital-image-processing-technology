function g = move(f, r, c)
    [M, N] = size(f);
    g1 = zeros(M, N);
    g = im2uint8(g1);
    for i = 1:M
        for j = 1:N
            x = floor(i + r);
            y = floor(j + c);
            if(x < M && y < N)
                g(x, y) = f(i, j);
            end
        end
    end
end