function f = i2k(Data)
     z = size(Data, 3);
    if z == 1
        f = fftshift(fftn(ifftshift(Data)));
    else
        f = zeros(size(Data));
        for i = 1:z
            f(:,:,i) = fftshift(fft2(ifftshift(Data(:,:,i))));
        end
    end
end