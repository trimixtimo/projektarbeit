data = load("rawData.mat");

%Speicherung der gefilterten und RMS geglätteten Signale als seperate
%Variablen, für jede Testperson und jede Intensität.
%% Linus
%---50W----
%Rohdaten werden hochpassgefiltert, wodurch alle Frequenzen unter 10Hz aus
%dem Signal entfernt werden. Als Filterfunktion wird die MATLAB-Funktion
%"highpass" genutzt.
F_M050W_1_Lin = highpass(data.M050W_1_Lin,10,10000); 
F_M050W_2_Lin = highpass(data.M050W_2_Lin,10,10000);
F_M050W_3_Lin = highpass(data.M050W_3_Lin,10,10000);
F_M050W_4_Lin = highpass(data.M050W_4_Lin,10,10000);
F_M050W_5_Lin = highpass(data.M050W_5_Lin,10,10000);
%Hochpassgefilterte Daten werden zusätzlich tiefpassgefiltert, was im
%Endeffekt einer Bandpassfilterung gleichkommt. Alle Frequenzen über 500Hz
%werden aus dem Signal entfernt. Als Filterfunktion wird die MATLAB-Funktion
%"lowpass" genutzt.Außerdem wird der Betrag gebildet,wodurch
%die Messungen gleichgerichtet werden. 
FG_M050W_1_Lin = abs(lowpass(F_M050W_1_Lin(7501:287500),500,10000)); 
FG_M050W_2_Lin = abs(lowpass(F_M050W_2_Lin(7501:287500),500,10000));
FG_M050W_3_Lin = abs(lowpass(F_M050W_3_Lin(7501:287500),500,10000));
FG_M050W_4_Lin = abs(lowpass(F_M050W_4_Lin(7501:287500),500,10000));
FG_M050W_5_Lin = abs(lowpass(F_M050W_5_Lin(7501:287500),500,10000));
%Die Daten werden mit der Berechnung der durchschnittlichen Quadratwurzel
%geglättet (Root Mean Square). Die Berechnung wurde in einer externen
%Funktion selbst programmiert. Als Zeitintervall für die Berechnung wurden
%150ms gewählt.
RMS_M050W_1_Lin = RMS_calculation(FG_M050W_1_Lin);
RMS_M050W_2_Lin = RMS_calculation(FG_M050W_2_Lin);
RMS_M050W_3_Lin = RMS_calculation(FG_M050W_3_Lin);
RMS_M050W_4_Lin = RMS_calculation(FG_M050W_4_Lin);
RMS_M050W_5_Lin = RMS_calculation(FG_M050W_5_Lin);
%---100W----
F_M100W_1_Lin = highpass(data.M100W_1_Lin,10,10000);
F_M100W_2_Lin = highpass(data.M100W_2_Lin,10,10000);
F_M100W_3_Lin = highpass(data.M100W_3_Lin,10,10000);
F_M100W_4_Lin = highpass(data.M100W_4_Lin,10,10000);
F_M100W_5_Lin = highpass(data.M100W_5_Lin,10,10000);
FG_M100W_1_Lin = abs(lowpass(F_M100W_1_Lin(7501:287500),500,10000));
FG_M100W_2_Lin = abs(lowpass(F_M100W_2_Lin(7501:287500),500,10000));
FG_M100W_3_Lin = abs(lowpass(F_M100W_3_Lin(7501:287500),500,10000));
FG_M100W_4_Lin = abs(lowpass(F_M100W_4_Lin(7501:287500),500,10000));
FG_M100W_5_Lin = abs(lowpass(F_M100W_5_Lin(7501:287500),500,10000));
RMS_M100W_1_Lin = RMS_calculation(FG_M100W_1_Lin);
RMS_M100W_2_Lin = RMS_calculation(FG_M100W_2_Lin);
RMS_M100W_3_Lin = RMS_calculation(FG_M100W_3_Lin);
RMS_M100W_4_Lin = RMS_calculation(FG_M100W_4_Lin);
RMS_M100W_5_Lin = RMS_calculation(FG_M100W_5_Lin);
%---150W----
F_M150W_1_Lin = highpass(data.M150W_1_Lin,10,10000);
F_M150W_2_Lin = highpass(data.M150W_2_Lin,10,10000);
F_M150W_3_Lin = highpass(data.M150W_3_Lin,10,10000);
F_M150W_4_Lin = highpass(data.M150W_4_Lin,10,10000);
F_M150W_5_Lin = highpass(data.M150W_5_Lin,10,10000);
FG_M150W_1_Lin = abs(lowpass(F_M150W_1_Lin(7501:287500),500,10000));
FG_M150W_2_Lin = abs(lowpass(F_M150W_2_Lin(7501:287500),500,10000));
FG_M150W_3_Lin = abs(lowpass(F_M150W_3_Lin(7501:287500),500,10000));
FG_M150W_4_Lin = abs(lowpass(F_M150W_4_Lin(7501:287500),500,10000));
FG_M150W_5_Lin = abs(lowpass(F_M150W_5_Lin(7501:287500),500,10000));
RMS_M150W_1_Lin = RMS_calculation(FG_M150W_1_Lin);
RMS_M150W_2_Lin = RMS_calculation(FG_M150W_2_Lin);
RMS_M150W_3_Lin = RMS_calculation(FG_M150W_3_Lin);
RMS_M150W_4_Lin = RMS_calculation(FG_M150W_4_Lin);
RMS_M150W_5_Lin = RMS_calculation(FG_M150W_5_Lin);
%---200W----
F_M200W_1_Lin = highpass(data.M200W_1_Lin,10,10000);
F_M200W_2_Lin = highpass(data.M200W_2_Lin,10,10000);
F_M200W_3_Lin = highpass(data.M200W_3_Lin,10,10000);
F_M200W_4_Lin = highpass(data.M200W_4_Lin,10,10000);
F_M200W_5_Lin = highpass(data.M200W_5_Lin,10,10000);
FG_M200W_1_Lin = abs(lowpass(F_M200W_1_Lin(7501:287500),500,10000)); 
FG_M200W_2_Lin = abs(lowpass(F_M200W_2_Lin(7501:287500),500,10000));
FG_M200W_3_Lin = abs(lowpass(F_M200W_3_Lin(7501:287500),500,10000));
FG_M200W_4_Lin = abs(lowpass(F_M200W_4_Lin(7501:287500),500,10000));
FG_M200W_5_Lin = abs(lowpass(F_M200W_5_Lin(7501:287500),500,10000));
RMS_M200W_1_Lin = RMS_calculation(FG_M200W_1_Lin);
RMS_M200W_2_Lin = RMS_calculation(FG_M200W_2_Lin);
RMS_M200W_3_Lin = RMS_calculation(FG_M200W_3_Lin);
RMS_M200W_4_Lin = RMS_calculation(FG_M200W_4_Lin);
RMS_M200W_5_Lin = RMS_calculation(FG_M200W_5_Lin);
%% Lucas
%---50W----
F_M050W_1_Luc = highpass(data.M050W_1_Luc,10,10000); 
F_M050W_2_Luc = highpass(data.M050W_2_Luc,10,10000);
F_M050W_3_Luc = highpass(data.M050W_3_Luc,10,10000);
F_M050W_4_Luc = highpass(data.M050W_4_Luc,10,10000);
F_M050W_5_Luc = highpass(data.M050W_5_Luc,10,10000);
FG_M050W_1_Luc = abs(lowpass(F_M050W_1_Luc(7501:287500),500,10000)); 
FG_M050W_2_Luc = abs(lowpass(F_M050W_2_Luc(7501:287500),500,10000));
FG_M050W_3_Luc = abs(lowpass(F_M050W_3_Luc(7501:287500),500,10000));
FG_M050W_4_Luc = abs(lowpass(F_M050W_4_Luc(7501:287500),500,10000));
FG_M050W_5_Luc = abs(lowpass(F_M050W_5_Luc(7501:287500),500,10000));
RMS_M050W_1_Luc = RMS_calculation(FG_M050W_1_Luc);
RMS_M050W_2_Luc = RMS_calculation(FG_M050W_2_Luc);
RMS_M050W_3_Luc = RMS_calculation(FG_M050W_3_Luc);
RMS_M050W_4_Luc = RMS_calculation(FG_M050W_4_Luc);
RMS_M050W_5_Luc = RMS_calculation(FG_M050W_5_Luc);
%---100W----
F_M100W_1_Luc = highpass(data.M100W_1_Luc,10,10000);
F_M100W_2_Luc = highpass(data.M100W_2_Luc,10,10000);
F_M100W_3_Luc = highpass(data.M100W_3_Luc,10,10000);
F_M100W_4_Luc = highpass(data.M100W_4_Luc,10,10000);
F_M100W_5_Luc = highpass(data.M100W_5_Luc,10,10000);
FG_M100W_1_Luc = abs(lowpass(F_M100W_1_Luc(7501:287500),500,10000));
FG_M100W_2_Luc = abs(lowpass(F_M100W_2_Luc(7501:287500),500,10000));
FG_M100W_3_Luc = abs(lowpass(F_M100W_3_Luc(7501:287500),500,10000));
FG_M100W_4_Luc = abs(lowpass(F_M100W_4_Luc(7501:287500),500,10000));
FG_M100W_5_Luc = abs(lowpass(F_M100W_5_Luc(7501:287500),500,10000));
RMS_M100W_1_Luc = RMS_calculation(FG_M100W_1_Luc);
RMS_M100W_2_Luc = RMS_calculation(FG_M100W_2_Luc);
RMS_M100W_3_Luc = RMS_calculation(FG_M100W_3_Luc);
RMS_M100W_4_Luc = RMS_calculation(FG_M100W_4_Luc);
RMS_M100W_5_Luc = RMS_calculation(FG_M100W_5_Luc);
%---150W----
F_M150W_1_Luc = highpass(data.M150W_1_Luc,10,10000);
F_M150W_2_Luc = highpass(data.M150W_2_Luc,10,10000);
F_M150W_3_Luc = highpass(data.M150W_3_Luc,10,10000);
F_M150W_4_Luc = highpass(data.M150W_4_Luc,10,10000);
F_M150W_5_Luc = highpass(data.M150W_5_Luc,10,10000);
FG_M150W_1_Luc = abs(lowpass(F_M150W_1_Luc(7501:287500),500,10000));
FG_M150W_2_Luc = abs(lowpass(F_M150W_2_Luc(7501:287500),500,10000));
FG_M150W_3_Luc = abs(lowpass(F_M150W_3_Luc(7501:287500),500,10000));
FG_M150W_4_Luc = abs(lowpass(F_M150W_4_Luc(7501:287500),500,10000));
FG_M150W_5_Luc = abs(lowpass(F_M150W_5_Luc(7501:287500),500,10000));
RMS_M150W_1_Luc = RMS_calculation(FG_M150W_1_Luc);
RMS_M150W_2_Luc = RMS_calculation(FG_M150W_2_Luc);
RMS_M150W_3_Luc = RMS_calculation(FG_M150W_3_Luc);
RMS_M150W_4_Luc = RMS_calculation(FG_M150W_4_Luc);
RMS_M150W_5_Luc = RMS_calculation(FG_M150W_5_Luc);
%---200W----
F_M200W_1_Luc = highpass(data.M200W_1_Luc,10,10000);
F_M200W_2_Luc = highpass(data.M200W_2_Luc,10,10000);
F_M200W_3_Luc = highpass(data.M200W_3_Luc,10,10000);
F_M200W_4_Luc = highpass(data.M200W_4_Luc,10,10000);
F_M200W_5_Luc = highpass(data.M200W_5_Luc,10,10000);
FG_M200W_1_Luc = abs(lowpass(F_M200W_1_Luc(7501:287500),500,10000)); 
FG_M200W_2_Luc = abs(lowpass(F_M200W_2_Luc(7501:287500),500,10000));
FG_M200W_3_Luc = abs(lowpass(F_M200W_3_Luc(7501:287500),500,10000));
FG_M200W_4_Luc = abs(lowpass(F_M200W_4_Luc(7501:287500),500,10000));
FG_M200W_5_Luc = abs(lowpass(F_M200W_5_Luc(7501:287500),500,10000));
RMS_M200W_1_Luc = RMS_calculation(FG_M200W_1_Luc);
RMS_M200W_2_Luc = RMS_calculation(FG_M200W_2_Luc);
RMS_M200W_3_Luc = RMS_calculation(FG_M200W_3_Luc);
RMS_M200W_4_Luc = RMS_calculation(FG_M200W_4_Luc);
RMS_M200W_5_Luc = RMS_calculation(FG_M200W_5_Luc);
%% Meenu
%---50W----
F_M050W_1_Mee = highpass(data.M050W_1_Mee,10,10000); 
F_M050W_2_Mee = highpass(data.M050W_2_Mee,10,10000);
F_M050W_3_Mee = highpass(data.M050W_3_Mee,10,10000);
F_M050W_4_Mee = highpass(data.M050W_4_Mee,10,10000);
F_M050W_5_Mee = highpass(data.M050W_5_Mee,10,10000);
FG_M050W_1_Mee = abs(lowpass(F_M050W_1_Mee(7501:287500),500,10000)); 
FG_M050W_2_Mee = abs(lowpass(F_M050W_2_Mee(7501:287500),500,10000));
FG_M050W_3_Mee = abs(lowpass(F_M050W_3_Mee(7501:287500),500,10000));
FG_M050W_4_Mee = abs(lowpass(F_M050W_4_Mee(7501:287500),500,10000));
FG_M050W_5_Mee = abs(lowpass(F_M050W_5_Mee(7501:287500),500,10000));
RMS_M050W_1_Mee = RMS_calculation(FG_M050W_1_Mee);
RMS_M050W_2_Mee = RMS_calculation(FG_M050W_2_Mee);
RMS_M050W_3_Mee = RMS_calculation(FG_M050W_3_Mee);
RMS_M050W_4_Mee = RMS_calculation(FG_M050W_4_Mee);
RMS_M050W_5_Mee = RMS_calculation(FG_M050W_5_Mee);
%---100W----
F_M100W_1_Mee = highpass(data.M100W_1_Mee,10,10000);
F_M100W_2_Mee = highpass(data.M100W_2_Mee,10,10000);
F_M100W_3_Mee = highpass(data.M100W_3_Mee,10,10000);
F_M100W_4_Mee = highpass(data.M100W_4_Mee,10,10000);
F_M100W_5_Mee = highpass(data.M100W_5_Mee,10,10000);
FG_M100W_1_Mee = abs(lowpass(F_M100W_1_Mee(7501:287500),500,10000));
FG_M100W_2_Mee = abs(lowpass(F_M100W_2_Mee(7501:287500),500,10000));
FG_M100W_3_Mee = abs(lowpass(F_M100W_3_Mee(7501:287500),500,10000));
FG_M100W_4_Mee = abs(lowpass(F_M100W_4_Mee(7501:287500),500,10000));
FG_M100W_5_Mee = abs(lowpass(F_M100W_5_Mee(7501:287500),500,10000));
RMS_M100W_1_Mee = RMS_calculation(FG_M100W_1_Mee);
RMS_M100W_2_Mee = RMS_calculation(FG_M100W_2_Mee);
RMS_M100W_3_Mee = RMS_calculation(FG_M100W_3_Mee);
RMS_M100W_4_Mee = RMS_calculation(FG_M100W_4_Mee);
RMS_M100W_5_Mee = RMS_calculation(FG_M100W_5_Mee);
%---150W----
F_M150W_1_Mee = highpass(data.M150W_1_Mee,10,10000);
F_M150W_2_Mee = highpass(data.M150W_2_Mee,10,10000);
F_M150W_3_Mee = highpass(data.M150W_3_Mee,10,10000);
F_M150W_4_Mee = highpass(data.M150W_4_Mee,10,10000);
F_M150W_5_Mee = highpass(data.M150W_5_Mee,10,10000);
FG_M150W_1_Mee = abs(lowpass(F_M150W_1_Mee(7501:287500),500,10000));
FG_M150W_2_Mee = abs(lowpass(F_M150W_2_Mee(7501:287500),500,10000));
FG_M150W_3_Mee = abs(lowpass(F_M150W_3_Mee(7501:287500),500,10000));
FG_M150W_4_Mee = abs(lowpass(F_M150W_4_Mee(7501:287500),500,10000));
FG_M150W_5_Mee = abs(lowpass(F_M150W_5_Mee(7501:287500),500,10000));
RMS_M150W_1_Mee = RMS_calculation(FG_M150W_1_Mee);
RMS_M150W_2_Mee = RMS_calculation(FG_M150W_2_Mee);
RMS_M150W_3_Mee = RMS_calculation(FG_M150W_3_Mee);
RMS_M150W_4_Mee = RMS_calculation(FG_M150W_4_Mee);
RMS_M150W_5_Mee = RMS_calculation(FG_M150W_5_Mee);
%---200W----
F_M200W_1_Mee = highpass(data.M200W_1_Mee,10,10000);
F_M200W_2_Mee = highpass(data.M200W_2_Mee,10,10000);
F_M200W_3_Mee = highpass(data.M200W_3_Mee,10,10000);
F_M200W_4_Mee = highpass(data.M200W_4_Mee,10,10000);
F_M200W_5_Mee = highpass(data.M200W_5_Mee,10,10000);
FG_M200W_1_Mee = abs(lowpass(F_M200W_1_Mee(7501:287500),500,10000)); 
FG_M200W_2_Mee = abs(lowpass(F_M200W_2_Mee(7501:287500),500,10000));
FG_M200W_3_Mee = abs(lowpass(F_M200W_3_Mee(7501:287500),500,10000));
FG_M200W_4_Mee = abs(lowpass(F_M200W_4_Mee(7501:287500),500,10000));
FG_M200W_5_Mee = abs(lowpass(F_M200W_5_Mee(7501:287500),500,10000));
RMS_M200W_1_Mee = RMS_calculation(FG_M200W_1_Mee);
RMS_M200W_2_Mee = RMS_calculation(FG_M200W_2_Mee);
RMS_M200W_3_Mee = RMS_calculation(FG_M200W_3_Mee);
RMS_M200W_4_Mee = RMS_calculation(FG_M200W_4_Mee);
RMS_M200W_5_Mee = RMS_calculation(FG_M200W_5_Mee);
%% Melissa
%---50W----
F_M050W_1_Mel = highpass(data.M050W_1_Mel,10,10000); 
F_M050W_2_Mel = highpass(data.M050W_2_Mel,10,10000);
F_M050W_3_Mel = highpass(data.M050W_3_Mel,10,10000);
F_M050W_4_Mel = highpass(data.M050W_4_Mel,10,10000);
F_M050W_5_Mel = highpass(data.M050W_5_Mel,10,10000);
FG_M050W_1_Mel = abs(lowpass(F_M050W_1_Mel(7501:287500),500,10000));
FG_M050W_2_Mel = abs(lowpass(F_M050W_2_Mel(7501:287500),500,10000));
FG_M050W_3_Mel = abs(lowpass(F_M050W_3_Mel(7501:287500),500,10000));
FG_M050W_4_Mel = abs(lowpass(F_M050W_4_Mel(7501:287500),500,10000));
FG_M050W_5_Mel = abs(lowpass(F_M050W_5_Mel(7501:287500),500,10000));
RMS_M050W_1_Mel = RMS_calculation(FG_M050W_1_Mel);
RMS_M050W_2_Mel = RMS_calculation(FG_M050W_2_Mel);
RMS_M050W_3_Mel = RMS_calculation(FG_M050W_3_Mel);
RMS_M050W_4_Mel = RMS_calculation(FG_M050W_4_Mel);
RMS_M050W_5_Mel = RMS_calculation(FG_M050W_5_Mel);
%---100W----
F_M100W_1_Mel = highpass(data.M100W_1_Mel,10,10000);
F_M100W_2_Mel = highpass(data.M100W_2_Mel,10,10000);
F_M100W_3_Mel = highpass(data.M100W_3_Mel,10,10000);
F_M100W_4_Mel = highpass(data.M100W_4_Mel,10,10000);
F_M100W_5_Mel = highpass(data.M100W_5_Mel,10,10000);
FG_M100W_1_Mel = abs(lowpass(F_M100W_1_Mel(7501:287500),500,10000));
FG_M100W_2_Mel = abs(lowpass(F_M100W_2_Mel(7501:287500),500,10000));
FG_M100W_3_Mel = abs(lowpass(F_M100W_3_Mel(7501:287500),500,10000));
FG_M100W_4_Mel = abs(lowpass(F_M100W_4_Mel(7501:287500),500,10000));
FG_M100W_5_Mel = abs(lowpass(F_M100W_5_Mel(7501:287500),500,10000));
RMS_M100W_1_Mel = RMS_calculation(FG_M100W_1_Mel);
RMS_M100W_2_Mel = RMS_calculation(FG_M100W_2_Mel);
RMS_M100W_3_Mel = RMS_calculation(FG_M100W_3_Mel);
RMS_M100W_4_Mel = RMS_calculation(FG_M100W_4_Mel);
RMS_M100W_5_Mel = RMS_calculation(FG_M100W_5_Mel);
%---150W----
F_M150W_1_Mel = highpass(data.M150W_1_Mel,10,10000);
F_M150W_2_Mel = highpass(data.M150W_2_Mel,10,10000);
F_M150W_3_Mel = highpass(data.M150W_3_Mel,10,10000);
F_M150W_4_Mel = highpass(data.M150W_4_Mel,10,10000);
F_M150W_5_Mel = highpass(data.M150W_5_Mel,10,10000);
FG_M150W_1_Mel = abs(lowpass(F_M150W_1_Mel(7501:287500),500,10000));
FG_M150W_2_Mel = abs(lowpass(F_M150W_2_Mel(7501:287500),500,10000));
FG_M150W_3_Mel = abs(lowpass(F_M150W_3_Mel(7501:287500),500,10000));
FG_M150W_4_Mel = abs(lowpass(F_M150W_4_Mel(7501:287500),500,10000));
FG_M150W_5_Mel = abs(lowpass(F_M150W_5_Mel(7501:287500),500,10000));
RMS_M150W_1_Mel = RMS_calculation(FG_M150W_1_Mel);
RMS_M150W_2_Mel = RMS_calculation(FG_M150W_2_Mel);
RMS_M150W_3_Mel = RMS_calculation(FG_M150W_3_Mel);
RMS_M150W_4_Mel = RMS_calculation(FG_M150W_4_Mel);
RMS_M150W_5_Mel = RMS_calculation(FG_M150W_5_Mel);
%---200W----
F_M200W_1_Mel = highpass(data.M200W_1_Mel,10,10000);
F_M200W_2_Mel = highpass(data.M200W_2_Mel,10,10000);
F_M200W_3_Mel = highpass(data.M200W_3_Mel,10,10000);
F_M200W_4_Mel = highpass(data.M200W_4_Mel,10,10000);
F_M200W_5_Mel = highpass(data.M200W_5_Mel,10,10000);
FG_M200W_1_Mel = abs(lowpass(F_M200W_1_Mel(7501:287500),500,10000)); 
FG_M200W_2_Mel = abs(lowpass(F_M200W_2_Mel(7501:287500),500,10000));
FG_M200W_3_Mel = abs(lowpass(F_M200W_3_Mel(7501:287500),500,10000));
FG_M200W_4_Mel = abs(lowpass(F_M200W_4_Mel(7501:287500),500,10000));
FG_M200W_5_Mel = abs(lowpass(F_M200W_5_Mel(7501:287500),500,10000));
RMS_M200W_1_Mel = RMS_calculation(FG_M200W_1_Mel);
RMS_M200W_2_Mel = RMS_calculation(FG_M200W_2_Mel);
RMS_M200W_3_Mel = RMS_calculation(FG_M200W_3_Mel);
RMS_M200W_4_Mel = RMS_calculation(FG_M200W_4_Mel);
RMS_M200W_5_Mel = RMS_calculation(FG_M200W_5_Mel);
%% Timo
%---50W----
F_M050W_1_Tim = highpass(data.M050W_1_Tim,10,10000); 
F_M050W_2_Tim = highpass(data.M050W_2_Tim,10,10000);
F_M050W_3_Tim = highpass(data.M050W_3_Tim,10,10000);
F_M050W_4_Tim = highpass(data.M050W_4_Tim,10,10000);
F_M050W_5_Tim = highpass(data.M050W_5_Tim,10,10000);
FG_M050W_1_Tim = abs(lowpass(F_M050W_1_Tim(7501:287500),500,10000)); 
FG_M050W_2_Tim = abs(lowpass(F_M050W_2_Tim(7501:287500),500,10000));
FG_M050W_3_Tim = abs(lowpass(F_M050W_3_Tim(7501:287500),500,10000));
FG_M050W_4_Tim = abs(lowpass(F_M050W_4_Tim(7501:287500),500,10000));
FG_M050W_5_Tim = abs(lowpass(F_M050W_5_Tim(7501:287500),500,10000));
RMS_M050W_1_Tim = RMS_calculation(FG_M050W_1_Tim);
RMS_M050W_2_Tim = RMS_calculation(FG_M050W_2_Tim);
RMS_M050W_3_Tim = RMS_calculation(FG_M050W_3_Tim);
RMS_M050W_4_Tim = RMS_calculation(FG_M050W_4_Tim);
RMS_M050W_5_Tim = RMS_calculation(FG_M050W_5_Tim);
%---100W----
F_M100W_1_Tim = highpass(data.M100W_1_Tim,10,10000);
F_M100W_2_Tim = highpass(data.M100W_2_Tim,10,10000);
F_M100W_3_Tim = highpass(data.M100W_3_Tim,10,10000);
F_M100W_4_Tim = highpass(data.M100W_4_Tim,10,10000);
F_M100W_5_Tim = highpass(data.M100W_5_Tim,10,10000);
FG_M100W_1_Tim = abs(lowpass(F_M100W_1_Tim(7501:287500),500,10000));
FG_M100W_2_Tim = abs(lowpass(F_M100W_2_Tim(7501:287500),500,10000));
FG_M100W_3_Tim = abs(lowpass(F_M100W_3_Tim(7501:287500),500,10000));
FG_M100W_4_Tim = abs(lowpass(F_M100W_4_Tim(7501:287500),500,10000));
FG_M100W_5_Tim = abs(lowpass(F_M100W_5_Tim(7501:287500),500,10000));
RMS_M100W_1_Tim = RMS_calculation(FG_M100W_1_Tim);
RMS_M100W_2_Tim = RMS_calculation(FG_M100W_2_Tim);
RMS_M100W_3_Tim = RMS_calculation(FG_M100W_3_Tim);
RMS_M100W_4_Tim = RMS_calculation(FG_M100W_4_Tim);
RMS_M100W_5_Tim = RMS_calculation(FG_M100W_5_Tim);
%---150W----
F_M150W_1_Tim = highpass(data.M150W_1_Tim,10,10000);
F_M150W_2_Tim = highpass(data.M150W_2_Tim,10,10000);
F_M150W_3_Tim = highpass(data.M150W_3_Tim,10,10000);
F_M150W_4_Tim = highpass(data.M150W_4_Tim,10,10000);
F_M150W_5_Tim = highpass(data.M150W_5_Tim,10,10000);
FG_M150W_1_Tim = abs(lowpass(F_M150W_1_Tim(7501:287500),500,10000));
FG_M150W_2_Tim = abs(lowpass(F_M150W_2_Tim(7501:287500),500,10000));
FG_M150W_3_Tim = abs(lowpass(F_M150W_3_Tim(7501:287500),500,10000));
FG_M150W_4_Tim = abs(lowpass(F_M150W_4_Tim(7501:287500),500,10000));
FG_M150W_5_Tim = abs(lowpass(F_M150W_5_Tim(7501:287500),500,10000));
RMS_M150W_1_Tim = RMS_calculation(FG_M150W_1_Tim);
RMS_M150W_2_Tim = RMS_calculation(FG_M150W_2_Tim);
RMS_M150W_3_Tim = RMS_calculation(FG_M150W_3_Tim);
RMS_M150W_4_Tim = RMS_calculation(FG_M150W_4_Tim);
RMS_M150W_5_Tim = RMS_calculation(FG_M150W_5_Tim);
%---200W----
F_M200W_1_Tim = highpass(data.M200W_1_Tim,10,10000);
F_M200W_2_Tim = highpass(data.M200W_2_Tim,10,10000);
F_M200W_3_Tim = highpass(data.M200W_3_Tim,10,10000);
F_M200W_4_Tim = highpass(data.M200W_4_Tim,10,10000);
F_M200W_5_Tim = highpass(data.M200W_5_Tim,10,10000);
FG_M200W_1_Tim = abs(lowpass(F_M200W_1_Tim(7501:287500),500,10000)); 
FG_M200W_2_Tim = abs(lowpass(F_M200W_2_Tim(7501:287500),500,10000));
FG_M200W_3_Tim = abs(lowpass(F_M200W_3_Tim(7501:287500),500,10000));
FG_M200W_4_Tim = abs(lowpass(F_M200W_4_Tim(7501:287500),500,10000));
FG_M200W_5_Tim = abs(lowpass(F_M200W_5_Tim(7501:287500),500,10000));
RMS_M200W_1_Tim = RMS_calculation(FG_M200W_1_Tim);
RMS_M200W_2_Tim = RMS_calculation(FG_M200W_2_Tim);
RMS_M200W_3_Tim = RMS_calculation(FG_M200W_3_Tim);
RMS_M200W_4_Tim = RMS_calculation(FG_M200W_4_Tim);
RMS_M200W_5_Tim = RMS_calculation(FG_M200W_5_Tim);