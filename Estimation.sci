function estate=Estimationstep(estate,nav,dt,bias,cor)
    estate.chi=estate.chi+bias.gyrochi+cor.chi;
    estate.zeta=estate.zeta+bias.gyrozeta+cor.zeta;
    nav.da=nav.da+bias.gyroa;
    
    estate.x=estate.x+dt*estate.v*cos(estate.chi)*cos(estate.zeta);
    estate.y=estate.y+dt*estate.v*sin(estate.chi)*cos(estate.zeta);
    estate.z=estate.z+dt*estate.v*sin(estate.zeta);
    estate.v= estate.v + dt*nav.da;
    estate.chi=estate.chi+dt*nav.dchi;
    estate.zeta=estate.zeta+dt*nav.dzeta; 
    estate.t=estate.t+dt
endfunction
