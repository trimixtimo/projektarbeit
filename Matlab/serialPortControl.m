function serialPortControl

clear %needed to open new connection to serialPort

%Connect serial port
serialP = serialport('COM3',500000,'Timeout',0.1);

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

    %create empty array to save data
    voltageData = [];
    
    %create string with current date and time for file association
    Datestring = string(datetime('now'));
    Datestring = strrep(Datestring,' ','_');
    Datestring = strrep(Datestring,':','-');

    %create .txt file to save data with unique filename
    fileID = fopen('Messungen/MessungRAW_'+Datestring+'.txt','a');
    
    %command is sended 5 times, to ensure the controller notices it while
    %sending the data with 500k baud
    for k = 1:5
        write(serialP,'raw\n','string')
    end
    
    %change status variable to true
    status = 1;

    while(status == 1)
        %read data from serialport buffer
        loopDataString = read(serialP,10000,"string"); 
        %10000 chars are equal to 2500 data points, because every data
        %point consists of 4 chars (3 hex digits and \n to break row)
        
        %save data to textfile
        fprintf(fileID,loopDataString); 
   
        %transform string data to voltage for live plotting
        loopDataHex = split(loopDataString);
        loopDataHex(end) = [];
        loopDataDec = hex2dec(loopDataHex);
        loopDataVolt = loopDataDec * (3298/4096);
        voltageData = [voltageData, transpose(loopDataVolt)];
        
        %let MATLAB look outside the loop for variable change
        %needed to make stop function work
        drawnow
        
        %plot last 10 seconds of data in UI figure
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
    
    %create empty array to save data
    voltageData = [];
    
    %create string with current date and time for file association
    Datestring = string(datetime('now'));
    Datestring = strrep(Datestring,' ','_');
    Datestring = strrep(Datestring,':','-');

    %create .txt file to save data with unique filename
    fileID = fopen('Messungen/MessungHULL_'+Datestring+'.txt','a');
    
    %command is sended 5 times, to ensure the controller notices it while
    %sending the data with 500k baud
    for k = 1:5
        write(serialP,'hul\n','string')
    end
    
    %change status variable to true
    status = 1;
    
    while(status ==1)
        %read data from serialport buffer
        loopDataString = read(serialP,10000,"string");
        %10000 chars are equal to 2500 data points, because every data
        %point consists of 4 chars (3 hex digits and \n to break row)
        
        %save data to textfile
        fprintf(fileID,loopDataString);
   
        %transform string data to voltage for live plotting
        loopDataHex = split(loopDataString);
        loopDataHex(end) = [];
        loopDataDec = hex2dec(loopDataHex);
        loopDataVolt = loopDataDec * (3298/4096);
        voltageData = [voltageData, transpose(loopDataVolt)];
        
        %let MATLAB look outside the while loop for variable change
        %needed to make stop function work
        drawnow
        
        %plot last 10 seconds of data in UI figure
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
    %change status variable to false
    status = 0;
    %pause to stop measurement-while-loop before sending stop-command
    %without pause, stop-command sometimes is interpreted as streamed
    %sensor data and occurs in saved data, causing errors in data
    %processing
    pause(0.3)
    %stop-command is sended 10 times in a row to ensure correct stoppage of
    %measurment, othertimes the controller does not "hear" the command
    %because high speed of data streaming
    for k = 1:10
        write(serialP,'stp\n','string')
    end
end
  

end