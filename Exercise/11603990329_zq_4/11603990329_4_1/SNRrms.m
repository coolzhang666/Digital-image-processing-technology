function [ val ] = SNRrms( f, fp )
    [R,C] = size(f);
    molecule = 0;
    denominator = R * C;
    
    for r=1:R
        for c=1:C
            temp = fp(r,c)-f(r,c);
            molecule = molecule + temp * temp;
            
        end
    end
    val = molecule/denominator;
    val = sqrt(val);

end
