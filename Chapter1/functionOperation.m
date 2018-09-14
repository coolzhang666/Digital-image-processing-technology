clear
clc

% ����һ���������򵥣��������
f = @sin;

f(pi/4)
sin(pi/4)

% ����һ�������������
g = @(a, b) a + b;
h = @(x, y) sqrt(x.^2 + y.^2);

g(1, 5)
h(3, 4)

sinfun1(5)
sinfun2(5)
sinfun3(5)

% �Ա����ַ�ʽ����ʱ����Ҫ��ʱ��
M = 100;
a = @() sinfun1(M);
b = @() sinfun2(M);
c = @() sinfun3(M);

timeit(a)
timeit(b)
timeit(c)

f = twodsin1(1, 1/(4*pi), 1/(4*pi), 512, 512);
imshow(f, [ ])

% ��дһ������������f(x)=sin(x/100��), ���� x = 0,1,2��...��M-1
% ��һ����ʽ������ for ѭ��
function y = sinfun1(M)
x = 0:M-1; % ����һ����ֵ���� x = [0 1 2 3 ... M-1]
for k = 1:numel(x) % numel(x) �������� x ��Ԫ�ظ���
    y(k) = sin(x(k) / (100*pi)); 
end
end

% �ڶ�����ʽ������ for ѭ����ͬʱ�� for ѭ��֮ǰ����ʼ���������
function y = sinfun2(M)
x = 0:M-1;
y = zeros(1, numel(x));
for k = 1:numel(x)
    y(k) = sin(x(k) / (100*pi));
end
end

% ��������ʽ��ʹ������������ for ѭ��
function y = sinfun3(M)
x = 0:M-1;
y = sin(x ./ (100*pi));
end

% ��дһ������������ f(x,y) = Asin(ux + vy)
% ��һ����ʽ������ѭ������
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

% �ڶ�����ʽ�����������ѭ��
function f = twodsin2(A, u, v, M, N)
c = 0:N - 1;
r = 0:M - 1;
[C, R] = meshgrid(c, r);
f = A * sin(u*R + v*C);
end