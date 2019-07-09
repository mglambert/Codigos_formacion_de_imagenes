function c_x_sat_env(datos)
    T1 = datos.T1;
    TR = datos.TR;
    a = deg2rad(datos.alpha);
    t = 0:datos.n-1;
    mz = zeros(size(t));
    mxy = zeros(size(t));
    
    mz(1) = 1;
    E1 = exp(-TR/T1);
    
    for i = 2:datos.n
        mz(i) = mz(i-1)*cos(a)*E1 + 1-E1;
        mxy(i) = mz(i-1)*sin(a);
    end
    
    figure;
    
    subplot(211);
    plot(t, mz,'LineWidth', 2, 'Marker', 'p', 'MarkerSize', 3, 'Color', [255, 102, 0]/255);
    ylabel('M_z(t)');
    ylim([0, 1]);
    xlabel('iteraciones(pulsos)');
    grid();
    
    subplot(212);
    plot(t, mxy,'LineWidth', 2, 'Marker', 'p', 'MarkerSize', 3, 'Color', [116, 101, 255]/255);
    ylabel('M_{xy}(t)');
    ylim([0, 1]);
    xlabel('iteraciones(pulsos)');
    grid();
    
    l = suptitle(sprintf('TR = %dms   %s = %d%s   T_1=%dms', TR, '\alpha', datos.alpha,'\circ', T1));
    set(l, 'FontSize', 28)

    
    
    

end

