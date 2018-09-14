clear
clc

% 创建一个命名（简单）函数句柄
f = @sin;

f(pi/4)
sin(pi/4)

% 创建一个匿名函数句柄
g = @(a, b) a + b;
h = @(x, y) sqrt(x.^2 + y.^2);

g(1, 5)
h(3, 4)

sinfun1(5)
sinfun2(5)
sinfun3(5)

% 对比三种方式运行时所需要的时间
M = 100;
a = @() sinfun1(M);
b = @() sinfun2(M);
c = @() sinfun3(M);

timeit(a)
timeit(b)
timeit(c)

f = twodsin1(1, 1/(4*pi), 1/(4*pi), 512, 512);
imshow(f, [ ])

% 编写一个函数，计算f(x)=sin(x/100π), 其中 x = 0,1,2，...，M-1
% 第一种形式：利用 for 循环
function y = sinfun1(M)
x = 0:M-1; % 创建一个数值数组 x = [0 1 2 3 ... M-1]
for k = 1:numel(x) % numel(x) 返回数组 x 的元素个数
    y(k) = sin(x(k) / (100*pi)); 
end
end

% 第二种形式：利用 for 循环，同时在 for 循环之前，初始化结果数组
function y = sinfun2(M)
x = 0:M-1;
y = zeros(1, numel(x));
for k = 1:numel(x)
    y(k) = sin(x(k) / (100*pi));
end
end

% 第三种形式：使用向量化消除 for 循环
function y = sinfun3(M)
x = 0:M-1;
y = sin(x ./ (100*pi));
end

% 编写一个函数，计算 f(x,y) = Asin(ux + vy)
% 第一种形式：利用循环计算
function f = twodsin1(A, u, v, M, N)
f = zeros(M, N);
for c = 1:N
    vy = v * (c-1);
    for r = 1:M
        ux = u * (r-1);
        f(r, c) = A * sin(ux + vy);
    end
end
end

% 第二种形式：向量化替代循环
function f = twodsin2(A, u, v, M, N)
c = 0:N - 1;
r = 0:M - 1;
[C, R] = meshgrid(c, r);
f = A * sin(u*R + v*C);
end