rawData = load("rawData.mat");
processedData = load("processedData.mat");

%% Linus
%----50W----
%Array als Contraction Tracker wird über einfache Schwellwertfunktion
%realisiert, Bereiche die über dem Schwellwert liegen haben Wert 1,
%Bereiche unterhalb des Schwellwertes haben den Wert 0
CT_M050W_1_Lin = contraction_detection(processedData.RMS_M050W_1_Lin);
CT_M050W_2_Lin = contraction_detection(processedData.RMS_M050W_2_Lin); 
CT_M050W_3_Lin = contraction_detection(processedData.RMS_M050W_3_Lin);
CT_M050W_4_Lin = contraction_detection(processedData.RMS_M050W_4_Lin);
CT_M050W_5_Lin = contraction_detection(processedData.RMS_M050W_5_Lin);
%Mithilfe des Contraction Trackers wird ein Cell-Array mit den einzelnen
%Kontraktionen des geglätteten Signals gebildet. Dazu wird das geglättete
%Signal mit dem Contraction Tracker punktmultipliziert. Dann werden alle
%Nullbereiche identifiziert und als Grenzen der Kontraktionsintervalle
%definiert. 
contraction_M050W_1_Lin = contraction_extraction(processedData.RMS_M050W_1_Lin,CT_M050W_1_Lin);
contraction_M050W_2_Lin = contraction_extraction(processedData.RMS_M050W_2_Lin,CT_M050W_2_Lin);
contraction_M050W_3_Lin = contraction_extraction(processedData.RMS_M050W_3_Lin,CT_M050W_3_Lin);
contraction_M050W_4_Lin = contraction_extraction(processedData.RMS_M050W_4_Lin,CT_M050W_4_Lin);
contraction_M050W_5_Lin = contraction_extraction(processedData.RMS_M050W_5_Lin,CT_M050W_5_Lin);
%----100W----
CT_M100W_1_Lin = contraction_detection(processedData.RMS_M100W_1_Lin);
CT_M100W_2_Lin = contraction_detection(processedData.RMS_M100W_2_Lin); 
CT_M100W_3_Lin = contraction_detection(processedData.RMS_M100W_3_Lin); 
CT_M100W_4_Lin = contraction_detection(processedData.RMS_M100W_4_Lin);
CT_M100W_5_Lin = contraction_detection(processedData.RMS_M100W_5_Lin);
contraction_M100W_1_Lin = contraction_extraction(processedData.RMS_M100W_1_Lin,CT_M100W_1_Lin);
contraction_M100W_2_Lin = contraction_extraction(processedData.RMS_M100W_2_Lin,CT_M100W_2_Lin);
contraction_M100W_3_Lin = contraction_extraction(processedData.RMS_M100W_3_Lin,CT_M100W_3_Lin);
contraction_M100W_4_Lin = contraction_extraction(processedData.RMS_M100W_4_Lin,CT_M100W_4_Lin);
contraction_M100W_5_Lin = contraction_extraction(processedData.RMS_M100W_5_Lin,CT_M100W_5_Lin);
%----150W----
CT_M150W_1_Lin = contraction_detection(processedData.RMS_M150W_1_Lin); 
CT_M150W_2_Lin = contraction_detection(processedData.RMS_M150W_2_Lin); 
CT_M150W_3_Lin = contraction_detection(processedData.RMS_M150W_3_Lin); 
CT_M150W_4_Lin = contraction_detection(processedData.RMS_M150W_4_Lin);
CT_M150W_5_Lin = contraction_detection(processedData.RMS_M150W_5_Lin); 
contraction_M150W_1_Lin = contraction_extraction(processedData.RMS_M150W_1_Lin,CT_M150W_1_Lin);
contraction_M150W_2_Lin = contraction_extraction(processedData.RMS_M150W_2_Lin,CT_M150W_2_Lin);
contraction_M150W_3_Lin = contraction_extraction(processedData.RMS_M150W_3_Lin,CT_M150W_3_Lin);
contraction_M150W_4_Lin = contraction_extraction(processedData.RMS_M150W_4_Lin,CT_M150W_4_Lin);
contraction_M150W_5_Lin = contraction_extraction(processedData.RMS_M150W_5_Lin,CT_M150W_5_Lin);
%----200W----
CT_M200W_1_Lin = contraction_detection(processedData.RMS_M200W_1_Lin); 
CT_M200W_2_Lin = contraction_detection(processedData.RMS_M200W_2_Lin);
CT_M200W_3_Lin = contraction_detection(processedData.RMS_M200W_3_Lin);
CT_M200W_4_Lin = contraction_detection(processedData.RMS_M200W_4_Lin); 
CT_M200W_5_Lin = contraction_detection(processedData.RMS_M200W_5_Lin); 
contraction_M200W_1_Lin = contraction_extraction(processedData.RMS_M200W_1_Lin,CT_M200W_1_Lin);
contraction_M200W_2_Lin = contraction_extraction(processedData.RMS_M200W_2_Lin,CT_M200W_2_Lin);
contraction_M200W_3_Lin = contraction_extraction(processedData.RMS_M200W_3_Lin,CT_M200W_3_Lin);
contraction_M200W_4_Lin = contraction_extraction(processedData.RMS_M200W_4_Lin,CT_M200W_4_Lin);
contraction_M200W_5_Lin = contraction_extraction(processedData.RMS_M200W_5_Lin,CT_M200W_5_Lin);
%% Lucas
%----50W----
CT_M050W_1_Luc = contraction_detection(processedData.RMS_M050W_1_Luc);
CT_M050W_2_Luc = contraction_detection(processedData.RMS_M050W_2_Luc); 
CT_M050W_3_Luc = contraction_detection(processedData.RMS_M050W_3_Luc); 
CT_M050W_4_Luc = contraction_detection(processedData.RMS_M050W_4_Luc); 
CT_M050W_5_Luc = contraction_detection(processedData.RMS_M050W_5_Luc); 
contraction_M050W_1_Luc = contraction_extraction(processedData.RMS_M050W_1_Luc,CT_M050W_1_Luc);
contraction_M050W_2_Luc = contraction_extraction(processedData.RMS_M050W_2_Luc,CT_M050W_2_Luc);
contraction_M050W_3_Luc = contraction_extraction(processedData.RMS_M050W_3_Luc,CT_M050W_3_Luc);
contraction_M050W_4_Luc = contraction_extraction(processedData.RMS_M050W_4_Luc,CT_M050W_4_Luc);
contraction_M050W_5_Luc = contraction_extraction(processedData.RMS_M050W_5_Luc,CT_M050W_5_Luc);
%----100W----
CT_M100W_1_Luc = contraction_detection(processedData.RMS_M100W_1_Luc);
CT_M100W_2_Luc = contraction_detection(processedData.RMS_M100W_2_Luc);
CT_M100W_3_Luc = contraction_detection(processedData.RMS_M100W_3_Luc); 
CT_M100W_4_Luc = contraction_detection(processedData.RMS_M100W_4_Luc); 
CT_M100W_5_Luc = contraction_detection(processedData.RMS_M100W_5_Luc);
contraction_M100W_1_Luc = contraction_extraction(processedData.RMS_M100W_1_Luc,CT_M100W_1_Luc);
contraction_M100W_2_Luc = contraction_extraction(processedData.RMS_M100W_2_Luc,CT_M100W_2_Luc);
contraction_M100W_3_Luc = contraction_extraction(processedData.RMS_M100W_3_Luc,CT_M100W_3_Luc);
contraction_M100W_4_Luc = contraction_extraction(processedData.RMS_M100W_4_Luc,CT_M100W_4_Luc);
contraction_M100W_5_Luc = contraction_extraction(processedData.RMS_M100W_5_Luc,CT_M100W_5_Luc);
%----150W----
CT_M150W_1_Luc = contraction_detection(processedData.RMS_M150W_1_Luc);
CT_M150W_2_Luc = contraction_detection(processedData.RMS_M150W_2_Luc);
CT_M150W_3_Luc = contraction_detection(processedData.RMS_M150W_3_Luc);
CT_M150W_4_Luc = contraction_detection(processedData.RMS_M150W_4_Luc);
CT_M150W_5_Luc = contraction_detection(processedData.RMS_M150W_5_Luc); 
contraction_M150W_1_Luc = contraction_extraction(processedData.RMS_M150W_1_Luc,CT_M150W_1_Luc);
contraction_M150W_2_Luc = contraction_extraction(processedData.RMS_M150W_2_Luc,CT_M150W_2_Luc);
contraction_M150W_3_Luc = contraction_extraction(processedData.RMS_M150W_3_Luc,CT_M150W_3_Luc);
contraction_M150W_4_Luc = contraction_extraction(processedData.RMS_M150W_4_Luc,CT_M150W_4_Luc);
contraction_M150W_5_Luc = contraction_extraction(processedData.RMS_M150W_5_Luc,CT_M150W_5_Luc);
%----200W----
CT_M200W_1_Luc = contraction_detection(processedData.RMS_M200W_1_Luc);
CT_M200W_2_Luc = contraction_detection(processedData.RMS_M200W_2_Luc); 
CT_M200W_3_Luc = contraction_detection(processedData.RMS_M200W_3_Luc); 
CT_M200W_4_Luc = contraction_detection(processedData.RMS_M200W_4_Luc); 
CT_M200W_5_Luc = contraction_detection(processedData.RMS_M200W_5_Luc);
contraction_M200W_1_Luc = contraction_extraction(processedData.RMS_M200W_1_Luc,CT_M200W_1_Luc);
contraction_M200W_2_Luc = contraction_extraction(processedData.RMS_M200W_2_Luc,CT_M200W_2_Luc);
contraction_M200W_3_Luc = contraction_extraction(processedData.RMS_M200W_3_Luc,CT_M200W_3_Luc);
contraction_M200W_4_Luc = contraction_extraction(processedData.RMS_M200W_4_Luc,CT_M200W_4_Luc);
contraction_M200W_5_Luc = contraction_extraction(processedData.RMS_M200W_5_Luc,CT_M200W_5_Luc);
%% Meenu
%----50W----
CT_M050W_1_Mee = contraction_detection(processedData.RMS_M050W_1_Mee); 
CT_M050W_2_Mee = contraction_detection(processedData.RMS_M050W_2_Mee); 
CT_M050W_3_Mee = contraction_detection(processedData.RMS_M050W_3_Mee);
CT_M050W_4_Mee = contraction_detection(processedData.RMS_M050W_4_Mee);
CT_M050W_5_Mee = contraction_detection(processedData.RMS_M050W_5_Mee); 
contraction_M050W_1_Mee = contraction_extraction(processedData.RMS_M050W_1_Mee,CT_M050W_1_Mee);
contraction_M050W_2_Mee = contraction_extraction(processedData.RMS_M050W_2_Mee,CT_M050W_2_Mee);
contraction_M050W_3_Mee = contraction_extraction(processedData.RMS_M050W_3_Mee,CT_M050W_3_Mee);
contraction_M050W_4_Mee = contraction_extraction(processedData.RMS_M050W_4_Mee,CT_M050W_4_Mee);
contraction_M050W_5_Mee = contraction_extraction(processedData.RMS_M050W_5_Mee,CT_M050W_5_Mee);
%----100W----
CT_M100W_1_Mee = contraction_detection(processedData.RMS_M100W_1_Mee); 
CT_M100W_2_Mee = contraction_detection(processedData.RMS_M100W_2_Mee); 
CT_M100W_3_Mee = contraction_detection(processedData.RMS_M100W_3_Mee); 
CT_M100W_4_Mee = contraction_detection(processedData.RMS_M100W_4_Mee); 
CT_M100W_5_Mee = contraction_detection(processedData.RMS_M100W_5_Mee); 
contraction_M100W_1_Mee = contraction_extraction(processedData.RMS_M100W_1_Mee,CT_M100W_1_Mee);
contraction_M100W_2_Mee = contraction_extraction(processedData.RMS_M100W_2_Mee,CT_M100W_2_Mee);
contraction_M100W_3_Mee = contraction_extraction(processedData.RMS_M100W_3_Mee,CT_M100W_3_Mee);
contraction_M100W_4_Mee = contraction_extraction(processedData.RMS_M100W_4_Mee,CT_M100W_4_Mee);
contraction_M100W_5_Mee = contraction_extraction(processedData.RMS_M100W_5_Mee,CT_M100W_5_Mee);
%----150W----
CT_M150W_1_Mee = contraction_detection(processedData.RMS_M150W_1_Mee); 
CT_M150W_2_Mee = contraction_detection(processedData.RMS_M150W_2_Mee); 
CT_M150W_3_Mee = contraction_detection(processedData.RMS_M150W_3_Mee); 
CT_M150W_4_Mee = contraction_detection(processedData.RMS_M150W_4_Mee); 
CT_M150W_5_Mee = contraction_detection(processedData.RMS_M150W_5_Mee); 
contraction_M150W_1_Mee = contraction_extraction(processedData.RMS_M150W_1_Mee,CT_M150W_1_Mee);
contraction_M150W_2_Mee = contraction_extraction(processedData.RMS_M150W_2_Mee,CT_M150W_2_Mee);
contraction_M150W_3_Mee = contraction_extraction(processedData.RMS_M150W_3_Mee,CT_M150W_3_Mee);
contraction_M150W_4_Mee = contraction_extraction(processedData.RMS_M150W_4_Mee,CT_M150W_4_Mee);
contraction_M150W_5_Mee = contraction_extraction(processedData.RMS_M150W_5_Mee,CT_M150W_5_Mee);
%----200W----
CT_M200W_1_Mee = contraction_detection(processedData.RMS_M200W_1_Mee); 
CT_M200W_2_Mee = contraction_detection(processedData.RMS_M200W_2_Mee); 
CT_M200W_3_Mee = contraction_detection(processedData.RMS_M200W_3_Mee); 
CT_M200W_4_Mee = contraction_detection(processedData.RMS_M200W_4_Mee); 
CT_M200W_5_Mee = contraction_detection(processedData.RMS_M200W_5_Mee); 
contraction_M200W_1_Mee = contraction_extraction(processedData.RMS_M200W_1_Mee,CT_M200W_1_Mee);
contraction_M200W_2_Mee = contraction_extraction(processedData.RMS_M200W_2_Mee,CT_M200W_2_Mee);
contraction_M200W_3_Mee = contraction_extraction(processedData.RMS_M200W_3_Mee,CT_M200W_3_Mee);
contraction_M200W_4_Mee = contraction_extraction(processedData.RMS_M200W_4_Mee,CT_M200W_4_Mee);
contraction_M200W_5_Mee = contraction_extraction(processedData.RMS_M200W_5_Mee,CT_M200W_5_Mee);
%% Melissa
%----50W----
CT_M050W_1_Mel = contraction_detection(processedData.RMS_M050W_1_Mel); 
CT_M050W_2_Mel = contraction_detection(processedData.RMS_M050W_2_Mel); 
CT_M050W_3_Mel = contraction_detection(processedData.RMS_M050W_3_Mel); 
CT_M050W_4_Mel = contraction_detection(processedData.RMS_M050W_4_Mel); 
CT_M050W_5_Mel = contraction_detection(processedData.RMS_M050W_5_Mel);
contraction_M050W_1_Mel = contraction_extraction(processedData.RMS_M050W_1_Mel,CT_M050W_1_Mel);
contraction_M050W_2_Mel = contraction_extraction(processedData.RMS_M050W_2_Mel,CT_M050W_2_Mel);
contraction_M050W_3_Mel = contraction_extraction(processedData.RMS_M050W_3_Mel,CT_M050W_3_Mel);
contraction_M050W_4_Mel = contraction_extraction(processedData.RMS_M050W_4_Mel,CT_M050W_4_Mel);
contraction_M050W_5_Mel = contraction_extraction(processedData.RMS_M050W_5_Mel,CT_M050W_5_Mel);
%----100W----
CT_M100W_1_Mel = contraction_detection(processedData.RMS_M100W_1_Mel);
CT_M100W_2_Mel = contraction_detection(processedData.RMS_M100W_2_Mel); 
CT_M100W_3_Mel = contraction_detection(processedData.RMS_M100W_3_Mel); 
CT_M100W_4_Mel = contraction_detection(processedData.RMS_M100W_4_Mel); 
CT_M100W_5_Mel = contraction_detection(processedData.RMS_M100W_5_Mel); 
contraction_M100W_1_Mel = contraction_extraction(processedData.RMS_M100W_1_Mel,CT_M100W_1_Mel);
contraction_M100W_2_Mel = contraction_extraction(processedData.RMS_M100W_2_Mel,CT_M100W_2_Mel);
contraction_M100W_3_Mel = contraction_extraction(processedData.RMS_M100W_3_Mel,CT_M100W_3_Mel);
contraction_M100W_4_Mel = contraction_extraction(processedData.RMS_M100W_4_Mel,CT_M100W_4_Mel);
contraction_M100W_5_Mel = contraction_extraction(processedData.RMS_M100W_5_Mel,CT_M100W_5_Mel);
%----150W----
CT_M150W_1_Mel = contraction_detection(processedData.RMS_M150W_1_Mel); 
CT_M150W_2_Mel = contraction_detection(processedData.RMS_M150W_2_Mel); 
CT_M150W_3_Mel = contraction_detection(processedData.RMS_M150W_3_Mel); 
CT_M150W_4_Mel = contraction_detection(processedData.RMS_M150W_4_Mel);
CT_M150W_5_Mel = contraction_detection(processedData.RMS_M150W_5_Mel); 
contraction_M150W_1_Mel = contraction_extraction(processedData.RMS_M150W_1_Mel,CT_M150W_1_Mel);
contraction_M150W_2_Mel = contraction_extraction(processedData.RMS_M150W_2_Mel,CT_M150W_2_Mel);
contraction_M150W_3_Mel = contraction_extraction(processedData.RMS_M150W_3_Mel,CT_M150W_3_Mel);
contraction_M150W_4_Mel = contraction_extraction(processedData.RMS_M150W_4_Mel,CT_M150W_4_Mel);
contraction_M150W_5_Mel = contraction_extraction(processedData.RMS_M150W_5_Mel,CT_M150W_5_Mel);
%----200W----
CT_M200W_1_Mel = contraction_detection(processedData.RMS_M200W_1_Mel); 
CT_M200W_2_Mel = contraction_detection(processedData.RMS_M200W_2_Mel); 
CT_M200W_3_Mel = contraction_detection(processedData.RMS_M200W_3_Mel); 
CT_M200W_4_Mel = contraction_detection(processedData.RMS_M200W_4_Mel); 
CT_M200W_5_Mel = contraction_detection(processedData.RMS_M200W_5_Mel); 
contraction_M200W_1_Mel = contraction_extraction(processedData.RMS_M200W_1_Mel,CT_M200W_1_Mel);
contraction_M200W_2_Mel = contraction_extraction(processedData.RMS_M200W_2_Mel,CT_M200W_2_Mel);
contraction_M200W_3_Mel = contraction_extraction(processedData.RMS_M200W_3_Mel,CT_M200W_3_Mel);
contraction_M200W_4_Mel = contraction_extraction(processedData.RMS_M200W_4_Mel,CT_M200W_4_Mel);
contraction_M200W_5_Mel = contraction_extraction(processedData.RMS_M200W_5_Mel,CT_M200W_5_Mel);
%% Timo
%----50W----
CT_M050W_1_Tim = contraction_detection(processedData.RMS_M050W_1_Tim); 
CT_M050W_2_Tim = contraction_detection(processedData.RMS_M050W_2_Tim); 
CT_M050W_3_Tim = contraction_detection(processedData.RMS_M050W_3_Tim); 
CT_M050W_4_Tim = contraction_detection(processedData.RMS_M050W_4_Tim); 
CT_M050W_5_Tim = contraction_detection(processedData.RMS_M050W_5_Tim); 
contraction_M050_1_Tim = contraction_extraction(processedData.RMS_M050W_1_Tim,CT_M050W_1_Tim);
contraction_M050_2_Tim = contraction_extraction(processedData.RMS_M050W_2_Tim,CT_M050W_2_Tim);
contraction_M050_3_Tim = contraction_extraction(processedData.RMS_M050W_3_Tim,CT_M050W_3_Tim);
contraction_M050_4_Tim = contraction_extraction(processedData.RMS_M050W_4_Tim,CT_M050W_4_Tim);
contraction_M050_5_Tim = contraction_extraction(processedData.RMS_M050W_5_Tim,CT_M050W_5_Tim);
%----100W----
CT_M100W_1_Tim = contraction_detection(processedData.RMS_M100W_1_Tim);
CT_M100W_2_Tim = contraction_detection(processedData.RMS_M100W_2_Tim); 
CT_M100W_3_Tim = contraction_detection(processedData.RMS_M100W_3_Tim); 
CT_M100W_4_Tim = contraction_detection(processedData.RMS_M100W_4_Tim);
CT_M100W_5_Tim = contraction_detection(processedData.RMS_M100W_5_Tim);
contraction_M100_1_Tim = contraction_extraction(processedData.RMS_M100W_1_Tim,CT_M100W_1_Tim);
contraction_M100_2_Tim = contraction_extraction(processedData.RMS_M100W_2_Tim,CT_M100W_2_Tim);
contraction_M100_3_Tim = contraction_extraction(processedData.RMS_M100W_3_Tim,CT_M100W_3_Tim);
contraction_M100_4_Tim = contraction_extraction(processedData.RMS_M100W_4_Tim,CT_M100W_4_Tim);
contraction_M100_5_Tim = contraction_extraction(processedData.RMS_M100W_5_Tim,CT_M100W_5_Tim);
%----150W----
CT_M150W_1_Tim = contraction_detection(processedData.RMS_M150W_1_Tim); 
CT_M150W_2_Tim = contraction_detection(processedData.RMS_M150W_2_Tim);
CT_M150W_3_Tim = contraction_detection(processedData.RMS_M150W_3_Tim); 
CT_M150W_4_Tim = contraction_detection(processedData.RMS_M150W_4_Tim); 
CT_M150W_5_Tim = contraction_detection(processedData.RMS_M150W_5_Tim); 
contraction_M150_1_Tim = contraction_extraction(processedData.RMS_M150W_1_Tim,CT_M150W_1_Tim);
contraction_M150_2_Tim = contraction_extraction(processedData.RMS_M150W_2_Tim,CT_M150W_2_Tim);
contraction_M150_3_Tim = contraction_extraction(processedData.RMS_M150W_3_Tim,CT_M150W_3_Tim);
contraction_M150_4_Tim = contraction_extraction(processedData.RMS_M150W_4_Tim,CT_M150W_4_Tim);
contraction_M150_5_Tim = contraction_extraction(processedData.RMS_M150W_5_Tim,CT_M150W_5_Tim);
%----200W----
CT_M200W_1_Tim = contraction_detection(processedData.RMS_M200W_1_Tim);
CT_M200W_2_Tim = contraction_detection(processedData.RMS_M200W_2_Tim); 
CT_M200W_3_Tim = contraction_detection(processedData.RMS_M200W_3_Tim);
CT_M200W_4_Tim = contraction_detection(processedData.RMS_M200W_4_Tim); 
CT_M200W_5_Tim = contraction_detection(processedData.RMS_M200W_5_Tim);
contraction_M200_1_Tim = contraction_extraction(processedData.RMS_M200W_1_Tim,CT_M200W_1_Tim);
contraction_M200_2_Tim = contraction_extraction(processedData.RMS_M200W_2_Tim,CT_M200W_2_Tim);
contraction_M200_3_Tim = contraction_extraction(processedData.RMS_M200W_3_Tim,CT_M200W_3_Tim);
contraction_M200_4_Tim = contraction_extraction(processedData.RMS_M200W_4_Tim,CT_M200W_4_Tim);
contraction_M200_5_Tim = contraction_extraction(processedData.RMS_M200W_5_Tim,CT_M200W_5_Tim);