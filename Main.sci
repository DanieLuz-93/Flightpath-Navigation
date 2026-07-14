exec("C:/Users/Administrator/Documents/Scilab/Navigation/Initsim.sci", -1);
exec("C:/Users/Administrator/Documents/Scilab/Navigation/Simulation.sci", -1);
exec("C:/Users/Administrator/Documents/Scilab/Navigation/Render.sci", -1);
exec("C:/Users/Administrator/Documents/Scilab/Navigation/History.sci", -1);
exec("C:/Users/Administrator/Documents/Scilab/Navigation/Navigation.sci", -1);
exec("C:/Users/Administrator/Documents/Scilab/Navigation/Break.sci", -1);
exec("C:/Users/Administrator/Documents/Scilab/Navigation/Estimation.sci", -1);
exec("C:/Users/Administrator/Documents/Scilab/Navigation/New target.sci", -1);
exec("C:/Users/Administrator/Documents/Scilab/Navigation/Correction.sci", -1);

    rand("seed", 42724);
    [tstate, estate, nav, target, dt, hist, bias,cor] = initSimulation();

    renderer=initRenderer(estate,tstate,target);


    for k = 1:hist.N
        nav = navigation(estate, target, nav);
        tstate = Simulationstep(tstate, nav, dt);
        estate = Estimationstep(estate, nav, dt, bias, cor);
        hist = History(hist, tstate, estate, nav, k);
        renderer = updateRenderer(renderer, hist, k);
        br = Break(estate);
        if modulo(k, 100) == 0 then
            disp("GPS update");
            estate=tstate;
            disp("Calculating correction");
            cor = correction(tstate, estate, hist, k, cor);
            disp("gyro bias chi: " + string(bias.gyrochi));
            disp("correction chi: "+ string(cor.chi));
            disp("gyro bias zeta: "+ string(bias.gyrozeta));
            disp("correction zeta: "+ string(cor.zeta));
        end
        if br then
            target = newtarget(renderer);
    end



end
showBiasInfo(bias, cor);
