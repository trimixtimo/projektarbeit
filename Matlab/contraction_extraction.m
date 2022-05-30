function [output] = contraction_extraction(smoothedSignal,contractionTracker)
A = smoothedSignal.*contractionTracker;
ne0 = find(A~=0);                                   % Nonzero Elements
ix0 = unique([ne0(1) ne0(diff([0 ne0])>1)]);        % Non-Zero Segment Start Indices
eq0 = find(A==0);                                   % Zero Elements
ix1 = unique([eq0(1) eq0(diff([0 eq0])>1)]);        % Zero Segment Start Indices
ixv = sort([ix0 ix1 length(A)]);                    % Consecutive Indices Vector

for k1 = 1:length(ixv)-1
    extractedContractions{k1} = A(ixv(k1):ixv(k1+1)-1);
end
%Intervalle mit Durchschnitt von 0 (Zwischen-Kontraktionsbereich) werden
%gelöscht
for t = 1:(length(extractedContractions)/2)+1
    if mean(extractedContractions{t}) == 0
        extractedContractions(t) = [];
    end
end
%Intervalle, die kürzer sind als 2000 werden gelöscht, da es sich hier um
%zu kurze (falsch detektierte) Kontraktionen handelt
for t = 1:length(extractedContractions)
    if length(extractedContractions) >= t
        if length(extractedContractions{t}) < 2000
            extractedContractions(t) = [];
        end
    end
end
output = extractedContractions;
