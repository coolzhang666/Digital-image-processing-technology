function [ val ] = SNRms(f, fp)
    molecule = 0;
    denominator = 0;
    [R,C] = size(f);
    for r=1:R
        for c=1:C
            molecule = molecule + fp(r,c)*fp(r,c);
            denominator = denominator + (fp(r,c)-f(r,c))*(fp(r,c) - f(r,c));
        end
    end
    val = molecule/denominator;
end
