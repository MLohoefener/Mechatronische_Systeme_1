% DGl.m – M-Skript zur Untersuchung von DGl 2. Ordnung
% © Manfred Lohöfener, HS Merseburg, 08.05.2014
% getestet mit GNU Octave + Control sowie MATLAB + CST

clear; close all	% sicher ist sicher

K = 1.0;	% Verstärkung
T = 1.0;	% s – Kennzeitkonstante

% Kenndämpfungen D
D1 = 1.5;	% aperiodisch
D2 = 1.0;	% aperiodischer Grenzfall
D3 = 1/sqrt(2);	% Resonanzgrenzfall D = 0.71
D4 = 0.3;	% periodisch
D5 = 0.0;	% ungedämpft
D6 = -0.3;	% ungedämpft

s = tf('s');	% Laplace-Op bauen
t = 0.0: 0.01: 10;	% s – Zeitbereich
f = 0.1: 0.01: 10;	% rad/s – Frequenzbereich

Gs1 = K / (T^2*s^2 + 2*D1*T*s + 1);
Gs2 = K / (T^2*s^2 + 2*D2*T*s + 1);
Gs3 = K / (T^2*s^2 + 2*D3*T*s + 1);
Gs4 = K / (T^2*s^2 + 2*D4*T*s + 1);
Gs5 = K / (T^2*s^2 + 2*D5*T*s + 1);
Gs6 = K / (T^2*s^2 + 2*D6*T*s + 1);

figure(1)
plot(t, step(Gs1, t), t, step(Gs2, t), t, step(Gs3, t), t, step(Gs4, t), t, step(Gs5, t), t, step(Gs6, t))
title('P-T2*-System')
ylim([-1 4])
xlabel('Zeit in s')
ylabel('Verlauf')
legend('D = 1.5', 'D = 1.0', 'D = 0.71', 'D = 0.3', 'D = 0.0', 'D = -0.3')
grid ('on')

figure(2)
bode(Gs1, Gs2, Gs3, Gs4, Gs5, Gs6, f)
title('P-T2*-System')
legend('D = 1.5', 'D = 1.0', 'D = 0.71', 'D = 0.3', 'D = 0.0', 'D = -0.3')
grid ('on')
