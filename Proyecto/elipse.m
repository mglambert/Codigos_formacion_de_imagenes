function kspace = elipse(r1, r2, desp, con, size)
    
    if nargin < 3
        desp = [128, 128];
        size = [256, 256];
        con = 0;
    elseif nargin < 4
        size = [256, 256];
        con = 0;
    elseif nargin < 5
        size = [256, 256];
    end
    
    x = 0:size(1)-1;
    y = 0:size(2)-1;
    [x, y] = meshgrid(x, y);
    
    if con == 0
        c = ((x-desp(2))/r1) .^ 2 + ((y-desp(1))/r2) .^ 2 < 1;
    else
        c = (((x-desp(2))/r1) .^ 2 + ((y-desp(1))/r2) .^ 2 < 1) & (((x-desp(2))/(r1-con)) .^ 2 + ((y-desp(1))/(r2-con)) .^ 2 >=1);
    end
    
    [x, y] = find(c == 1);
    kspace = zeros(size);
    
    for i = 1:length(x)
        kspace = kspace + pixel([x(i),y(i)], size);
    end 
end

