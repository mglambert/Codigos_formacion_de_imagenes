function kspace = rectangulo(a, b, desp, size)
    % a y b tiene que ser valores pares
    
    if nargin < 3
        desp = [0, 0];
        size = [256, 256];
    elseif nargin < 4
        size = [256, 256];
    end
    
    x = 0:size(1)-1;
    y = 0:size(2)-1;
    
    fx  = (exp(-1i*pi*x*(a-1)/size(1)).*(sin(pi*x*a/size(1))./(a*sin(pi*x/size(1))))) .* exp(1i*x*2*pi*(a*0.5-desp(1))/size(1));
    fx(1) = 1;
    fx = fftshift(fx)*a;

    
    fy  = (exp(-1i*pi*y*(b-1)/size(2)).*(sin(pi*y*b/size(2))./(b*sin(pi*y/size(2))))) .* exp(1i*y*2*pi*(b*0.5-desp(2))/size(2));
    fy(1) = 1;
    fy = fftshift(fy)*b;

    [x, y] = meshgrid(fx,fy);
    kspace = x.*y;
    
end

