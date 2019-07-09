function contraste_x_sat(datos)
    
    if ~isfield(datos, 'M0')
        datos.M0 = 1;
    end
    if ~isfield(datos, 's')
        datos.s = 0.001;
    end
    

    [mz, mxy, t] = M_n(datos);
    
    M = (1-exp(-datos.TR/datos.T1)) / ...
    (1-exp(-datos.TR/datos.T1)*cos(deg2rad(datos.alpha)));
    

    figure;
    
    un_pulso = zeros(size(0:datos.s:datos.TR));
    un_pulso(end) = 1;
    posicion_pulsos = repmat(un_pulso, [1, datos.numero_de_pulsos]);
    
    subplot(311);
    p = posicion_pulsos;
    p(1) = 1;
    p = [zeros(size(-datos.TR:datos.s:(0-datos.s))) ,p];
    p(p==0) = nan;
    p(1) = 0;
    stem([-datos.TR:datos.s:(0-datos.s), t], p, 'filled', 'Marker', '^', 'Color', 'k', 'LineWidth', 2);
    ylim([0, 1.2]);
    xlim([-datos.TR/2, t(end)+datos.TR/2]);
    title('Pulsos RF');
    
    
    subplot(312);
    plot([-datos.TR:datos.s:(0-datos.s), t], [ones(size(-datos.TR:datos.s:(0-datos.s))) ,mz], 'LineWidth', 2, 'Color', [0.3010 0.7450 0.9330]);
    hold on;
    plot([-datos.TR:datos.s:(0-datos.s), t], M*ones(size([-datos.TR:datos.s:(0-datos.s), t])), 'LineWidth', 1, 'LineStyle', '-.', 'Color', [0.3010 0.7450 0.9330]);
    grid();
    xlabel('t[ms]');
    ylabel('M_z(t)');
    xlim([-datos.TR/2, t(end)+datos.TR/2]);

    
    
    posicion_pulsos = (posicion_pulsos .* mz);
    posiciones = find(posicion_pulsos <= M+1e-5 & posicion_pulsos >= M-1e-5);

    x = posiciones(1);
    plot(t(x), mz(x), 'o', 'Color', 'b', 'MarkerFaceColor', 'b');
    

    subplot(313);
    plot([-datos.TR:datos.s:(0-datos.s), t], [zeros(size(-datos.TR:datos.s:(0-datos.s))) ,mxy], 'LineWidth', 2, 'Color', [0.8500 0.3250 0.0980]);
    hold on;
    plot([-datos.TR:datos.s:(0-datos.s), t], M*ones(size([-datos.TR:datos.s:(0-datos.s), t]))*sin(deg2rad(datos.alpha)), 'LineWidth', 1, 'LineStyle', '-.', 'Color', [0.8500 0.3250 0.0980]);
    grid();
    xlabel('t[ms]');
    ylabel('M_{xy}(t)');
    xlim([-datos.TR/2, t(end)+datos.TR/2]);

    plot(t(x+1), mxy(x+1), 'o', 'Color', 'r', 'MarkerFaceColor', 'r');

    
    l = suptitle(sprintf('TR = %dms   %s = %d%s   T_1=%dms   T_2^*=%dms', datos.TR, '\alpha', datos.alpha,'\circ', datos.T1, datos.T2));
    set(l, 'FontSize', 28)

    
end

