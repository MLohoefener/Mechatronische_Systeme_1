% Einrad_ZR.m – getestet mit MATLAB + CST sowie GNU Octave + Control
% Manfred Lohöfener, HS Merseburg, 27.10.2015
    clear; close all
    
% Parameter
    ka = 32500;	% N/m
    da = 10000;	% Ns/m
    ma = 1300;	% kg
    kr = 50000;	% N/m
    mr = 20.0;	% kg
    x_s= 0.1;   % [m] Stufe
    
% Differenzialgleichungssystem
    M = [ma 0
         0 mr];   
    D = [da -da
         -da da];
    K = [ka -ka
         -ka kr+ka];
    Ke = [0
          kr*x_s];
    
% Transformation in Zustandsraum
    [nr, nc] = size (M);
    A = [zeros(nr, nc) eye(nr, nc)
         -M\K -M\D];       
    B = [zeros(nr, 1)
         M\Ke];       
    C=[eye(nr, nc) zeros(nr, nc)
       zeros(nr, nc) eye(nr, nc)
       zeros(1, nc) zeros(1, nc)];
    D_ZR=[zeros(nr,1)
          zeros(nr,1)
          x_s];

    Einrad = ss (A, B, C, D_ZR);
    [y,t] = step (Einrad);
    plot(t, y);			% und darstellen
    title ('Einrad')
    xlabel ('Zeit [s]')
    ylabel ('Positionen und Geschwindigkeiten')
    legend ('x_A(t)', 'x_R(t)', 'v_A(t)', 'v_R(t)', 'x_s(t)')
    printgcf (mfilename, 0)
