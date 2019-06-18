% Simulation eines fremderregten Gleichstrommotors GS_M_TF.m
% Vorgabe von J, Psi, R_A, L_A und M_R1; Verwendung von M_R1s

clear; close all

%% Daten
J = 0.75e-3;	% kg m²
Psi = 0.35;	% V s - ist gleich KT bzw. KE
R_A = 0.95;	% Ohm
L_A = 1.9e-3;	% H
M_R1 = 70.6e-3;	% N m/1000 Upm
M_R1s = M_R1*60/(2*pi*1000);	% Umrechnung in N m s
%M_R0 = 0.18;	% N m  - trockene Reibung
%M_L0 = 1;	% N m  - Lastmoment
%U_A0 = 10;	% V - Eingangssprung
%U_B = 0.5;	% V - Buerstenspannung

%% Übertragungsfunktionen
s = tf('s');    % Laplace-Operator
G_Uw = Psi / (Psi^2+M_R1s*R_A + (J*R_A + M_R1s*L_A)*s + J*L_A*s^2);

G_Ui = (M_R1s + J*s) / (Psi^2+M_R1s*R_A + (J*R_A + M_R1s*L_A)*s + J*L_A*s^2);

G_Mw = -(R_A + L_A*s) / (Psi^2+M_R1s*R_A + (J*R_A + M_R1s*L_A)*s + J*L_A*s^2);

G_Mi = Psi / (Psi^2+M_R1s*R_A + (J*R_A + M_R1s*L_A)*s + J*L_A*s^2);

G = [G_Uw G_Mw  % Eingangsvektor [U_A; M_L]
     G_Ui G_Mi] % Ausgangsvektor [omega; I_A]

%% Darstellungen
step (G)
print (gcf, [mfilename '-step' '.emf'], '-dmeta');
