rawData = load("rawData.mat");
processedData = load("processedData.mat");
finalData = load("finalData");


%% Linus
for k = 1:length(finalData.contraction_M050W_1_Lin)
    avgCon_M050W_1_Lin(k) = mean(finalData.contraction_M050W_1_Lin{k});
end
for k = 1:length(finalData.contraction_M050W_2_Lin)
    avgCon_M050W_2_Lin(k) = mean(finalData.contraction_M050W_2_Lin{k});
end
for k = 1:length(finalData.contraction_M050W_3_Lin)
    avgCon_M050W_3_Lin(k) = mean(finalData.contraction_M050W_3_Lin{k});
end
for k = 1:length(finalData.contraction_M050W_4_Lin)
    avgCon_M050W_4_Lin(k) = mean(finalData.contraction_M050W_4_Lin{k});
end
for k = 1:length(finalData.contraction_M050W_5_Lin)
    avgCon_M050W_5_Lin(k) = mean(finalData.contraction_M050W_5_Lin{k});
end

avgCon_M050W_Lin = mean([mean(avgCon_M050W_1_Lin),mean(avgCon_M050W_2_Lin),mean(avgCon_M050W_3_Lin),mean(avgCon_M050W_4_Lin),mean(avgCon_M050W_5_Lin)]);

for k = 1:length(finalData.contraction_M100W_1_Lin)
    avgCon_M100W_1_Lin(k) = mean(finalData.contraction_M100W_1_Lin{k});
end
for k = 1:length(finalData.contraction_M100W_2_Lin)
    avgCon_M100W_2_Lin(k) = mean(finalData.contraction_M100W_2_Lin{k});
end
for k = 1:length(finalData.contraction_M100W_3_Lin)
    avgCon_M100W_3_Lin(k) = mean(finalData.contraction_M100W_3_Lin{k});
end
for k = 1:length(finalData.contraction_M100W_4_Lin)
    avgCon_M100W_4_Lin(k) = mean(finalData.contraction_M100W_4_Lin{k});
end
for k = 1:length(finalData.contraction_M100W_5_Lin)
    avgCon_M100W_5_Lin(k) = mean(finalData.contraction_M100W_5_Lin{k});
end

avgCon_M100W_Lin = mean([mean(avgCon_M100W_1_Lin),mean(avgCon_M100W_2_Lin),mean(avgCon_M100W_3_Lin),mean(avgCon_M100W_4_Lin),mean(avgCon_M100W_5_Lin)]);

for k = 1:length(finalData.contraction_M150W_1_Lin)
    avgCon_M150W_1_Lin(k) = mean(finalData.contraction_M150W_1_Lin{k});
end
for k = 1:length(finalData.contraction_M150W_2_Lin)
    avgCon_M150W_2_Lin(k) = mean(finalData.contraction_M150W_2_Lin{k});
end
for k = 1:length(finalData.contraction_M150W_3_Lin)
    avgCon_M150W_3_Lin(k) = mean(finalData.contraction_M150W_3_Lin{k});
end
for k = 1:length(finalData.contraction_M150W_4_Lin)
    avgCon_M150W_4_Lin(k) = mean(finalData.contraction_M150W_4_Lin{k});
end
for k = 1:length(finalData.contraction_M150W_5_Lin)
    avgCon_M150W_5_Lin(k) = mean(finalData.contraction_M150W_5_Lin{k});
end

avgCon_M150W_Lin = mean([mean(avgCon_M150W_1_Lin),mean(avgCon_M150W_2_Lin),mean(avgCon_M150W_3_Lin),mean(avgCon_M150W_4_Lin),mean(avgCon_M150W_5_Lin)]);

for k = 1:length(finalData.contraction_M200W_1_Lin)
    avgCon_M200W_1_Lin(k) = mean(finalData.contraction_M200W_1_Lin{k});
end
for k = 1:length(finalData.contraction_M200W_2_Lin)
    avgCon_M200W_2_Lin(k) = mean(finalData.contraction_M200W_2_Lin{k});
end
for k = 1:length(finalData.contraction_M200W_3_Lin)
    avgCon_M200W_3_Lin(k) = mean(finalData.contraction_M200W_3_Lin{k});
end
for k = 1:length(finalData.contraction_M200W_4_Lin)
    avgCon_M200W_4_Lin(k) = mean(finalData.contraction_M200W_4_Lin{k});
end
for k = 1:length(finalData.contraction_M200W_5_Lin)
    avgCon_M200W_5_Lin(k) = mean(finalData.contraction_M200W_5_Lin{k});
end

avgCon_M200W_Lin = mean([mean(avgCon_M200W_1_Lin),mean(avgCon_M200W_2_Lin),mean(avgCon_M200W_3_Lin),mean(avgCon_M200W_4_Lin),mean(avgCon_M200W_5_Lin)]);

AVG_contractionValues_Lin = [avgCon_M050W_Lin,avgCon_M100W_Lin,avgCon_M150W_Lin,avgCon_M200W_Lin];

%% Lucas
for k = 1:length(finalData.contraction_M050W_1_Luc)
    avgCon_M050W_1_Luc(k) = mean(finalData.contraction_M050W_1_Luc{k});
end
for k = 1:length(finalData.contraction_M050W_2_Luc)
    avgCon_M050W_2_Luc(k) = mean(finalData.contraction_M050W_2_Luc{k});
end
for k = 1:length(finalData.contraction_M050W_3_Luc)
    avgCon_M050W_3_Luc(k) = mean(finalData.contraction_M050W_3_Luc{k});
end
for k = 1:length(finalData.contraction_M050W_4_Luc)
    avgCon_M050W_4_Luc(k) = mean(finalData.contraction_M050W_4_Luc{k});
end
for k = 1:length(finalData.contraction_M050W_5_Luc)
    avgCon_M050W_5_Luc(k) = mean(finalData.contraction_M050W_5_Luc{k});
end

avgCon_M050W_Luc = mean([mean(avgCon_M050W_1_Luc),mean(avgCon_M050W_2_Luc),mean(avgCon_M050W_3_Luc),mean(avgCon_M050W_4_Luc),mean(avgCon_M050W_5_Luc)]);

for k = 1:length(finalData.contraction_M100W_1_Luc)
    avgCon_M100W_1_Luc(k) = mean(finalData.contraction_M100W_1_Luc{k});
end
for k = 1:length(finalData.contraction_M100W_2_Luc)
    avgCon_M100W_2_Luc(k) = mean(finalData.contraction_M100W_2_Luc{k});
end
for k = 1:length(finalData.contraction_M100W_3_Luc)
    avgCon_M100W_3_Luc(k) = mean(finalData.contraction_M100W_3_Luc{k});
end
for k = 1:length(finalData.contraction_M100W_4_Luc)
    avgCon_M100W_4_Luc(k) = mean(finalData.contraction_M100W_4_Luc{k});
end
for k = 1:length(finalData.contraction_M100W_5_Luc)
    avgCon_M100W_5_Luc(k) = mean(finalData.contraction_M100W_5_Luc{k});
end

avgCon_M100W_Luc = mean([mean(avgCon_M100W_1_Luc),mean(avgCon_M100W_2_Luc),mean(avgCon_M100W_3_Luc),mean(avgCon_M100W_4_Luc),mean(avgCon_M100W_5_Luc)]);

for k = 1:length(finalData.contraction_M150W_1_Luc)
    avgCon_M150W_1_Luc(k) = mean(finalData.contraction_M150W_1_Luc{k});
end
for k = 1:length(finalData.contraction_M150W_2_Luc)
    avgCon_M150W_2_Luc(k) = mean(finalData.contraction_M150W_2_Luc{k});
end
for k = 1:length(finalData.contraction_M150W_3_Luc)
    avgCon_M150W_3_Luc(k) = mean(finalData.contraction_M150W_3_Luc{k});
end
for k = 1:length(finalData.contraction_M150W_4_Luc)
    avgCon_M150W_4_Luc(k) = mean(finalData.contraction_M150W_4_Luc{k});
end
for k = 1:length(finalData.contraction_M150W_5_Luc)
    avgCon_M150W_5_Luc(k) = mean(finalData.contraction_M150W_5_Luc{k});
end

avgCon_M150W_Luc = mean([mean(avgCon_M150W_1_Luc),mean(avgCon_M150W_2_Luc),mean(avgCon_M150W_3_Luc),mean(avgCon_M150W_4_Luc),mean(avgCon_M150W_5_Luc)]);

for k = 1:length(finalData.contraction_M200W_1_Luc)
    avgCon_M200W_1_Luc(k) = mean(finalData.contraction_M200W_1_Luc{k});
end
for k = 1:length(finalData.contraction_M200W_2_Luc)
    avgCon_M200W_2_Luc(k) = mean(finalData.contraction_M200W_2_Luc{k});
end
for k = 1:length(finalData.contraction_M200W_3_Luc)
    avgCon_M200W_3_Luc(k) = mean(finalData.contraction_M200W_3_Luc{k});
end
for k = 1:length(finalData.contraction_M200W_4_Luc)
    avgCon_M200W_4_Luc(k) = mean(finalData.contraction_M200W_4_Luc{k});
end
for k = 1:length(finalData.contraction_M200W_5_Luc)
    avgCon_M200W_5_Luc(k) = mean(finalData.contraction_M200W_5_Luc{k});
end

avgCon_M200W_Luc = mean([mean(avgCon_M200W_1_Luc),mean(avgCon_M200W_2_Luc),mean(avgCon_M200W_3_Luc),mean(avgCon_M200W_4_Luc),mean(avgCon_M200W_5_Luc)]);

AVG_contractionValues_Luc = [avgCon_M050W_Luc,avgCon_M100W_Luc,avgCon_M150W_Luc,avgCon_M200W_Luc];

%% Meenu
for k = 1:length(finalData.contraction_M050W_1_Mee)
    avgCon_M050W_1_Mee(k) = mean(finalData.contraction_M050W_1_Mee{k});
end
for k = 1:length(finalData.contraction_M050W_2_Mee)
    avgCon_M050W_2_Mee(k) = mean(finalData.contraction_M050W_2_Mee{k});
end
for k = 1:length(finalData.contraction_M050W_3_Mee)
    avgCon_M050W_3_Mee(k) = mean(finalData.contraction_M050W_3_Mee{k});
end
for k = 1:length(finalData.contraction_M050W_4_Mee)
    avgCon_M050W_4_Mee(k) = mean(finalData.contraction_M050W_4_Mee{k});
end
for k = 1:length(finalData.contraction_M050W_5_Mee)
    avgCon_M050W_5_Mee(k) = mean(finalData.contraction_M050W_5_Mee{k});
end

avgCon_M050W_Mee = mean([mean(avgCon_M050W_1_Mee),mean(avgCon_M050W_2_Mee),mean(avgCon_M050W_3_Mee),mean(avgCon_M050W_4_Mee),mean(avgCon_M050W_5_Mee)]);

for k = 1:length(finalData.contraction_M100W_1_Mee)
    avgCon_M100W_1_Mee(k) = mean(finalData.contraction_M100W_1_Mee{k});
end
for k = 1:length(finalData.contraction_M100W_2_Mee)
    avgCon_M100W_2_Mee(k) = mean(finalData.contraction_M100W_2_Mee{k});
end
for k = 1:length(finalData.contraction_M100W_3_Mee)
    avgCon_M100W_3_Mee(k) = mean(finalData.contraction_M100W_3_Mee{k});
end
for k = 1:length(finalData.contraction_M100W_4_Mee)
    avgCon_M100W_4_Mee(k) = mean(finalData.contraction_M100W_4_Mee{k});
end
for k = 1:length(finalData.contraction_M100W_5_Mee)
    avgCon_M100W_5_Mee(k) = mean(finalData.contraction_M100W_5_Mee{k});
end

avgCon_M100W_Mee = mean([mean(avgCon_M100W_1_Mee),mean(avgCon_M100W_2_Mee),mean(avgCon_M100W_3_Mee),mean(avgCon_M100W_4_Mee),mean(avgCon_M100W_5_Mee)]);

for k = 1:length(finalData.contraction_M150W_1_Mee)
    avgCon_M150W_1_Mee(k) = mean(finalData.contraction_M150W_1_Mee{k});
end
for k = 1:length(finalData.contraction_M150W_2_Mee)
    avgCon_M150W_2_Mee(k) = mean(finalData.contraction_M150W_2_Mee{k});
end
for k = 1:length(finalData.contraction_M150W_3_Mee)
    avgCon_M150W_3_Mee(k) = mean(finalData.contraction_M150W_3_Mee{k});
end
for k = 1:length(finalData.contraction_M150W_4_Mee)
    avgCon_M150W_4_Mee(k) = mean(finalData.contraction_M150W_4_Mee{k});
end
for k = 1:length(finalData.contraction_M150W_5_Mee)
    avgCon_M150W_5_Mee(k) = mean(finalData.contraction_M150W_5_Mee{k});
end

avgCon_M150W_Mee = mean([mean(avgCon_M150W_1_Mee),mean(avgCon_M150W_2_Mee),mean(avgCon_M150W_3_Mee),mean(avgCon_M150W_4_Mee),mean(avgCon_M150W_5_Mee)]);

for k = 1:length(finalData.contraction_M200W_1_Mee)
    avgCon_M200W_1_Mee(k) = mean(finalData.contraction_M200W_1_Mee{k});
end
for k = 1:length(finalData.contraction_M200W_2_Mee)
    avgCon_M200W_2_Mee(k) = mean(finalData.contraction_M200W_2_Mee{k});
end
for k = 1:length(finalData.contraction_M200W_3_Mee)
    avgCon_M200W_3_Mee(k) = mean(finalData.contraction_M200W_3_Mee{k});
end
for k = 1:length(finalData.contraction_M200W_4_Mee)
    avgCon_M200W_4_Mee(k) = mean(finalData.contraction_M200W_4_Mee{k});
end
for k = 1:length(finalData.contraction_M200W_5_Mee)
    avgCon_M200W_5_Mee(k) = mean(finalData.contraction_M200W_5_Mee{k});
end

avgCon_M200W_Mee = mean([mean(avgCon_M200W_1_Mee),mean(avgCon_M200W_2_Mee),mean(avgCon_M200W_3_Mee),mean(avgCon_M200W_4_Mee),mean(avgCon_M200W_5_Mee)]);

AVG_contractionValues_Mee = [avgCon_M050W_Mee,avgCon_M100W_Mee,avgCon_M150W_Mee,avgCon_M200W_Mee];

%% Melissa
for k = 1:length(finalData.contraction_M050W_1_Mel)
    avgCon_M050W_1_Mel(k) = mean(finalData.contraction_M050W_1_Mel{k});
end
for k = 1:length(finalData.contraction_M050W_2_Mel)
    avgCon_M050W_2_Mel(k) = mean(finalData.contraction_M050W_2_Mel{k});
end
for k = 1:length(finalData.contraction_M050W_3_Mel)
    avgCon_M050W_3_Mel(k) = mean(finalData.contraction_M050W_3_Mel{k});
end
for k = 1:length(finalData.contraction_M050W_4_Mel)
    avgCon_M050W_4_Mel(k) = mean(finalData.contraction_M050W_4_Mel{k});
end
for k = 1:length(finalData.contraction_M050W_5_Mel)
    avgCon_M050W_5_Mel(k) = mean(finalData.contraction_M050W_5_Mel{k});
end

avgCon_M050W_Mel = mean([mean(avgCon_M050W_1_Mel),mean(avgCon_M050W_2_Mel),mean(avgCon_M050W_3_Mel),mean(avgCon_M050W_4_Mel),mean(avgCon_M050W_5_Mel)]);

for k = 1:length(finalData.contraction_M100W_1_Mel)
    avgCon_M100W_1_Mel(k) = mean(finalData.contraction_M100W_1_Mel{k});
end
for k = 1:length(finalData.contraction_M100W_2_Mel)
    avgCon_M100W_2_Mel(k) = mean(finalData.contraction_M100W_2_Mel{k});
end
for k = 1:length(finalData.contraction_M100W_3_Mel)
    avgCon_M100W_3_Mel(k) = mean(finalData.contraction_M100W_3_Mel{k});
end
for k = 1:length(finalData.contraction_M100W_4_Mel)
    avgCon_M100W_4_Mel(k) = mean(finalData.contraction_M100W_4_Mel{k});
end
for k = 1:length(finalData.contraction_M100W_5_Mel)
    avgCon_M100W_5_Mel(k) = mean(finalData.contraction_M100W_5_Mel{k});
end

avgCon_M100W_Mel = mean([mean(avgCon_M100W_1_Mel),mean(avgCon_M100W_2_Mel),mean(avgCon_M100W_3_Mel),mean(avgCon_M100W_4_Mel),mean(avgCon_M100W_5_Mel)]);

for k = 1:length(finalData.contraction_M150W_1_Mel)
    avgCon_M150W_1_Mel(k) = mean(finalData.contraction_M150W_1_Mel{k});
end
for k = 1:length(finalData.contraction_M150W_2_Mel)
    avgCon_M150W_2_Mel(k) = mean(finalData.contraction_M150W_2_Mel{k});
end
for k = 1:length(finalData.contraction_M150W_3_Mel)
    avgCon_M150W_3_Mel(k) = mean(finalData.contraction_M150W_3_Mel{k});
end
for k = 1:length(finalData.contraction_M150W_4_Mel)
    avgCon_M150W_4_Mel(k) = mean(finalData.contraction_M150W_4_Mel{k});
end
for k = 1:length(finalData.contraction_M150W_5_Mel)
    avgCon_M150W_5_Mel(k) = mean(finalData.contraction_M150W_5_Mel{k});
end

avgCon_M150W_Mel = mean([mean(avgCon_M150W_1_Mel),mean(avgCon_M150W_2_Mel),mean(avgCon_M150W_3_Mel),mean(avgCon_M150W_4_Mel),mean(avgCon_M150W_5_Mel)]);

for k = 1:length(finalData.contraction_M200W_1_Mel)
    avgCon_M200W_1_Mel(k) = mean(finalData.contraction_M200W_1_Mel{k});
end
for k = 1:length(finalData.contraction_M200W_2_Mel)
    avgCon_M200W_2_Mel(k) = mean(finalData.contraction_M200W_2_Mel{k});
end
for k = 1:length(finalData.contraction_M200W_3_Mel)
    avgCon_M200W_3_Mel(k) = mean(finalData.contraction_M200W_3_Mel{k});
end
for k = 1:length(finalData.contraction_M200W_4_Mel)
    avgCon_M200W_4_Mel(k) = mean(finalData.contraction_M200W_4_Mel{k});
end
for k = 1:length(finalData.contraction_M200W_5_Mel)
    avgCon_M200W_5_Mel(k) = mean(finalData.contraction_M200W_5_Mel{k});
end

avgCon_M200W_Mel = mean([mean(avgCon_M200W_1_Mel),mean(avgCon_M200W_2_Mel),mean(avgCon_M200W_3_Mel),mean(avgCon_M200W_4_Mel),mean(avgCon_M200W_5_Mel)]);

AVG_contractionValues_Mel = [avgCon_M050W_Mel,avgCon_M100W_Mel,avgCon_M150W_Mel,avgCon_M200W_Mel];

%% Timo
for k = 1:length(finalData.contraction_M050W_1_Tim)
    avgCon_M050W_1_Tim(k) = mean(finalData.contraction_M050W_1_Tim{k});
end
for k = 1:length(finalData.contraction_M050W_2_Tim)
    avgCon_M050W_2_Tim(k) = mean(finalData.contraction_M050W_2_Tim{k});
end
for k = 1:length(finalData.contraction_M050W_3_Tim)
    avgCon_M050W_3_Tim(k) = mean(finalData.contraction_M050W_3_Tim{k});
end
for k = 1:length(finalData.contraction_M050W_4_Tim)
    avgCon_M050W_4_Tim(k) = mean(finalData.contraction_M050W_4_Tim{k});
end
for k = 1:length(finalData.contraction_M050W_5_Tim)
    avgCon_M050W_5_Tim(k) = mean(finalData.contraction_M050W_5_Tim{k});
end

avgCon_M050W_Tim = mean([mean(avgCon_M050W_1_Tim),mean(avgCon_M050W_2_Tim),mean(avgCon_M050W_3_Tim),mean(avgCon_M050W_4_Tim),mean(avgCon_M050W_5_Tim)]);

for k = 1:length(finalData.contraction_M100W_1_Tim)
    avgCon_M100W_1_Tim(k) = mean(finalData.contraction_M100W_1_Tim{k});
end
for k = 1:length(finalData.contraction_M100W_2_Tim)
    avgCon_M100W_2_Tim(k) = mean(finalData.contraction_M100W_2_Tim{k});
end
for k = 1:length(finalData.contraction_M100W_3_Tim)
    avgCon_M100W_3_Tim(k) = mean(finalData.contraction_M100W_3_Tim{k});
end
for k = 1:length(finalData.contraction_M100W_4_Tim)
    avgCon_M100W_4_Tim(k) = mean(finalData.contraction_M100W_4_Tim{k});
end
for k = 1:length(finalData.contraction_M100W_5_Tim)
    avgCon_M100W_5_Tim(k) = mean(finalData.contraction_M100W_5_Tim{k});
end

avgCon_M100W_Tim = mean([mean(avgCon_M100W_1_Tim),mean(avgCon_M100W_2_Tim),mean(avgCon_M100W_3_Tim),mean(avgCon_M100W_4_Tim),mean(avgCon_M100W_5_Tim)]);

for k = 1:length(finalData.contraction_M150W_1_Tim)
    avgCon_M150W_1_Tim(k) = mean(finalData.contraction_M150W_1_Tim{k});
end
for k = 1:length(finalData.contraction_M150W_2_Tim)
    avgCon_M150W_2_Tim(k) = mean(finalData.contraction_M150W_2_Tim{k});
end
for k = 1:length(finalData.contraction_M150W_3_Tim)
    avgCon_M150W_3_Tim(k) = mean(finalData.contraction_M150W_3_Tim{k});
end
for k = 1:length(finalData.contraction_M150W_4_Tim)
    avgCon_M150W_4_Tim(k) = mean(finalData.contraction_M150W_4_Tim{k});
end
for k = 1:length(finalData.contraction_M150W_5_Tim)
    avgCon_M150W_5_Tim(k) = mean(finalData.contraction_M150W_5_Tim{k});
end

avgCon_M150W_Tim = mean([mean(avgCon_M150W_1_Tim),mean(avgCon_M150W_2_Tim),mean(avgCon_M150W_3_Tim),mean(avgCon_M150W_4_Tim),mean(avgCon_M150W_5_Tim)]);

for k = 1:length(finalData.contraction_M200W_1_Tim)
    avgCon_M200W_1_Tim(k) = mean(finalData.contraction_M200W_1_Tim{k});
end
for k = 1:length(finalData.contraction_M200W_2_Tim)
    avgCon_M200W_2_Tim(k) = mean(finalData.contraction_M200W_2_Tim{k});
end
for k = 1:length(finalData.contraction_M200W_3_Tim)
    avgCon_M200W_3_Tim(k) = mean(finalData.contraction_M200W_3_Tim{k});
end
for k = 1:length(finalData.contraction_M200W_4_Tim)
    avgCon_M200W_4_Tim(k) = mean(finalData.contraction_M200W_4_Tim{k});
end
for k = 1:length(finalData.contraction_M200W_5_Tim)
    avgCon_M200W_5_Tim(k) = mean(finalData.contraction_M200W_5_Tim{k});
end

avgCon_M200W_Tim = mean([mean(avgCon_M200W_1_Tim),mean(avgCon_M200W_2_Tim),mean(avgCon_M200W_3_Tim),mean(avgCon_M200W_4_Tim),mean(avgCon_M200W_5_Tim)]);

AVG_contractionValues_Tim = [avgCon_M050W_Tim,avgCon_M100W_Tim,avgCon_M150W_Tim,avgCon_M200W_Tim];

