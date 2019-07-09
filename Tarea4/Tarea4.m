%% Tarea 4 - IEE3764
% Mathias Lambert V.


%% 1.
ernst = @(tr, T1) rad2deg(acos(exp(-tr/T1)));
te = @(alpha, T1) -T1*log(cos(degtorad(alpha)));
%% a) simulacion 1
datos = [];
datos.TR = 129;
datos.T1 = 900;
datos.T2 = 40;
datos.numero_de_pulsos = 40;
datos.alpha = 30;
datos.s = 0.01; 

contraste_x_sat(datos);

%% b) simulacion 2

datos.TR = 129;
datos.T1 = 900;
datos.T2 = 40;
datos.numero_de_pulsos = 40;
datos.alpha = 80;
datos.s = 0.01; 

contraste_x_sat(datos);

%% c) simulacion 3

datos.TR = 600;
datos.T1 = 900;
datos.T2 = 40;
datos.numero_de_pulsos = 10;
datos.alpha = 85;
datos.s = 0.01; 

contraste_x_sat(datos);

%% d) simulacion 4

datos.TR = 600;
datos.T1 = 900;
datos.T2 = 40;
datos.numero_de_pulsos = 20;
datos.alpha = 15;
datos.s = 0.01; 

contraste_x_sat(datos);

%%

datos.TR = 5;
datos.T1 = 500;
datos.T2 = 20;
datos.numero_de_pulsos = 260;
datos.alpha = 15;
datos.s = 0.01; 

contraste_x_sat(datos);

%%

datos.TR = 15;
datos.T1 = 500;
datos.T2 = 20;
datos.numero_de_pulsos = 180;
datos.alpha = 15;
datos.s = 0.01; 

contraste_x_sat(datos);

%%

datos.TR = 5;
datos.T1 = 2000;
datos.T2 = 20;
datos.numero_de_pulsos = 15;
datos.alpha = 70;
datos.s = 0.01; 

contraste_x_sat(datos);

%%

datos.TR = 15;
datos.T1 = 2000;
datos.T2 = 20;
datos.numero_de_pulsos = 15;
datos.alpha = 70;
datos.s = 0.01; 

contraste_x_sat(datos);

%% Envolventes 

clear datos;
datos = [];

datos.T1 = 500;
datos.TR = 5;
datos.n = 500;
datos.alpha = 15;
c_x_sat_env(datos);

datos.TR = 15;
c_x_sat_env(datos);

datos.T1 = 200;
datos.TR = 5;
datos.n = 15;
datos.alpha = 70;
c_x_sat_env(datos);

datos.TR = 15;
c_x_sat_env(datos);

%% 2.

materia_gris = [];
materia_gris.p = 1;
materia_gris.T1 = 870;
materia_gris.T2 = 90;
materia_gris.T2s = 40;

materia_blanca = [];
materia_blanca.p = 2; 
materia_blanca.T1 = 520;
materia_blanca.T2 = 75;
materia_blanca.T2s = 30;

lcr = [];
lcr.p = 3;
lcr.T1 = 1900;
lcr.T2 = 250;
lcr.T2s = 110;

%%
seq = [];
seq.TR = 2000;
seq.TI = 1000;
seq.TE = 100;
seq.seq = 'SE';
seq.IR = 'yes';
simulador_seq(materia_blanca, materia_gris, seq);

seq.IR = 'no';
simulador_seq(materia_blanca, materia_gris, seq);


seq.alpha = 50;
simulador_seq(materia_blanca, materia_gris, seq);


seq.seq = 'GRE';
seq.IR = 'yes';
simulador_seq(materia_blanca, materia_gris, seq);

seq.IR = 'no';
seq.alpha = 90;
simulador_seq(materia_blanca, materia_gris, seq);


seq.alpha = 50;
simulador_seq(materia_blanca, materia_gris, seq);

%%

seq.seq = 'SE';
seq.IR = 'yes';
simulador_seq(materia_blanca, lcr, seq);

seq.IR = 'no';
seq.alpha = 90;
simulador_seq(materia_blanca, lcr, seq);


seq.alpha = 50;
simulador_seq(materia_blanca, lcr, seq);


seq.seq = 'GRE';
seq.IR = 'yes';
simulador_seq(materia_blanca, lcr, seq);

seq.IR = 'no';
seq.alpha = 90;
simulador_seq(materia_blanca, lcr, seq);


seq.alpha = 50;
simulador_seq(materia_blanca, lcr, seq);

%%
seq.TR = 2000;
seq.TI = -materia_gris.T1*log((1+exp(-seq.TR/materia_gris.T1))/2);
seq.TE = 100;
seq.seq = 'GRE';
seq.IR = 'yes';
simulador_seq(materia_blanca, materia_gris, seq);

seq.TR = 2000;
seq.TI = -materia_blanca.T1*log((1+exp(-seq.TR/materia_blanca.T1))/2);
seq.TE = 100;
seq.seq = 'GRE';
seq.IR = 'yes';
simulador_seq(materia_blanca, materia_gris, seq);






