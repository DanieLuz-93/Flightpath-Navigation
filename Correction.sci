function cor = correction(tstate, estate, hist, k, cor)

    td = [
        hist.tx(k) - hist.tx(k - 99), ...
        hist.ty(k) - hist.ty(k - 99), ...
        hist.tz(k) - hist.tz(k - 99)
    ];

    ed = [
        hist.ex(k) - hist.ex(k - 99), ...
        hist.ey(k) - hist.ey(k - 99), ...
        hist.ez(k) - hist.ez(k - 99)
    ];

    tchi = atan(td(2), td(1));
    echi = atan(ed(2), ed(1));

    tdist_xy = sqrt(td(1)^2 + td(2)^2);
    edist_xy = sqrt(ed(1)^2 + ed(2)^2);

    tzeta = atan(td(3), tdist_xy);
    ezeta = atan(ed(3), edist_xy);

    tdist_xyz = sqrt(td(1)^2 + td(2)^2 + td(3)^2);
    edist_xyz = sqrt(ed(1)^2 + ed(2)^2 + ed(3)^2);

    K_chi = 0.01;
    K_zeta = 0.01;
    K_a = 0.0002;

    cor.chi = cor.chi + K_chi * wrapToPi(tchi - echi);
    cor.zeta = cor.zeta + K_zeta * (tzeta - ezeta);
    cor.a = cor.a + K_a * (tdist_xyz - edist_xyz);

endfunction
    
    
    
    
