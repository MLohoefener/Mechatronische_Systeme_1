// Scilab-Programm 1Rad.sce
// M. Lohoefener, FH Merseburg, 26.5.2003
// ergaenzt 04.11.2003, 11.02.2008
// Dateneingabe
kA=32500;    // N/m
dA=10000;    // Ns/m
mA=1300;     // kg
kR=50000;    // N/m
mR=20;       // kg
xS=0.1;      // m, 10 cm
// Differenzialgleichungssystem bauen
M=[mA 0      // Massenmatrix
   0 mR];
D=[dA -dA    // Daempfungsmatrix
   -dA dA];
K=[kA -kA    // Steifigkeitsmarix
   -kA kR+kA];
Ke=[0
    kR*xS];   // hier erweitert um Eingangsgroesse!
// Transformation in Zustandsraum
[nr,nc]=size(M);
A=[zeros(nr,nc) eye(nr,nc)
   -inv(M)*K -inv(M)*D];
B=[zeros(nr,1)
   inv(M)*Ke];
C=[eye(nr,nc) zeros(nr,nc)    // x(t) und
//   zeros(nr,nc) eye(nr,nc)];  // v(t)
   zeros(nr,nc) eye(nr,nc)  // v(t)
   zeros(1,nc) zeros(1,nc)];  // u(t)
D_ZR=[zeros(nr,1)
      zeros(nr,1)
      eye(1,1)];
Einrad = syslin ('c', A, B, C, D_ZR);
instants=0:0.001:4;           // s, Zeitachse
y=csim('step',instants,Einrad);
//xbasc()                     // alte Grafik loeschen
xtitle("Simulation Einrad","Zeit t in s","Sprungantwort")
xgrid(32)                     // Gitternetzlinien
plot2d(instants',y')          // y' heisst y transponiert
hl=legend('xA','xR','vA','vR','u(t)');
