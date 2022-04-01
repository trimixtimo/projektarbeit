%% Werte einlesen und umwandelen in Dezimal
[file,path] = uigetfile({'*.txt'}, 'Textdatei mit Messung auswählen..','Messungen/'); % User wählt .txt aus
FID = fopen(fullfile(path,file));                  % Datei in Matlab öffnen 
dataFromfile = textscan(FID, '%s');     % Die Werte als String lesen für HEX Verarbeitung
dataFromfile = dataFromfile{1};
decData = hex2dec(dataFromfile);        % Hexadezimal in Dezimal umwandeln
voltage = decData * 0.80566; % [mV]

%% Zeitkonstante definieren
dt = 1; % [Millisekunden]                Zeitintervall zwischen zwei Messpunkten == 1000Hz

%% Graphen plotten
figure;                       
x = 0:dt:((height(voltage)-1)*dt);      % Zeitachse in ms
y = transpose(voltage);                 % Signalachse in mV
plot(x,y);
title('Spannung über Zeit');            % Titel des Graphen
xlabel('Zeit in ms');                   % Bezeichnung der x-Achse 
ylabel('Spannung in mV');               % Bezeichnung der y-Achse

fclose(FID);                            % geöffnete Datei in Matlab schließen

% Scheinbar Abtastrate von 100Hz und nicht 1000Hz, muss nochmal überprüft
% werden, da Messung definitiv länger als 3 Sekunden war