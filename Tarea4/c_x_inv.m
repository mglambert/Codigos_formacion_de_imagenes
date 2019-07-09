function sim = c_x_inv(m1, m2, datos)
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
    
    if isfield(datos, 'TI')
        TI = datos.TI;
    else
        TI = 200;
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

    
    E1 = exp(-t/T11);
    E2 = exp(-(t-TI)/T11);
    sim.mz1 = zeros(size(t));
    sim.mz1 = p1*(1+exp(-TR/T11)-2*E1).*double(t<TI) + p1*(1-E2).*double(t>TI);
    sim.mxy1 = zeros(size(t));
    E3 = exp(-(t-TI)/T21);
    sim.mxy1 = abs(p1*(1+exp(-TR/T11)-2*exp(-TI/T11)))*E3.*double(t>TI);
    
    E1 = exp(-t/T12);
    E2 = exp(-(t-TI)/T12);
    sim.mz2 = zeros(size(t));
    sim.mz2 = p2*(1+exp(-TR/T12)-2*E1).*double(t<TI) + p2*(1-E2).*double(t>TI);
    sim.mxy2 = zeros(size(t));
    E3 = exp(-(t-TI)/T22);
    sim.mxy2 = abs(p2*(1+exp(-TR/T12)-2*exp(-TI/T12)))*E3.*double(t>TI);

end

