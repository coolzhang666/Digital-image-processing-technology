% ��ѭ����ʽʵ����x=1-20000�ĺ���sin(x/100pi)��ֵ
function y = sinfun1(M)
    x = 0:M-1;
    for i = 1:numel(x)
        y(i) = sin(x(i)/(100*pi));
    end
end