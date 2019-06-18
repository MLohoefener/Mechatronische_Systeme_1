// Simulation eines fremderregten Gleichstrommotors elt-mot.sce
// Vorgabe von J, Psi, Ra, La und MR1; Verwendung von K, T, D und MR1s
//
// Datenaufbereitung
//
MR1s=MR1*60/(2*%pi*1000);			// Umrechnung in N m s
K=Psi/(Psi^2+MR1s*Ra);
T=1000*sqrt(J*La/(Psi^2+MR1s*Ra));	// in ms
D=(J*Ra+MR1s*La)/(2*sqrt(J*La*(Psi^2+MR1s*Ra)));
//
// Beginn der Simulation
//
s=poly(0,'s');				// Laplace-Operator bauen
G11=syslin('c',K/(T^2*s^2+2*D*T*s+1));	// lineares System bestimmen
instants=0:0.5:50;			// Zeitachse bauen von 0 bis 50 ms
y=csim('step',instants,G11);    // Sprungantwort simulieren
//
// Darstellung der Verläufe
//
clf;		        			// alte Grafik löschen
xset("font size",4)
xtitle("Simulation  fremderregter  Gleichstrommotor","Zeit  [ms]","Sprungantwort  Drehzahl")
plot2d(instants',y',2)			// Verlauf zeichnen
xgrid(32)				// Gitternetzlinien
xstring(10,1,['K = '+string(K);'D = '+string(D);'T = '+string(T)+' ms'])
hl=legend('omega'); 
