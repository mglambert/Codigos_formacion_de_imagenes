function imshow2(im, titulo, rango, map)
    if nargin < 2
        titulo = '';
        rango = [0, 1];
        map = 'gray';
    elseif nargin < 3
        rango = [0, 1];
        map = 'gray';
    elseif nargin < 4
        map = 'gray';
    end
    
    
    z = size(im, 3);
    if z == 1
        figure;
        imshow(im, rango);
        colormap(gca, map);
    else
        figure;
        for i = 1:z
            subplot(1,z,i);
            imshow(im(:,:,i), rango);
            colormap(gca, map);
            title(sprintf('Bobina %d', i));
        end
    end
    l = suptitle(titulo);
    set(l, 'FontSize', 28);
end

