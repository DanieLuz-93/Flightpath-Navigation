function renderer = initRenderer(estate,tstate,target)

    clf();

    renderer.figure = gcf();
    renderer.axes   = gca();
    
    scatter3d(0,0,0);
    renderer.beg = gce();
    renderer.beg.mark_foreground = color("green");
    renderer.beg.mark_background = color("green");
    renderer.beg.mark_size = 8;
    
    scatter3d(target.x,target.y,target.z);
    renderer.end = gce();
    renderer.end.mark_foreground = color("black");
    renderer.end.mark_background = color("black");
    renderer.end.mark_size = 8;

    xgrid();
    xmin = min(tstate.x, target.x) - 500;
    xmax = max(tstate.x, target.x) + 500;

    ymin = min(tstate.y, target.y) - 500;
    ymax = max(tstate.y, target.y) + 500;
    
    zmin = min(tstate.z, target.z) - 500;
    zmax = max(tstate.z, target.z) + 500;

    renderer.axes.data_bounds = [
    xmin ymin zmin
    xmax ymax zmax
    ];
    
    param3d([tstate.x], [tstate.y], [tstate.z]);

    renderer.curve = gce();
    renderer.curve.foreground = color("blue");
    renderer.curve.thickness = 2;
    
    param3d([estate.x], [estate.y], [estate.z]);

    renderer.curve2 = gce();
    renderer.curve2.foreground = color("red");
    renderer.curve2.thickness = 2;
    
    legend(["old target/start", "current target","true path", "estimated path"],"in_upper_right" );
    gca().children(1).marks_count = 1;
    

   
endfunction

function renderer = updateRenderer(renderer, hist, k)

    tx = matrix(hist.tx(1:k), k, 1);
    ty = matrix(hist.ty(1:k), k, 1);
    tz = matrix(hist.tz(1:k), k, 1);

    renderer.curve.data = [tx ty tz];
    
    ex = matrix(hist.ex(1:k), k, 1);
    ey = matrix(hist.ey(1:k), k, 1);
    ez = matrix(hist.ez(1:k), k, 1);

    renderer.curve2.data = [ex ey ez];

    drawnow();
    sleep(10);

endfunction



function showBiasInfo(bias, cor)

    txt = "<html>" + ...
          "gyro chi bias: " + string(bias.gyrochi) + "<br>" + ...
          "gyro chi correction: " + string(cor.chi) + "<br><br>" + ...
          "gyro zeta bias: " + string(bias.gyrozeta) + "<br>" + ...
          "gyro zeta correction: " + string(cor.zeta) + ...
          "</html>";

    uicontrol( ...
        "style", "text", ...
        "string", txt, ...
        "position", [20 350 170 90], ...
        "backgroundcolor", [1 1 1] ...
    );

endfunction

function saveFrame(k)

    if modulo(k, 5) == 0 then
        filename = msprintf("C:/Users/Administrator/Documents/Scilab/Navigation/frames/frame_%05d.png", k);
        xs2png(gcf(), filename);
    end

endfunction


