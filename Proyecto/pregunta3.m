%% Pregunta 3 - Proyecto IEE3764
% Mathias Lambert V.

% Como los datos estaban sobre muestreados en x se concluye que x es la
% direccion de lectura e y es la direccion de codificacion de fase
clt;
set(0,'DefaultFigureWindowStyle','docked');
addpath('./datos_exp_recon/');

%% Cargar datos

datos = raw_READ('raw_000');
datos = datos(:, :, 2:end);

%% Simular half scan con zero filling
[x, y, ~] = size(datos);

ims = k2i(datos);
im = rss(ims);

sub1 = floor(62.5*y/100);
sub2 = floor(80*y/100);

mask1 = zeros(x, y);
mask1(:, 1:sub1) = 1;

mask2 = zeros(x, y);
mask2(:, 1:sub2) = 1;

datos1 = datos .* mask1;
datos2 = datos .* mask2;

imshow2(log(abs(datos1)+1), '62% de los datos', []);
imshow2(log(abs(datos2)+1), '80% de los datos', []);

clear x y sub1 sub2 mask1 mask2 ims;

%% Reconstruccion zero filling

ims1 = k2i(datos1);
imshow2(ims1, {'Zero Filling', 'Imagenes 62% de los datos'}, [0,2]);
im1 = rss(ims1);
imshow2(im1, {'Zero Filling', 'Imagen 62% de los datos'}, [0,2]);

ims2 = k2i(datos2);
imshow2(ims2, {'Zero Filling', 'Imagenes 80% de los datos'}, [0,2]);

im2 = rss(ims2);
imshow2(im2, {'Zero Filling', 'Imagen 80% de los datos'}, [0,2]);

imshow2(im, 'Ground True', [0,2]);


mse1 = immse(im1, im);
mse2 = immse(im2, im);
fprintf('MSE Zero-Filling 62%%  = %f\n', mse1);
fprintf('MSE Zero-Filling 80%% = %f\n', mse2);

ssim1 = ssim(im1, im);
ssim2 = ssim(im2, im);
fprintf('SSIM Zero-Filling 62%%  = %f\n', ssim1);
fprintf('SSIM Zero-Filling 80%% = %f\n', ssim2);



%% Reconstruccion Homodinia

ims1 = homodyne(datos1, @k2i , 1);
imshow2(ims1, {'Homodyne', 'Imagenes 62% de los datos'}, [0,2]);
im1 = rss(ims1);
imshow2(im1, {'Homodyne', 'Imagen 62% de los datos'}, [0,2]);

ims2 = homodyne(datos2, @k2i, 1);
imshow2(ims2, {'Homodyne', 'Imagenes 80% de los datos'}, [0,2]);

im2 = rss(ims2);
imshow2(im2, {'Homodyne', 'Imagen 80% de los datos'}, [0,2]);

mse1 = immse(im1, im);
mse2 = immse(im2, im);
fprintf('MSE Homodyne 62%% = %f\n', mse1);
fprintf('MSE Homodyne 80%% = %f\n', mse2);

ssim1 = ssim(im1, im);
ssim2 = ssim(im2, im);
fprintf('SSIM Homodyne 62%% = %f\n', ssim1);
fprintf('SSIM Homodyne 80%% = %f\n', ssim2);

%% Phantom parcial en direccion Y
clt;
kspace = mi_phantom;
im = k2i_2(kspace);

[x, y] = size(kspace);
sub1 = floor(62.5*y/100);
sub2 = floor(80*y/100);

mask1 = zeros(x, y);
mask1(:, 1:sub1) = 1;

mask2 = zeros(x, y);
mask2(:, 1:sub2) = 1;

kspace1 = kspace .* mask1;
kspace2 = kspace .* mask2;

clear x y sub1 sub2 mask1 mask2;


imshow2(log(abs(kspace1)+1), {'Zero Filling', 'kspace 62% de los datos'}, []);
imshow2(log(abs(kspace2)+1), {'Zero Filling', 'kspace 80% de los datos'}, []);

% Zero - filling
im1 = k2i_2(kspace1);
imshow2(abs(im1), {'Zero Filling', 'Imagen con 62% de los datos'}, [0,1]);
im2 = k2i_2(kspace2);
imshow2(abs(im2), {'Zero Filling', 'Imagen con 80% de los datos'}, [0,1]);

% Homodinia

ims1 = homodyne(kspace1, @k2i_2);
imshow2((ims1), {'Homodyne', 'Imagen con 62% de los datos'}, [0,1]);

ims2 = homodyne(kspace2, @k2i_2);
imshow2((ims2), {'Homodyne', 'Imagen con 80% de los datos'}, [0,1]);

imshow2(abs(im), 'Ground True', [0,1]);


mse1 = immse(abs(im1), abs(im));
mse2 = immse(abs(im2), abs(im));
fprintf('MSE Zero-Filling 62%%  = %f\n', mse1);
fprintf('MSE Zero-Filling 80%% = %f\n', mse2);

ssim1 = ssim(abs(im1), abs(im));
ssim2 = ssim(abs(im2), abs(im));
fprintf('SSIM Zero-Filling 62%%  = %f\n', ssim1);
fprintf('SSIM Zero-Filling 80%% = %f\n', ssim2);

mse1 = immse((ims1), abs(im));
mse2 = immse((ims2), abs(im));
fprintf('MSE Homodyne 62%% = %f\n', mse1);
fprintf('MSE Homodyne 80%% = %f\n', mse2);

ssim1 = ssim((ims1), abs(im));
ssim2 = ssim((ims2), abs(im));
fprintf('SSIM Homodyne 62%% = %f\n', ssim1);
fprintf('SSIM Homodyne 80%% = %f\n', ssim2);


%% Phantom parcial en direccion X
clt;
kspace = mi_phantom;
im = k2i_2(kspace);

[x, y] = size(kspace);
sub1 = floor(62.5*y/100);
sub2 = floor(80*y/100);

mask1 = zeros(x, y);
mask1(1:sub1, :) = 1;

mask2 = zeros(x, y);
mask2(1:sub2, :) = 1;

kspace1 = kspace .* mask1;
kspace2 = kspace .* mask2;

imshow2(log(abs(kspace1)+1), {'Zero Filling', 'kspace 62% de los datos'}, []);
imshow2(log(abs(kspace2)+1), {'Zero Filling', 'kspace 80% de los datos'}, []);

% Zero - filling
im1 = k2i_2(kspace1);
imshow2(abs(im1), {'Zero Filling', 'Imagen con 62% de los datos'}, [0,1]);
im2 = k2i_2(kspace2);
imshow2(abs(im2), {'Zero Filling', 'Imagen con 80% de los datos'}, [0,1]);

% Homodinia

ims1 = homodyne(kspace1, @k2i_2);
imshow2(ims1, {'Homodyne', 'Imagen con 62% de los datos'}, [0,1]);

ims2 = homodyne(kspace2, @k2i_2);
imshow2(ims2, {'Homodyne', 'Imagen con 80% de los datos'}, [0,1]);

mse1 = immse(abs(im1), abs(im));
mse2 = immse(abs(im2), abs(im));
fprintf('MSE Zero-Filling 62%%  = %f\n', mse1);
fprintf('MSE Zero-Filling 80%% = %f\n', mse2);

ssim1 = ssim(abs(im1), abs(im));
ssim2 = ssim(abs(im2), abs(im));
fprintf('SSIM Zero-Filling 62%%  = %f\n', ssim1);
fprintf('SSIM Zero-Filling 80%% = %f\n', ssim2);

mse1 = immse(ims1, abs(im));
mse2 = immse(ims2, abs(im));
fprintf('MSE Homodyne 62%% = %f\n', mse1);
fprintf('MSE Homodyne 80%% = %f\n', mse2);

ssim1 = ssim(ims1, abs(im));
ssim2 = ssim(ims2, abs(im));
fprintf('SSIM Homodyne 62%% = %f\n', ssim1);
fprintf('SSIM Homodyne 80%% = %f\n', ssim2);

