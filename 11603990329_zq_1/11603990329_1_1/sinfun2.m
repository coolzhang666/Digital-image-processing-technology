% 用矩阵方式实现求x=1-20000的函数sin(x/100pi)的值
function y = sinfun2(M)
    x = 0:M;
    y = sin(x ./ (100*pi));
end