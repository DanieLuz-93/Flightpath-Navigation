function hist =History(hist,tstate,estate,nav,k)
    hist.tx(k) = tstate.x;
    hist.ty(k) = tstate.y;
    hist.tz(k) = tstate.z;
    
    hist.ex(k) = estate.x;
    hist.ey(k) = estate.y;
    hist.ez(k) = estate.z;
    
    
endfunction
