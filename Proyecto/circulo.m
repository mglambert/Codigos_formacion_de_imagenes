function kspace = circulo(r, desp, con, size)
    
    if nargin < 2
        desp = [128, 128];
        size = [256, 256];
        con = 0;
    elseif nargin < 3
        size = [256, 256];
        con = 0;
    elseif nargin < 4
        size = [256, 256];
    end
    
    x = 0:size(1)-1;
    y = 0:size(2)-1;
    [x, y] = meshgrid(x, y);
    
    if con == 0
        c = sqrt((x-desp(2)) .^ 2 + (y-desp(1)) .^ 2) < r;
    else
        c = (sqrt((x-desp(2)) .^ 2 + (y-desp(1)) .^ 2) < r) & (sqrt((x-desp(2)) .^ 2 + (y-desp(1)) .^ 2) >= r-con);
    end
    
    [x, y] = find(c == 1);
    kspace = zeros(size);
    
    for i = 1:length(x)
        kspace = kspace + pixel([x(i),y(i)], size);
    end 
end

