function [mz, mxy, t] = M_n(datos)
    M0 = datos.M0;
    T1 = datos.T1;
    T2 = datos.T2;
    TR = datos.TR;
    a = deg2rad(datos.alpha);
    n = datos.numero_de_pulsos;
    
    s = datos.s;
    t = 0:s:(n*TR+(n-1)*s);
    mz = zeros(size(t));
    mxy = zeros(size(t));
    l = size(0:s:TR, 2);
    E1 = exp(-(0:s:TR)/T1);
    for i = 1:n
        if i == 1
            m_n_1 = M0;
        end
        m_n = M0*(1-E1) + m_n_1*cos(a)*E1;
        m_n2 = m_n_1*sin(a)*exp(-(0:s:TR)/T2);
        m_n_1 = m_n(end);
        mz(1,i+(l-1)*(i-1):l*i) = m_n;
        mxy(1,i+(l-1)*(i-1):l*i) = m_n2;

    end
end





