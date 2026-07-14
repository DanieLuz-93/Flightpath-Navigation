function target=newtarget(renderer)
    bounds = renderer.axes.data_bounds;
    target.x = rand() * 1000;
    target.y = rand() * 1000;
    target.z = rand() * 1000;
    renderer.beg.data = renderer.end.data;
    renderer.end.data = [target.x, target.y, target.z];
endfunction
