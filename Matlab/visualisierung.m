rawData = load("rawData.mat");
processedData = load("processedData.mat");
finalData = load("finalData");
contractionData = load("contractionData");

intensitySteps = [50,100,150,200];
threshold = ones(1,100000)*10;

figure(1)
hold on
grid on
plot(intensitySteps,contractionData.AVG_contractionValues_Lin*(3300/4096),"*-","Color","#0072BD")
plot(intensitySteps,contractionData.AVG_contractionValues_Luc*(3300/4096),"*-","Color","#D95319")
plot(intensitySteps,contractionData.AVG_contractionValues_Mee*(3300/4096),"*-","Color","#A2142F")
plot(intensitySteps,contractionData.AVG_contractionValues_Mel*(3300/4096),"*-","Color","#7E2F8E")
plot(intensitySteps,contractionData.AVG_contractionValues_Tim*(3300/4096),"*-","Color","#77AC30")
xlabel("Trainingsintensität auf Ergometer in Watt")
ylabel("RMS Mittelwert während Kontraktion in mV")
title("EMG-Signal/Trainingsintensität-Verhältnis bei 5 Testpersonen")
hold off


figure(2)
subplot(3,1,1)
plot(rawData.M050W_1_Tim(107501:207500)*(3300/4096),"Color","#D95319")
title("Aufgenommenes EMG-Rohsignal 10kHz")
xlabel("Zeit in ms")
ylabel("Spannung in mV")
subplot(3,1,2)
plot(processedData.F_M050W_1_Tim(107501:207500)*(3300/4096),"Color","#EDB120")
title("Hochpassgefiltertes EMG-Signal (<10Hz)")
xlabel("Zeit in ms")
ylabel("Spannung in mV")
subplot(3,1,3)
plot(processedData.FG_M050W_1_Tim(100001:200000)*(3300/4096),"Color","#77AC30")
hold on
area(processedData.RMS_M050W_1_Tim(100001:200000)*(3300/4096),"FaceColor","#0072BD","EdgeColor","#0072BD")
alpha(0.7)
title("Gleichgerichtetes (grün) und RMS-geglättetes (blau) EMG-Signal")
xlabel("Zeit in ms")
ylabel("Spannung in mV")
hold off

figure(3)
area(processedData.RMS_M050W_1_Tim(130001:165000).*finalData.CT_M050W_1_Tim(130001:165000)*(3300/4096))
alpha(0.5)
hold on
plot(processedData.FG_M050W_1_Tim(130001:165000)*(3300/4096))
plot(processedData.FG_M050W_1_Tim(130001:165000).*finalData.CT_M050W_1_Tim(130001:165000)*(3300/4096),"Color","#77AC30")
plot(processedData.RMS_M050W_1_Tim(130001:165000)*(3300/4096),"k")
plot(threshold(1:35000)*(3300/4096),"r")
title("Visualisierung der Kontraktionsdetektion mittels Schwellwertfunktion")
xlabel("Zeit in ms")
ylabel("Spannung in mV")