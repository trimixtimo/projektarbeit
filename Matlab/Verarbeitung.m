filename = 'Messung0-2-0-1-0.txt'; % Dateinamen als Variable definieren
FID = fopen(filename);
dataFromfile = textscan(FID, '%s');% Die Werte als String lesen für HEX Verarbeitung
dataFromfile = dataFromfile{1};
decData = hex2dec(dataFromfile);
fclose(FID); % geöffnete Datei in Matlab schließen