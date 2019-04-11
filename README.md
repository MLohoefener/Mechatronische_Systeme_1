# Mechatronische_Systeme_1

## Skripte zu Vorlesungen Mechatronische Systeme 1 an der Hochschule Merseburg

**Voraussetzungen**: PC mit

1. MATLAB® und Control Systems Toolbox für M-Skripte bzw. Funktionen
2. MATLAB® und Simulink® für SLX-Modelle
3. https://www.octave.org und `pkg install -forge control symbolic; pkg load control symbolic` für M-Skripte bzw. Funktionen
4. https://www.scilab.org/ für SCE-Skripte oder SCI-Funktionen bzw. XCOS- oder ZCOS-Modelle
5. http://wxmaxima.sourceforge.net für WXM-Skripte

**Datei**|**Beschreibung**
---|---
**Einrad.xcos**|Xcos-Modell des Einrads im Zeitbereich
**Einrad_G(s).zcos**|Xcos-Modells des Einrads mit Übertragungsfunktionen
**Einrad.m**|Modell des Einrads als M-Skript-Funktion mit Übertragungsfunktionen
**Einrad.sce**|Modell des Einrads als Scilab-Skript mit Übertragungsfunktionen
**Einrad_ZR.m**|Modell des Einrads als M-Skript im Zustandsraum
**L-neu.wxm**|Lagrange-Beschreibung eines Röhrenpendels mit einer eingeschlossenen Masse an Federn
**DGl.m**|M-Skript zur Untersuchung von DGl 2. Ordnung
**Uebg_1.xcos**|Xcos-Modell zur Füllstandsregelung im Tank
**printgcf.m**|MATLAB-Funktion: Draw x y coordinate system and grid in current figure. Choose minor grid (or not). Print current figure as SVG Scalable Vector Graphic or as EMF Enhanced Metafile
