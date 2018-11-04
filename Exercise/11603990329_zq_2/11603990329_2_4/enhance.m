function g = enhance(f,T)
     dx = fspecial('sobel');
     dy = dx';
     dx = tofloat(dx);
     dy = tofloat(dy);
     g1 = imfilter(f,dx,'replicate');
     g2 = imfilter(f,dy,'replicate');
     gc = abs(g1)+abs(g2);
     [M,N] = size(gc);
    for x = 1:M
        for y = 1:N
            if(gc(x,y)>=T)
                g(x,y) = gc(x,y);
            else
                g(x,y) = f(x,y);
            end
        end
    end
end
   