% Werte einlesen und umwandelen in Dezimal
filename = 'Messung0-2-0-1-0.txt'; % Dateinamen als Variable definieren
FID = fopen(filename); % Datei in Matlab öffnen 
dataFromfile = textscan(FID, '%s');% Die Werte als String lesen für HEX Verarbeitung
dataFromfile = dataFromfile{1};
decData = hex2dec(dataFromfile); % Hexadezimal in Dezimal umwandeln
voltage = decData * 0.80566;

%Graphen plotten
figure;
plot(voltage);
title('Spannung über Zeit'); % Titel des Graphen
xlabel('Zeit in xx'); % Bezeichnung der 
ylabel('Spannung in mV');

fclose(FID); % geöffnete Datei in Matlab schließen