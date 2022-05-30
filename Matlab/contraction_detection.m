function [output] = contraction_detection(smoothedSignal)
contractionTracker(length(smoothedSignal)) = 0;
%Schwellwertfunktion für Kontraktionsdetektion
for s = 1:1:length(smoothedSignal)
    if(smoothedSignal(s) > 10)
        contractionTracker(s) = 1;
    else
        contractionTracker(s) = 0;
    end
end
output = contractionTracker;