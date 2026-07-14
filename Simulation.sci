function [tstate] = Simulationstep(tstate,nav,dt)
     funcprot(0);
     tstate.x=tstate.x+dt*tstate.v*cos(tstate.chi)*cos(tstate.zeta);
     tstate.y=tstate.y+dt*tstate.v*sin(tstate.chi)*cos(tstate.zeta);
     tstate.z=tstate.z+dt*tstate.v*sin(tstate.zeta);
     tstate.v= tstate.v + dt*nav.da;
     tstate.chi=tstate.chi+dt*nav.dchi;
     tstate.zeta=tstate.zeta+dt*nav.dzeta; 
     tstate.t=tstate.t+dt
endfunction
