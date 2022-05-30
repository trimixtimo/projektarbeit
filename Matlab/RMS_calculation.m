function [output] = RMS_calculation(filteredSignal)
%calculation of root-mean-square
%Formula: Frms = squareroot((1/(T2-T1))*Integral[T1-T2](f(t)^2))
%pre-allocate data array for lower runtime
RMS_array(length(filteredSignal)) = 0;
for k = 751:1:length(filteredSignal)-750
    integratedSection(1500) = 0;
    for i = 1:1:750
        integratedSection(750+i) = (filteredSignal(k+i)^2);
        integratedSection(751-i) = (filteredSignal(k-i)^2);
    end
    RMS_value = sqrt(sum(integratedSection)/1500);
    RMS_array(k) = RMS_value;
end
output = RMS_array;
