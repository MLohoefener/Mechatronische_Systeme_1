// Simulation eines fremderregten Gleichstrommotors GS-M_ZR.sce
// im Zustandsraum
// Vorgabe von J, Psi, Ra, La und MR1; Verwendung von MR1s
J=0.75e-3;	// kg m²
Psi=0.35;	// V s - ist gleich KT bzw. KE
Ra=0.95;	// Ohm
La=1.9e-3;	// H
MR1=70.6e-3;	// N m/1000 Upm
//MR0=0;	// N m  - trockene Reibung
MR0=0.18;	// N m  - trockene Reibung
ML0=1;		// N m  - Lastmoment
//ML0=0;		// N m  - Lastmoment
MR1s=MR1*60/(2*%pi*1000);	// Umrechnung in N m s
Ua0=10;		// V - Eingangssprung
//Ua0=0;		// V - Eingangssprung
UB=0.5;		// V - Buerstenspannung

// Zustandsraumbeschreibung bauen
A=[-Ra/La -Psi/La		// Systemmatrix
   Psi/J -MR1s/J];

B=[(Ua0-2*UB)/La   // Eingangsmatrix fuer Ankerspannungs- und Lastsprung
   -(ML0+MR0)/J];

C=[eye(2,2)
   zeros(2,2)];       // Ausgangsmatrix

D=[zeros(2,1)
   Ua0
   ML0];    // Durchgangsmatrix - Eingangsgroesse darstellen
   
GS_M=syslin('c',A,B,C,D);
instants=0:0.0001:0.05; // 50 ms Zeitbasis
y=csim('step',instants,GS_M);
xset("wdim",800,600);
xtitle("Simulation GS-Motor","Zeit t in s","Sprungantwort")
xgrid(32)		// Gitternetzlinien
plot2d(instants',y')	//y' heisst y transponiert
hl=legend('I','omega','Ua','ML');
