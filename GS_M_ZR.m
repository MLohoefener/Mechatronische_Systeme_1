% Simulation eines fremderregten Gleichstrommotors GS-M_ZR.m
% im Zustandsraum
% Vorgabe von J, Psi, R_A, L_A und M_R1; Verwendung von M_R1s

J=0.75e-3;	% kg m²
Psi=0.35;	  % V s - ist gleich KT bzw. KE
R_A=0.95;	  % Ohm
L_A=1.9e-3;	% H
M_R1=70.6e-3;	% N m/1000 Upm
%M_R0=0;	% N m  - trockene Reibung
M_R0=0.18;	% N m  - trockene Reibung
M_L0=1;     % N m  - Lastmoment
%M_L0=0;		% N m  - Lastmoment
M_R1s=M_R1*60/(2*pi*1000);	% Umrechnung in N m s
U_A0 = 10;	% V - Eingangssprung
%U_A0=0;		% V - Eingangssprung
U_B=0.5;		% V - Buerstenspannung

% Zustandsraumbeschreibung bauen
A=[-R_A/L_A -Psi/L_A		% Systemmatrix
   Psi/J -M_R1s/J];

B=[(U_A0-2*U_B)/L_A   % Eingangsmatrix fuer Ankerspannungs- und Lastsprung
   -(M_L0+M_R0)/J];

C=[eye(2,2)
   zeros(2,2)];       % Ausgangsmatrix

D=[zeros(2,1)
   U_A0
   M_L0];    % Durchgangsmatrix - Eingangsgroesse darstellen
   
GS_M=ss(A,B,C,D);
instants=0:0.0001:0.05; % 50 ms Zeitbasis
step (GS_M, instants);
[NUM, DEN] = ss2tf (GS_M);
