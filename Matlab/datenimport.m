%Datenspeicherung der Muskelsignalmessungen von Textdatei in Matlab Variablen
%Variablenname erlaubt eindeutige Zuordnung zu Person und
%Trainingsintensität der Messung
%% Linus
%---50W----
FID = fopen('Messungen\Linus50W_MessungRAW_06-May-2022_13-40-14.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_1_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus50W_MessungRAW_06-May-2022_13-40-56.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_2_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus50W_MessungRAW_06-May-2022_13-41-35.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_3_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus50W_MessungRAW_06-May-2022_13-42-12.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_4_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus50W_MessungRAW_06-May-2022_13-45-09.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_5_Lin = transpose(hex2dec(dataFromfile)); 

%---100W----
FID = fopen('Messungen\Linus100W_MessungRAW_06-May-2022_13-47-02.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_1_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus100W_MessungRAW_06-May-2022_13-47-37.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_2_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus100W_MessungRAW_06-May-2022_13-48-14.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_3_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus100W_MessungRAW_06-May-2022_13-56-23.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_4_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus100W_MessungRAW_06-May-2022_13-58-41.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_5_Lin = transpose(hex2dec(dataFromfile)); 

%---150W----
FID = fopen('Messungen\Linus150W_MessungRAW_06-May-2022_14-00-09.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_1_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus150W_MessungRAW_06-May-2022_14-00-44.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_2_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus150W_MessungRAW_06-May-2022_14-01-20.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_3_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus150W_MessungRAW_06-May-2022_14-06-49.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_4_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus150W_MessungRAW_06-May-2022_14-07-25.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_5_Lin = transpose(hex2dec(dataFromfile)); 

%---200W----
FID = fopen('Messungen\Linus200W_MessungRAW_06-May-2022_14-13-35.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_1_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus200W_MessungRAW_06-May-2022_14-14-10.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_2_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus200W_MessungRAW_06-May-2022_14-16-26.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_3_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus200W_MessungRAW_06-May-2022_14-17-04.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_4_Lin = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Linus200W_MessungRAW_06-May-2022_14-18-51.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_5_Lin = transpose(hex2dec(dataFromfile)); 

%% Lucas
% ---50Hz----
FID = fopen('Messungen\Lucas50W_MessungRAW_04-May-2022_10-14-43.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_1_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas50W_MessungRAW_04-May-2022_10-15-29.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_2_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas50W_MessungRAW_04-May-2022_10-16-23.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_3_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas50W_MessungRAW_04-May-2022_10-17-00.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_4_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas50W_MessungRAW_04-May-2022_10-17-34.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_5_Luc = transpose(hex2dec(dataFromfile)); 

%---100W----
FID = fopen('Messungen\Lucas100W_MessungRAW_04-May-2022_10-19-29.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_1_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas100W_MessungRAW_04-May-2022_10-20-03.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_2_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas100W_MessungRAW_04-May-2022_10-20-38.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_3_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas100W_MessungRAW_04-May-2022_10-21-11.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_4_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas100W_MessungRAW_04-May-2022_10-21-45.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_5_Luc = transpose(hex2dec(dataFromfile)); 

%---150W----
FID = fopen('Messungen\Lucas150W_MessungRAW_04-May-2022_10-24-31.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_1_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas150W_MessungRAW_04-May-2022_10-25-07.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_2_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas150W_MessungRAW_04-May-2022_10-25-41.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_3_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas150W_MessungRAW_04-May-2022_10-26-16.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_4_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas150W_MessungRAW_04-May-2022_10-26-50.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_5_Luc = transpose(hex2dec(dataFromfile)); 

%---200W----
FID = fopen('Messungen\Lucas200W_MessungRAW_04-May-2022_10-29-20.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_1_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas200W_MessungRAW_04-May-2022_10-29-54.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_2_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas200W_MessungRAW_04-May-2022_10-30-30.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_3_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas200W_MessungRAW_04-May-2022_10-31-15.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_4_Luc = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Lucas200W_MessungRAW_04-May-2022_10-31-49.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_5_Luc = transpose(hex2dec(dataFromfile)); 

%% Meenu
% ----50W----
FID = fopen('Messungen\Meenu50W_MessungRAW_06-May-2022_14-31-12.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_1_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu50W_MessungRAW_06-May-2022_14-31-46.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_2_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu50W_MessungRAW_06-May-2022_14-32-19.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_3_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu50W_MessungRAW_06-May-2022_14-32-52.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_4_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu50W_MessungRAW_06-May-2022_14-33-25.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_5_Mee = transpose(hex2dec(dataFromfile)); 

%---100W----
FID = fopen('Messungen\Meenu100W_MessungRAW_06-May-2022_14-55-35.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_1_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu100W_MessungRAW_06-May-2022_14-50-53.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_2_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu100W_MessungRAW_06-May-2022_14-51-26.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_3_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu100W_MessungRAW_06-May-2022_14-54-30.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_4_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu100W_MessungRAW_06-May-2022_14-55-03.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_5_Mee = transpose(hex2dec(dataFromfile)); 

%---150W----
FID = fopen('Messungen\Meenu150W_MessungRAW_06-May-2022_14-56-43.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_1_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu150W_MessungRAW_06-May-2022_14-58-59.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_2_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu150W_MessungRAW_06-May-2022_14-59-34.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_3_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu150W_MessungRAW_06-May-2022_15-01-08.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_4_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu150W_MessungRAW_06-May-2022_15-01-41.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_5_Mee = transpose(hex2dec(dataFromfile)); 

%---200W----
FID = fopen('Messungen\Meenu200W_MessungRAW_06-May-2022_15-10-59.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_1_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu200W_MessungRAW_06-May-2022_15-13-28.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_2_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu200W_MessungRAW_06-May-2022_15-15-35.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_3_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu200W_MessungRAW_06-May-2022_15-16-08.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_4_Mee = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Meenu200W_MessungRAW_06-May-2022_15-19-21.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_5_Mee = transpose(hex2dec(dataFromfile)); 

%% Melissa
% ----50W----
FID = fopen('Messungen\Melissa50W_MessungRAW_04-May-2022_09-44-04.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_1_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa50W_MessungRAW_04-May-2022_09-44-41.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_2_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa50W_MessungRAW_04-May-2022_09-45-15.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_3_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa50W_MessungRAW_04-May-2022_09-45-50.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_4_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa50W_MessungRAW_04-May-2022_09-46-25.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_5_Mel = transpose(hex2dec(dataFromfile)); 

%---100W----
FID = fopen('Messungen\Melissa100W_MessungRAW_04-May-2022_09-47-49.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_1_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa100W_MessungRAW_04-May-2022_09-48-23.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_2_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa100W_MessungRAW_04-May-2022_09-48-56.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_3_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa100W_MessungRAW_04-May-2022_09-49-33.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_4_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa100W_MessungRAW_04-May-2022_09-50-07.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_5_Mel = transpose(hex2dec(dataFromfile)); 

%---150W----
FID = fopen('Messungen\Melissa150W_MessungRAW_04-May-2022_09-55-43.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_1_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa150W_MessungRAW_04-May-2022_09-56-17.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_2_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa150W_MessungRAW_04-May-2022_09-56-58.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_3_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa150W_MessungRAW_04-May-2022_09-59-39.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_4_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa150W_MessungRAW_04-May-2022_10-00-13.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_5_Mel = transpose(hex2dec(dataFromfile)); 

%---200W----
FID = fopen('Messungen\Melissa200W_MessungRAW_11-May-2022_09-39-43.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_1_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa200W_MessungRAW_11-May-2022_09-40-17.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_2_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa200W_MessungRAW_11-May-2022_09-46-57.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_3_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa200W_MessungRAW_11-May-2022_09-47-30.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_4_Mel = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Melissa200W_MessungRAW_11-May-2022_10-21-34.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_5_Mel = transpose(hex2dec(dataFromfile)); 
%% Timo
% ----50W----
FID = fopen('Messungen\Timo50W_MessungRAW_11-May-2022_09-56-38.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_1_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo50W_MessungRAW_11-May-2022_09-57-12.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_2_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo50W_MessungRAW_11-May-2022_09-57-46.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_3_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo50W_MessungRAW_11-May-2022_09-58-19.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_4_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo50W_MessungRAW_11-May-2022_09-58-53.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M050W_5_Tim = transpose(hex2dec(dataFromfile)); 

%---100W----
FID = fopen('Messungen\Timo100W_MessungRAW_11-May-2022_10-00-05.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_1_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo100W_MessungRAW_11-May-2022_10-00-40.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_2_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo100W_MessungRAW_11-May-2022_10-01-14.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_3_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo100W_MessungRAW_11-May-2022_10-01-47.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_4_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo100W_MessungRAW_11-May-2022_10-51-54.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M100W_5_Tim = transpose(hex2dec(dataFromfile)); 

%---150W----
FID = fopen('Messungen\Timo150W_MessungRAW_11-May-2022_10-02-35.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_1_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo150W_MessungRAW_11-May-2022_10-03-08.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_2_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo150W_MessungRAW_11-May-2022_10-03-42.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_3_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo150W_MessungRAW_11-May-2022_10-04-15.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_4_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo150W_MessungRAW_11-May-2022_10-04-48.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M150W_5_Tim = transpose(hex2dec(dataFromfile)); 

%---200W----
FID = fopen('Messungen\Timo200W_MessungRAW_11-May-2022_10-05-37.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_1_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo200W_MessungRAW_11-May-2022_10-06-09.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_2_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo200W_MessungRAW_11-May-2022_10-09-37.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_3_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo200W_MessungRAW_11-May-2022_10-10-09.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_4_Tim = transpose(hex2dec(dataFromfile)); 
FID = fopen('Messungen\Timo200W_MessungRAW_11-May-2022_10-10-57.txt');
dataFromfile = textscan(FID, '%s'); 
dataFromfile = dataFromfile{1};
M200W_5_Tim = transpose(hex2dec(dataFromfile)); 


