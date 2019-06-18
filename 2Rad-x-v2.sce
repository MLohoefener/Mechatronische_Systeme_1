// Scilab-Programm Zweirad 2Rad.sci
// M. Lohoefener, FH Merseburg, 16.5.2003
k1 = 35000;		// N/m, etwa 70 kg auf 2 cm
d1 = 1000;		// ausprobiert
k2 = 40000;		// N/m, etwas härter als k1
d2 = 1500;		// ausprobiert
k3 = 140000;		// N/m, etwa 70 kg auf 5 mm
k4 = 180000;		// N/m, etwas haerter als k3
ma = 270;			// kg
m1 = 7;			// kg
m2 = 9;			// kg
js = ma*(1.5^2+0.5^2)/12;	// Masse gedacht als Quader 1,5 x 0,5 m
a = 1.2;			// m
b = 0.8;			// m
u1 = 1;			// Bordsteinkante vorn
u2 = 0;			// Bordsteinkante hinten
M = [ma 0 0 0			// Massenmatrix
   0 js 0 0
   0 0 m1 0
   0 0 0 m2];
Ds = [d1+d2     a*d1-b*d2     -d1   -d2	// Daempfungsmatrix
    a*d1-b*d2 a^2*d1+b^2*d2 -a*d1 b*d2
    -d1       -a*d1         d1    0
    -d2       b*d2          0     d2];
K = [k1+k2     a*k1-b*k2     -k1   -k2	// Steifigkeitsmatrix
   a*k1-b*k2 a^2*k1+b^2*k2 -a*k1 b*k2
   -k1       -a*k1         k1+k3 0
   -k2       b*k2          0     k2+k4];
Ke = [0				// einwirkende Kraefte
    0
    k3*u1
    k4*u2];
// formalisierte Simulation, Ordnungen anpassen!
A = [zeros(4,4) eye(4,4)		// Systemmatrix
   -inv(M)*K  -inv(M)*Ds];
B = [zeros(4,1)			// Eingangsmatrix (mit Kraeften)
   inv(M)*Ke];
C = [eye(4,4) zeros(4,4)
  zeros(4,4) eye(4,4)];	// Ausgangsmatrix
//D = [zeros(4,4)];			// Durchgangsmatrix
Zweirad = syslin('c',A,B,C);
instants = 0:0.001:2;		// Zeitachse 0 bis 2 s in 1-ms-Schritten
y = csim('step',instants,Zweirad);
// xbasc()				// alte Grafik loeschen
xset("font",2,4)		// groesserer Font
xtitle("Simulation Zweirad","Zeit t in s","Sprungantwort")
xgrid(32)			// Gitternetzlinien
plot2d(instants',y')		// y' heisst y transponiert
hl = legend('xs','phi','x1','x2','dxs','dphi','dx1','dx2')
