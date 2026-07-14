function [tstate, estate, nav, target, dt, hist, bias,cor] = initSimulation()

    tstate.x = 0;
    tstate.y = 0;
    tstate.z = 0;
    tstate.zeta = 0;
    tstate.chi = 0;
    tstate.v = 100;
    tstate.t = 0;
    tstate.a = 0;

    estate = tstate;

    nav.dchi = 0.5;
    nav.dzeta = 0.5;
    nav.da = 0;
    nav.maxturn=0.3

    target.x = 1000;
    target.y = 1000;
    target.z = 1000;

    dt = 0.1;
    
    hist.N=1500;
    hist.x = zeros(1 ,hist.N);
    hist.y = zeros(1, hist.N);
    hist.z = zeros(1, hist.N);
    
    bias.gyrochi=0.01*(rand()-0.5);
    bias.gyrozeta=0.01*(rand()-0.5);
    bias.gyroa=0.002*(rand()-0.5);
    
    cor.chi=0;
    cor.zeta=0;
    cor.a=0;
    
    


endfunction
