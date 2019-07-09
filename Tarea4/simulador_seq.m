function simulador_seq(m1, m2, seq)

    if strcmp(seq.IR, 'yes')
        sim = c_x_inv(m1, m2, seq);
        TE = seq.TI + seq.TE;
    else
        sim = c_x_sat(m1, m2, seq);
        TE = seq.TE;
    end
   if ~isfield(seq, 'alpha')
        seq.alpha = 90;
    end
    
    figure;
    subplot(211);
    plot(sim.t, sim.mz1, 'LineWidth', 2, 'Color', [195,18,18]/255);
    hold on;
    plot(sim.t, sim.mz2, 'LineWidth', 2, 'Color', [19,181,143]/255);
    ylabel('M_z(t)');
    xlabel('t [ms]');
    legend(['T1 = ', num2str(m1.T1), '[ms]'],...
           ['T1 = ', num2str(m2.T1), '[ms]'],...
           'Location','northwest');
    plot([TE, TE], ylim, 'LineStyle', ':', 'Color', 'k', 'LineWidth',2);
    text(TE, min(ylim)-0.1, 'TE');
    grid();
    
    subplot(212);
    plot(sim.t, sim.mxy1, 'LineWidth', 2, 'Color', [195,18,18]/255);
    hold on;
    plot(sim.t, sim.mxy2, 'LineWidth', 2, 'Color', [19,181,143]/255);
    grid();
    ylabel('M_{xy}(t)');
    xlabel('t[ms]');
    if strcmp(seq.seq, 'SE')
        legend(['T2 = ', num2str(m1.T2), '[ms]'],...
               ['T2 = ', num2str(m2.T2), '[ms]'],...
               'Location','northwest');
    else
        legend(['T2s = ', num2str(m1.T2s), '[ms]'],...
               ['T2s = ', num2str(m2.T2s), '[ms]'],...
               'Location','northwest');
    end
    plot([TE, TE], ylim, 'LineStyle', ':', 'Color', 'k', 'LineWidth',2);
    text(TE, min(ylim)-0.1, 'TE');
    
    if strcmp(seq.IR, 'yes')
        l = suptitle(sprintf('Secuencia %s  TR=%dms TI=%dms TE=%dms', seq.seq, seq.TR, seq.TI, seq.TE));
       
    else
        l = suptitle(sprintf('Secuencia %s  TR=%dms %s=%d%s TE=%dms', seq.seq, seq.TR, '\alpha', seq.alpha, '\circ', seq.TE));
    end
    set(l, 'FontSize', 28)

    
    


end

