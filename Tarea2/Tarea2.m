%% Tarea2
% Mathias Lambert V.

gamma = 2*pi*42.58e6;
%% 1. 
B0 = 1e-3;
rect = @(t) double(abs(t) < 0.5);
B1 = @(t, b, H) b*rect((t-H/2)/H);
%% a) Encontrar t para alpha = 90
% Sabemos que el tiempo para que la magnetizacion llegue a 90 grados se
% calcula de manera analitica como sigue
b = 0.01e-3;
t_alpha = (pi/2)/(gamma*b);

Bloch = @(t,M,H) [0;gamma*B1(t,b,H)*M(3);-gamma*B1(t,b,H)*M(2)];

t = 0:0.00001:0.001;
[T , M] = ode45(@(t,M) Bloch(t,M, t_alpha),t,[0;0;1]);
Mz = M(:,3)';
Mxy = M(:,1)' + 1i*M(:,2)';
figure;
plot(T,abs(Mxy), 'LineWidth', 1.5);
hold on;
plot(T,abs(Mz), 'LineWidth', 1.5);
plot([t_alpha, t_alpha], [0, 1], '--','Color', 'black');
text(t_alpha, 0.5, sprintf(' t=%f', t_alpha));
legend('Mxy', 'Mz');
title('Pregunta 2 a)');
xlabel('Tiempo [s]');
ylabel('Magnetizacion [T]');


%% b) Cuanto debe valer el valor b para que el tiempo sea de 1 [ms]?
b = (pi/2)/(gamma*1e-3);
Bloch = @(t,M,H) [0;gamma*B1(t,b,H)*M(3);-gamma*B1(t,b,H)*M(2)];

t = 0:0.00001:0.002;
[T , M] = ode45(@(t,M) Bloch(t,M, 1e-3),t,[0;0;1]);
Mz = M(:,3)';
Mxy = M(:,1)' + 1i*M(:,2)';
figure;
plot(T,abs(Mxy), 'LineWidth', 1.5);
hold on;
plot(T,abs(Mz), 'LineWidth', 1.5);
plot([1e-3, 1e-3], [0, 1], '--','Color', 'black');
text(1e-3, 0.5, sprintf(' t=%f[s]', 1e-3));
text(1.4e-3, 0.7, sprintf(' b=%f[T]', b));
legend('Mxy', 'Mz');
title('Pregunta 2 b)');
xlabel('Tiempo [s]');
ylabel('Magnetizacion [T]');


%% 2.
%% a)
H = 1e-3;
b = (pi/2)/(gamma*5.8949e-04);

B1 = @(t, b, H) b*rect((t-H/2)/H).*sinc((t-H/2)/(H/2));
Gz = @(t,H) 0.01e-3*rect((t-H/2)/H);
Bloch = @(t,M,H,z) [gamma*Gz(t,H)*z*M(2);...
    -gamma*Gz(t,H)*z*M(1)+gamma*B1(t,b,H)*M(3);...
    -gamma*B1(t,b,H)*M(2)];

z = 0;
t = 0:0.00001:0.002;
[T , M] = ode45(@(t,M) Bloch(t,M,H,z),t,[0;0;1]);
Mz = M(:,3)';
Mxy = M(:,1)' + 1i*M(:,2)';
figure;
plot(T,abs(Mxy), 'LineWidth', 1.5);
hold on;
plot(T,abs(Mz), 'LineWidth', 1.5);
plot([1e-3, 1e-3], [0, 1], '--','Color', 'black');
text(1e-3, 0.5, sprintf(' t=%f', 1e-3));
legend('Mxy', 'Mz');
title('Pregunta 3 a)');
xlabel('Tiempo [s]');
ylabel('Magnetizacion [T]');

%% b)
t = 0:0.00001:H;
mz = zeros(1,200);
mxy = zeros(1,200);
z = linspace(-10,10,200);
for i = 1:200
    [~, M] = ode45(@(t,M) Bloch(t,M,H,z(i)),t,[0;0;1]);
    mz(i) = M(end,3);
    mxy(i) = M(end,1) + 1i*M(end,2);
end
figure;
plot(z,abs(mxy), 'LineWidth', 1.5);
hold on;
plot(z,abs(mz),'LineWidth', 1.5);
legend('Mxy', 'Mz');
title('Pregunta 3 b)')
ylabel('Magnetizacion [T]');
xlabel('z [cm]')

figure;
yyaxis left
plot(z,abs(mxy), 'LineWidth', 1.5);
ylabel('Magnetizacion [T]');
yyaxis right
plot(z,angle(mxy),'LineWidth', 1.5);
ylabel('Fase');
legend('|Mxy|', 'angle(Mxy)');
title('Pregunta 3 b)')
xlabel('z [cm]')

%% 3.
%% a)
H = 1e-3;
b = (pi/2)/(gamma*5.8949e-04);

B1 = @(t, b, H) b*rect((t-H/2)/H).*sinc((t-H/2)/(H/2));
Gz = @(t,H) 0.01e-3*(rect((t-H/2)/H)-rect((t-5*H/4)/(H/2)));
Bloch = @(t,M,H,z) [gamma*Gz(t,H)*z*M(2);...
    -gamma*Gz(t,H)*z*M(1)+gamma*B1(t,b,H)*M(3);...
    -gamma*B1(t,b,H)*M(2)];

z = 0;
t = 0:0.00001:0.002;
[T , M] = ode45(@(t,M) Bloch(t,M,H,z),t,[0;0;1]);
Mz = M(:,3)';
Mxy = M(:,1)' + 1i*M(:,2)';
figure;
plot(T,abs(Mxy),'LineWidth', 1.5);
hold on;
plot(T,abs(Mz),'LineWidth', 1.5);
legend('Mxy', 'Mz');
title('Pregunta 4 a)');
plot([H, H], [0, 1], '--','Color', 'black');
text(H, 0.5, sprintf(' t=%f', H));
ylabel('Magnetizacion [T]');
xlabel('Tiempo [s]')

%% b)
t = 0:0.00001:3*H/2;
mz = zeros(1,500);
mxy = zeros(1,500);
z = linspace(-10,10,500);

for i = 1:500
    [~ , M] = ode45(@(t,M) Bloch(t,M,H,z(i)),t,[0;0;1]);
    mz(i) = M(end,3);
    mxy(i) = M(end,1) + 1i*M(end,2);
end
figure;
plot(z,abs(mxy),'LineWidth', 1.5);
hold on;
plot(z,abs(mz),'LineWidth', 1.5);
legend('Mxy', 'Mz');
ylabel('Magnetizacion [T]');
title('Pregunta 4 b)')

figure;
yyaxis left
plot(z,abs(mxy), 'LineWidth', 1.5);
ylabel('Magnetizacion [T]');
yyaxis right
plot(z,angle(mxy),'LineWidth', 1.5);
ylabel('Fase');
legend('|Mxy|', 'angle(Mxy)');
title('Pregunta 4 b)')
xlabel('z [cm]')




