
function [X,Y] = simulatee(v, omega, dt, N)
    funcprot(0);
x = 0;
y = 0;
theta = 0;
a = 0;
    X = zeros(1,N);
    Y = zeros(1,N);

    for k = 1:N

        x = x + dt*v*cos(theta);
        y = y + dt*v*sin(theta);

        v = v + dt*a;
        theta = theta + dt*omega;

        X(k) = x;
        Y(k) = y;

    end
    [xmin,d]=min(X);
    [xmax,d]=max(X);
    [ymin,d]=min(Y);
    [ymax,d]=max(Y);
    
    
    
clf();

plot(0,0);

a = gca();
a.data_bounds = [xmin ymin;
                 xmax ymax];

xgrid();

for k = 1:N

    clf();

    plot(X(1:k),Y(1:k));

    plot(X(k),Y(k),"ro");

    a = gca();
    a.data_bounds = [xmin ymin;
                     xmax ymax];

    xgrid();

    sleep(10);

end
endfunction
