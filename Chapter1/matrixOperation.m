clear
clc

% ����һ�� 3 �� 3 �ľ���
A = [1 2 3; 4 5 6; 7 8 9]

% ����ڶ�������Ԫ��
A(2, :)

sum(A(:)) % A(:) �� A ת��Ϊ��������Ȼ�󴫵ݸ� sum ����

% ������ A ��ͬ��С���߼�����
D = logical([1 0 0; 0 0 1; 0 0 0])

% ��ȡ A ���� D �е� 1 ֵԪ�����Ӧ������Ԫ��
A(D)

% ����һ����Ԫ����
C = {imread('image\lena_Soderberg_gray.jpg'), [1 2 3 4 5; 1 2 3 4 5], {'area', 'centroid'}};
C
C{3}