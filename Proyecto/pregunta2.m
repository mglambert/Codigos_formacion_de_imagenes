%% Pregunta 2 - Proyecto IEE3764
% Mathias Lambert V.

clt;
set(0,'DefaultFigureWindowStyle','docked');
addpath('./datos_exp_recon/');
%% Leer Datos

datos = raw_READ('raw_000');

imshow2(log(abs(datos)+1), 'Espacio K por bobina', []);
ims = k2i(datos);
datos2 = datos(1+128:end-128,:,:);
ims2 = k2i(datos2);
imshow2((abs((ims))), 'Imagen por bobina con sobre muestro');
imshow2(log(abs(datos2)+1), 'Espacio K por bobina', []);
imshow2((abs((ims2))), 'Imagen por bobina sin sobre muestro');



%% Reconstruccion

im = rss(ims);
imshow2(im, 'Imagen por suma de cuadrados con sobre muestro', [0, 2]);
%%
im2 = rss(ims2);
imshow2(im2, 'Imagen por suma de cuadrados sin sobre muestro', [0,2]);

