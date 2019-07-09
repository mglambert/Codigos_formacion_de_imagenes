function im = homodyne(kspace, fun, multicoil)
    if nargin < 2
        multicoil = 0;
        fun = @k2i_2;
    elseif nargin < 3
        multicoil = 0;
    end
    
    if multicoil == 0
        im = homodyne_s(kspace, fun);
    else
        im = zeros(size(kspace));
        for i = 1:size(kspace,3)
            im(:, :, i) = homodyne_s(kspace(:,:,i), fun);
        end
    end
end

function im = homodyne_s(kspace, fun)

    [simp, wp] = parte_simetrica_y_w(kspace);
    wp = fun(wp.*kspace);
    simp = fun(simp);
    im = real(wp.*exp(-1i*angle(simp)));
        
end


% function kspace = simetria_conjugada(kspace)
%     [x, y] = size(kspace);
%     for i = 1:x
%         for j = 1:y
%             if kspace(i, j) == 0
%                 kspace(i, j) = conj(kspace(end+1-i, end+1-j));
%             elseif kspace(end+1-i, end+1-j) == 0
%                 kspace(end+1-i, end+1-j) = conj(kspace(i, j));
%             end
%         end
%     end
%     
% end

function [d, faltantes] = direccion(kspace)
    x = sum(kspace(:,1) == 0);
    y = sum(kspace(1,:) == 0);
    if x > y
        d = 1;
        faltantes = x;
    else 
        d = 2;
        faltantes = y;
    end
end

function [parte_simetrica, w] = parte_simetrica_y_w(kspace)
    [d, f] = direccion(kspace);
    mask = zeros(size(kspace));
    if d == 1
        mask(1+f:end-f,:) = 1;
        parte_simetrica = kspace .* mask;
        x = size(kspace,1):-1:1;
        y = (x - f - 1);
        y = y*2./y(1+f);
        y(1, 1:f) = 2;
        y(1, end-f:end) = 0;
       
        [~, w] = meshgrid( 1:size(kspace,2), y);
  
    else
        mask(:, 1+f:end-f) = 1;
        parte_simetrica = kspace .* mask;
        x = size(kspace,2):-1:1;
        y = (x - f - 1);
        y = y*2./y(1+f);
        y(1, 1:f) = 2;
        y(1, end-f:end) = 0;
       
        [w, ~] = meshgrid(y, 1:size(kspace,1));
    end
end
