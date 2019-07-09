function kspace = mi_phantom(size)
    % Solo para el size por defecto
    if nargin < 1
        size = [256 256];
    end
    kspace = zeros(size);
    
    kspace = kspace + circulo(120, [128, 128], 5, size);
    kspace = kspace + 0.5*circulo(40, [0, 0]);
    kspace = kspace + 0.3*rectangulo(20, 20, [-110, -110]);
    
    kspace = kspace + 0.2*rectangulo(30, 20, [110, -110]);
    kspace = kspace + 0.3*rectangulo(8, 30, [110, -100]);





    kspace = kspace + 0.1*circulo(15, [76-2, 76-2], 2, size);
    kspace = kspace + 0.1*circulo(15, [76-2, 179+2], 2, size);
    kspace = kspace + 0.4*circulo(15, [76-2, 76-2]);
    kspace = kspace + 0.4*circulo(15, [76-2, 179+2]);
    
    kspace = kspace + 0.7*circulo(5, [76, 76], 0, size);
    kspace = kspace + 0.7*circulo(5, [76, 179], 0, size);
    
    kspace = kspace + 0.5*rectangulo(90, 30, [0, 50], size);
    kspace = kspace + 0.5*rectangulo(96, 36, [0, 50], size);
    
    kspace = kspace - 0.8*rectangulo(20, 20, [0,0], size);
    kspace = kspace + 0.8*rectangulo(22, 22, [0,0], size);
    
    kspace = kspace + 0.2*rectangulo(6, 6, [4, 4], size);
    kspace = kspace + 0.2*rectangulo(6, 6, [-4, 4], size);
    kspace = kspace + 0.2*rectangulo(4, 4, [4, 4], size);
    kspace = kspace + 0.2*rectangulo(4, 4, [-4, 4], size);
    kspace = kspace + 0.2*rectangulo(2, 2, [4, 4], size);
    kspace = kspace + 0.2*rectangulo(2, 2, [-4, 4], size);
    
    kspace = kspace + 0.8*rectangulo(38, 38, [54, -54], size);
    kspace = kspace + 0.8*rectangulo(38, 38, [-54, -54], size);
    kspace = kspace - 0.8*rectangulo(34, 34, [54, -54], size);
    kspace = kspace - 0.8*rectangulo(34, 34, [-54, -54], size);
    kspace = kspace + 0.8*rectangulo(70, 2, [0, -50], size);
    
    kspace = kspace + 0.4*rectangulo(4, 38, [-70, 10], size);
    kspace = kspace + 0.4*rectangulo(16, 2, [-70, 10], size);
    kspace = kspace + 0.4*rectangulo(16, 2, [-70, 0], size);
    kspace = kspace + 0.4*rectangulo(16, 2, [-70, 20], size);
    kspace = kspace + 0.5*elipse(15, 25, [138, 58], 3);
    kspace = kspace + 0.2*elipse(15, 25, [138, 200]);
    kspace = kspace - 0.2*elipse(7, 5, [138, 200]);
    


end

