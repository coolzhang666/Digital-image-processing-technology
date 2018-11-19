clear
clc

% 创建一个 3 × 3 的矩阵
A = [1 2 3; 4 5 6; 7 8 9]

% 输出第二行所有元素
A(2, :)

sum(A(:)) % A(:) 将 A 转换为列向量，然后传递给 sum 函数

% 创建与 A 相同大小的逻辑数组
D = logical([1 0 0; 0 0 1; 0 0 0])

% 提取 A 中与 D 中的 1 值元素相对应的所有元素
A(D)

% 创建一个单元矩阵
C = {imread('image\lena_Soderberg_gray.jpg'), [1 2 3 4 5; 1 2 3 4 5], {'area', 'centroid'}};
C
C{3}
