function f = k2i(Data)
    z = size(Data, 3);
    if z == 1
        f = ifft(ifftshift(ifft(ifftshift(Data),[], 1)), [], 2);
    else
        f = zeros(size(Data));
        for i = 1:z
            f(:,:,i) = ifft(ifftshift(ifft(ifftshift(Data(:,:,i)),[], 1)), [], 2);
        end
    end


end