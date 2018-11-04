function g = enhance(f, s1, s2)
    [M, N] = size(f);
    t1 = 50;
    t2 = 230;
    g1 = zeros(M, N);
    g = im2uint8(g1);
    for i = 1:M
        for j = 1:N
            if (f(i, j) > s1 && f(i, j) < s2)
                g(i, j) = t2;
            else
                g(i, j) = t1;
            end
        end
    end
end