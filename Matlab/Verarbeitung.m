filename = 'Messung0-2-0-1-0.txt'; % Dateinamen als Variable definieren
FID = fopen(filename); % Datei in Matlab öffnen 
dataFromfile = textscan(FID, '%s');% Die Werte als String lesen für HEX Verarbeitung
dataFromfile = dataFromfile{1};
decData = hex2dec(dataFromfile); % Hexadezimal in Dezimal umwandeln
fclose(FID); % geöffnete Datei in Matlab schließen