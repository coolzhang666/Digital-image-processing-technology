% 用循环方式实现求x=1-20000的函数sin(x/100pi)的值
function y = sinfun1(M)
    x = 0:M-1;
    for i = 1:numel(x)
        y(i) = sin(x(i)/(100*pi));
    end
end