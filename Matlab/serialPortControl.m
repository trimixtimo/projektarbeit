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

%Manage app layout
gl = uigridlayout(fig,[1 3]);
gl.RowHeight = {30, '1x'};
gl.ColumnWidth = {'fit','1x'};

%Create UI components
btn1 = uibutton(gl);
btn2 = uibutton(gl);
btn3 = uibutton(gl);

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

%Configure UI components
btn1.Text = 'Starte Rohsignal-Messung';
btn2.Text = 'Starte Hüllkurven-Messung';
btn3.Text = 'Stoppe Messung';

%Assign functions to buttons
btn1.ButtonPushedFcn = {@startRawMsrmnt};
btn2.ButtonPushedFcn = {@startHulMsrmnt};
btn3.ButtonPushedFcn = {@stopMsrmnt};

%Define Button functions
function startRawMsrmnt(btn, event)
    Datestring = string(datetime('now'));
    Datestring = strrep(Datestring,' ','_');
    Datestring = strrep(Datestring,':','-');

    
    fileID = fopen('C:/Users/linus/Desktop/Projektarbeit2/Messungen/Messung_'+Datestring+'.txt','a');
    
    tic
    for k = 1:5
        write(serialP,'raw\n','string')
    end
    
    status = 1;
%     while(status ==1)
%         %fprintf(fileID,readline(serialP)+'\n');
%         fprintf(fileID,read(serialP,10000,"string"));
%         flush(serialP);
%         drawnow
%     end
    fclose(fileID);
    toc
end

function startHulMsrmnt(btn, event)
    Datestring = string(datetime('now'));
    Datestring = strrep(Datestring,' ','_');
    Datestring = strrep(Datestring,':','-');

    
    fileID = fopen('C:/Users/linus/Desktop/Projektarbeit2/Messungen/Messung_'+Datestring+'.txt','a');
    
    tic
    for k = 1:5
    write(serialP,'hul\n','string')
    end
    
    status = 1;
    while(status ==1)
        %fprintf(fileID,readline(serialP)+'\n');
        fprintf(fileID,read(serialP,10000,"string"));
        flush(serialP);
        drawnow
    end
    fclose(fileID);
    toc
end

function stopMsrmnt(btn, event)
    for k = 1:5
    write(serialP,'stp\n','string')
    end
    status = 0;
end
        



end