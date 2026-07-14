function br=Break(estate)   
    
    dx = target.x - estate.x;
    dy = target.y - estate.y;
    dz = target.z - estate.z;

    distance = sqrt(dx^2 + dy^2 + dz^2);

    br= distance < 10
endfunction    
