%% Pregunta 1 - Proyecto IEE3764
% Mathias Lambert V.

clt;
set(0,'DefaultFigureWindowStyle','docked');
%% 
tic;
k = mi_phantom;
imshow2(log(abs(k)+1), 'Espacio K simulado', []);
imshow2(abs(k2i_2(k)), 'Imagen reconstruida', [0, 1]);
toc;




