function [ SNR ] = SNR( f, fp )
    [R,C] = size(f);
    molecule = 0;
    denominator = 0;
    favg = sum(sum(f))/(R*C);
    for r = 1:R
        for c = 1:C
            molecule = molecule + (f(r,c)-favg)*(f(r,c)-favg);
            denominator = denominator + (fp(r,c)-f(r,c))*(fp(r,c)-f(r,c));
        end
    end
    SNR = 10 * log10(molecule/denominator);
    
end
