# Mechatronische Systeme 1

## Skripte zu Vorlesungen Mechatronische Systeme 1 an der Hochschule Merseburg

**Voraussetzungen**: PC mit

1. MATLAB® und Control Systems Toolbox für M-Skripte bzw. Funktionen
2. MATLAB® und Simulink® für SLX-Blockdiagramme
3. https://www.octave.org und `pkg install -forge control symbolic; pkg load control symbolic` für M-Skripte bzw. Funktionen
4. https://www.scilab.org/ für Scilab-Skripte SCE oder Scilab-Funktionen SCI bzw. XCOS- oder ZCOS-Blockdiagramme
5. http://wxmaxima.sourceforge.net für wxMaxima-Batch-Dateien WXM

**Datei**|**Beschreibung**
---|---
**1Rad.sce**|Scilab-Skript zur Modellierung eines Einrads mit Differenzialgleichungssystem und Zustandsraum
**2Rad-x-v.sce**|Scilab-Skript zur Modellierung eines Zweirads mit Positionen und Geschwindigkeiten
**2Rad.sce**|Scilab-Skript zur Modellierung eines Zweirads mit Differenzialgleichungssystem und Zustandsraum
**DC-mot-tf.wxm**|wxMaxima-Batch-Datei zur Modellierung eines Gleichstrommotors mit Übertragungsfunktionen
**DC_contr_ZN.m**|Controlled DC motor RE 35 from Maxon
**DC_mot_TF.m**|M-Skript zur Modellierung eines Gleichstrommotors mit Übertragungsfunktionen
**DC_mot_ZR.m**|M-Skript zur Modellierung eines Gleichstrommotors im Zustandsraum
**DGl.m**|M-Skript zur Untersuchung von Differenzialgleichungen 2. Ordnung
**Einrad.m**|M-Skript-Funktion zur Modellierung eines Einrads mit Übertragungsfunktionen
**Einrad.sce**|Scilab-Skript zur Modellierung eines Einrads mit Übertragungsfunktionen
**Einrad.xcos**|Xcos-Blockdiagramm eines Einrads im Zeitbereich
**Einrad_G(s).zcos**|Xcos-Blockdiagramm eines Einrads mit Übertragungsfunktionen
**Einrad_ZR.m**|M-Skript zur Modellierung eines Einrads im Zustandsraum
**ElemUebertr.m**|M-Skript zur Modellierung elementarer Übertragungsglieder / Übergangsfunktionen à la carte
**GS_M_TF.m**|M-Skript zur Modellierung eines Gleichstrommotors mit Übertragungsfunktionen
**GS_M_ZR.m**|M-Skript zur Modellierung eines Gleichstrommotors im Zustandsraum
**L-neu.wxm**|wxMaxima-Batch-Datei zur symbolischen Lösung der Lagrange-Funktion eines Röhrenpendels mit einer eingeschlossenen Masse an Federn
**L-neu.m**|M-Skript zur symbolischen Lösung der Lagrange-Funktion eines Röhrenpendels mit einer eingeschlossenen Masse an Federn mit Octave
**RK_kont_CHR.m**|Kontinuierlicher Regelkreis
**Rohrpendel.slx**|Simulink-Blockdiagramm eines Röhrenpendels mit einer eingeschlossenen Masse an Federn
**Signale.m**|M-Skript zur Darstellung von determinierten und stochastischen Signalen
**Uebg_1.xcos**|Xcos-Blockdiagramm zur Füllstandsregelung im Tank
**Zweimassen-Lagrange.wxm**|wxMaxima-Batch-Datei zur symbolischen Lösung der Lagrange-Funktion eines Zweimassensystems
**cont2dis.m**|M-Skript zur Z-Transformation mit MATLAB / Octave
**coordgrd.m**|Draw x y coordinate system and grid in current figure
**elt-mot-dat.sce**|Scilab-Skript mit Daten zur Simulation eines fremderregten Gleichstrommotors
**elt-mot.sce**|Scilab-Skript zur Simulation eines fremderregten Gleichstrommotors
**printgcf.m**|M-Skript-Funktion: Draw x y coordinate system and grid in current figure. Choose minor grid (or not). Print current figure as SVG Scalable Vector Graphic or as EMF Enhanced Metafile
