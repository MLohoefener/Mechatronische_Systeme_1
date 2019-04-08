// Unicycle Einrad.sce
// M. Lohoefener, HS Merseburg, 13.2.2008
// Parameter
ka=32500;	// N/m
da=10000;	// Ns/m
ma=1300;	// kg
kr=50000;	// N/m
mr=20;		// kg

// Transfer functions
s=poly(0,'s');
Gsr=syslin('c',kr/(mr*s^2+da*s+kr+ka));
Gar=syslin('c',(da*s+ka)/(mr*s^2+da*s+kr+ka));
Gra=syslin('c',(da*s+ka)/(ma*s^2+da*s+ka));

// System
Gsa=Gsr*Gra/(1-Gra*Gar);

// Presentation
instants=0:0.01:4;
y=csim('step',instants,Gsa);
clf();					// clear old graphic
xset("font size",4);
xtitle("Step answer h(t)","Time t [s]","Deflection");
xgrid(32);				// Grid
plot2d(instants',y',2);
legend('xA');


