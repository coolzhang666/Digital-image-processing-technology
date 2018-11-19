function [ PSNR ] = PSNR( f, fp )

    [R,C] = size(f);
    denominator = 0;
    fmax = max(max(f));
    molecule = fmax * fmax;
    for r = 1:R
        for c = 1:C
            denominator = denominator + (fp(r,c)- f(r,c))*(fp(r,c)- f(r,c));
        end
    end
    denominator = denominator /(R*C);
    PSNR = 10 * log10(molecule / denominator);
end
