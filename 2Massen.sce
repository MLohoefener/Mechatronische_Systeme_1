// Dateneingabe
kA=32500;
dA=0;
mA=1300;
kR=50000;
mR=20;
xS=1;
// Differenzialgleichungssystem bauen
M=[mA 0
   0 mR];
D=[dA -dA
   -dA dA];
K=[kA -kA
   -kA kR+kA];
Ke=[0
    kR];
// Transformation in Zustandsraum
[nr,nc]=size(M);
A=[zeros(nr,nc) eye(nr,nc)
   -inv(M)*K -inv(M)*D];
B=[zeros(nr,1)
   inv(M)*Ke];
C=[eye(nr,nc) zeros(nr,nc)];
//D=[zeros(nc,1)];
System=syslin('c',A,B,C);
instants=0:0.01:4;
y=csim('step',instants,System);
clf;                      // alte Grafik löschen
xtitle("Simulation Zweimassensystem","Zeit t in s","Sprungantwort");
xgrid(32);                // Gitternetzlinien
plot2d(instants',y');     //y' hei� y transponiert
hl=legend('xA','xR',1);
