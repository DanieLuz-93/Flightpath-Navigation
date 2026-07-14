function nav=navigation(estate,target,nav)
    dx = target.x - estate.x;
    dy = target.y - estate.y;
    dz = target.z - estate.z;

    chi_target = atan(dy, dx);

    dist_xy = sqrt(dx^2 + dy^2);
    zeta_target = atan(dz, dist_xy);
    
    chi_error = wrapToPi(chi_target - estate.chi);
    zeta_error = zeta_target - estate.zeta;
    
    nav.dchi = max(-nav.maxturn, min(chi_error, nav.maxturn));
    nav.dzeta = max(-nav.maxturn, min(zeta_error, nav.maxturn));
    slow= (abs(nav.dchi)==nav.maxturn) | (abs(nav.dzeta)==nav.maxturn);
    if slow then
        nav.da=-1;
    else
        nav.da=0.3;
    end
    

endfunction

function angle = wrapToPi(angle)

    while angle > %pi
        angle = angle - 2 * %pi;
    end

    while angle < -%pi
        angle = angle + 2 * %pi;
    end

endfunction
