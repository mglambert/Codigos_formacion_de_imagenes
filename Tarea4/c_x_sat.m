function sim = c_x_sat(m1, m2, datos)
    p1 = m1.p;
    p2 = m2.p;
    T11 = m1.T1;
    T12 = m2.T1;
    
        
    if isfield(datos, 's')
        s = datos.s;
    else
        s = 0.01;
    end
    
    if isfield(datos, 'TR')
        TR = datos.TR;
    else
        TR = 450;
    end
    
    if isfield(datos, 'alpha')
        a = deg2rad(datos.alpha);
    else
        a = pi/2;
    end
    
    if isfield(datos, 'seq')
        seq = datos.seq;
    else
        seq = 'GRE';
    end
    
    if strcmp(seq, 'GRE')
        T21 = m1.T2s;
        T22 = m2.T2s;
    else
        T21 = m1.T2;
        T22 = m2.T2;
    end
    
    t = 0:s:TR;
    
    sim = [];
    sim.t = t;
    
    E11 = exp(-TR/T11);
    Mm1 = p1*(1-E11)/(1-E11*cos(a));
    sim.mz1 = Mm1*cos(a)*exp(-t/T11) + p1*(1-exp(-t/T11));
    sim.mxy1 = Mm1*sin(a)*exp(-t/T21);
    
    E12 = exp(-TR/T12);
    Mm2 = p2*(1-E12)/(1-E12*cos(a));
    sim.mz2 = Mm2*cos(a)*exp(-t/T12) + p2*(1-exp(-t/T12));
    sim.mxy2 = Mm2*sin(a)*exp(-t/T22);

end

