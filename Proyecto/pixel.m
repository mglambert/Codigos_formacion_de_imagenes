function kspace = pixel(desp, size)
    
    if nargin < 2
        size = [256, 256];
    end
    
    x = 0:size(1)-1;
    y = 0:size(2)-1;
    
    fx  =  exp(1i*x*2*pi*(size(1)/2-desp(2)+1)/size(1));
    fx(1) = 1;
    fx = fftshift(fx);

    fy  =  exp(1i*y*2*pi*(size(2)/2-desp(1)+1)/size(2));
    fy(1) = 1;
    fy = fftshift(fy);

    [x, y] = meshgrid(fx,fy);
    kspace = x.*y;
    
end

