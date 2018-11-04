function g = ellipseMask(b, a)
    g1 = zeros(2*a, 2*b);
    [M, N] = size(g1);
    g = im2uint8(g1);
    for i = 1:M
        for j = 1:N
            x = i - a;
            y = j - b;
            flag = (x*x)/(a*a) + (y*y)/(b*b);
            if (flag < 1)
                g(i, j) = 1;
            end
        end
    end
end