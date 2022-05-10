function serialPortControl

clear %needed to open new connection to serialPort

%Connect serialport
serialP = serialport('COM4',500000,'Timeout',0.1);

%Create status variable
global status;
status = 0;

%Create UI figure
fig = uifigure;
fig.Name = 'Steuerung Sensorsystem';
fig.Position = [200 150 1200 800];

%Manage app layout
gl = uigridlayout(fig,[2 3]);
gl.RowHeight = {60, '1x'};
gl.ColumnWidth = {'fit','1x'};

%Create UI components
btn1 = uibutton(gl);
btn2 = uibutton(gl);
btn3 = uibutton(gl);
ax = uiaxes(gl);

%Lay out UI components
%Position Btn1
btn1.Layout.Row = 1;
btn1.Layout.Column = 1;
%Position Btn2
btn2.Layout.Row = 1;
btn2.Layout.Column = 2;
%Position Btn3
btn3.Layout.Row = 1;
btn3.Layout.Column = 3;
%Position plot
ax.Layout.Row = 2;
ax.Layout.Column = [1 3];

%Configure UI components
btn1.Text = 'Starte Rohsignal-Messung';
btn2.Text = 'Starte Hüllkurven-Messung';
btn3.Text = 'Stoppe Messung';
ax.XLim = [0 100000];
ax.YLim = [0 3350];

%Assign functions to buttons
btn1.ButtonPushedFcn = {@startRawMsrmnt};
btn2.ButtonPushedFcn = {@startHulMsrmnt};
btn3.ButtonPushedFcn = {@stopMsrmnt};

%Define Button functions

%---------Rohmessung--------------
function startRawMsrmnt(btn, event)

    voltageData = [];
    
    Datestring = string(datetime('now'));
    Datestring = strrep(Datestring,' ','_');
    Datestring = strrep(Datestring,':','-');

    
    fileID = fopen('C:/Users/linus/Desktop/Projektarbeit2/Messungen/MessungRAW_'+Datestring+'.txt','a');
    
   
    for k = 1:5
        write(serialP,'raw\n','string')
    end
    
    status = 1;

    while(status == 1)
        loopDataString = read(serialP,10000,"string");
        fprintf(fileID,loopDataString); %10000 Zeichen entsprechen 2500 Messwerten, die auf einmal geschrieben werden (4 Zeichen pro Messwert)
   
        loopDataHex = split(loopDataString);
        %length(loopDataHex)
        loopDataHex(end) = [];
        %length(loopDataHex)
        loopDataDec = hex2dec(loopDataHex);
        loopDataVolt = loopDataDec * (3298/4096);
        voltageData = [voltageData, transpose(loopDataVolt)];
        
        drawnow
        
        if length(voltageData) <= 100000
            plot(ax,voltageData)
        else
            plot(ax,voltageData(end-100000:end))
        end

    end
    fclose(fileID);
end

%----------Hüllkurvenmessung--------------
function startHulMsrmnt(btn, event)
    
    voltageData = [];
    
    Datestring = string(datetime('now'));
    Datestring = strrep(Datestring,' ','_');
    Datestring = strrep(Datestring,':','-');

    fileID = fopen('C:/Users/linus/Desktop/Projektarbeit2/Messungen/MessungHULL_'+Datestring+'.txt','a');
    
    for k = 1:5
        write(serialP,'hul\n','string')
    end
    
    status = 1;
    
    while(status ==1)
        loopDataString = read(serialP,10000,"string");
        fprintf(fileID,loopDataString); %10000 Zeichen entsprechen 2500 Messwerten, die auf einmal geschrieben werden (4 Zeichen pro Messwert)
   
        loopDataHex = split(loopDataString);
        loopDataHex(end) = [];
        loopDataDec = hex2dec(loopDataHex);
        loopDataVolt = loopDataDec * (3298/4096);
        voltageData = [voltageData, transpose(loopDataVolt)];
        
        drawnow
        
        if length(voltageData) <= 100000
            plot(ax,voltageData)
        else
            plot(ax,voltageData(end-100000:end))
        end

    end
    fclose(fileID);
end

%---------Stoppe Messung-----------
function stopMsrmnt(btn, event)
    status = 0;
    pause(0.1)
    for k = 1:10
        write(serialP,'stp\n','string')
    end
end
        



end