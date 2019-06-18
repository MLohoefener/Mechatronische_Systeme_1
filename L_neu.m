% L_neu.m Lagrangesche Funktion mit GNU Octave
% 21.11.2017, Manfred Lohöfener, Leipzig
clear; 
% pkg load symbolic            % sicher ist sicher

m1_r = 0.2;             % [kg] Reelle Werte
m2_r = 0.4;             % [kg]
l_r  = 0.3;             % [m]
J_r  = m1_r*l_r^2*4/3;  % [kg.m²]
k_r  = 10;              % [N/m]
g_r  = 9.81;            % [m/s²] Erde
%g_r  = 9.81/6;          % [m/s²] Mond
%g_r  = 0;               % [m/s²] Orbit


syms g_s k_s m1_s m2_s J_s l_s real % Symbolische Konstanten
syms t x(t) phi(t)                  % Symbolische Variablen
v(t) = diff (x(t), t);              % Ableitungen
a(t) = diff (v(t), t);
omega(t) = diff (phi(t), t);
alpha(t) = diff (omega(t), t);
symbols = {g_s k_s m1_s m2_s J_s l_s};
values = {g_r k_r m1_r m2_r J_r l_r};

E_pK = k_s * x(t)^2;                % Potenzielle Energien
E_pS1 = l_s*g_s*m1_s* (1 - cos (phi(t)));
E_pS2 = g_s*m2_s* (l_s - (l_s+x(t))*cos (phi(t)));
E_p = E_pK + E_pS1 + E_pS2;

E_kJ = J_s/2 * omega(t)^2;          % Kinetische Energien
E_kTang = m2_s/2 * (l_s+x(t))^2 * omega(t)^2;
E_kRad = m2_s/2 * v(t)^2;
E_k = E_kJ + E_kTang + E_kRad;

L = E_k - E_p;                      % Lagrangesche Funktion
L_phi = diff (diff (L, omega(t)), t) - diff (L, phi(t)) == 0;
L_x =  simplify (diff (diff (L, v(t)), t) - diff (L, x(t)) == 0);
warning off
L_phi_real = simplify (vpa (subs (L_phi, symbols, values)));
L_x_real = simplify (vpa (subs (L_x, symbols, values)));
warning on
disp('L_phi')                       % Resultate
disp(L_phi)
disp('L_phi_real')
disp(L_phi_real)
disp('L_x')
disp(L_x)
disp('L_x_real')
disp(L_x_real)
