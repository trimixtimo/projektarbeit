from logging import root
#----Needed for live-lpotting:----
#import matplotlib.pyplot as plt
#import matplotlib.animation as animation
#from matplotlib import style
#from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
#import numpy as np
#----Needed for buttons:-----
from tkinter import *
import tkinter.font as font
#----Needed for communication with serial port----
from serialConnection import serialPort
#----Needed for filename
from datetime import datetime

root = Tk()

status = OFF
#-----Define commands for microcontroller------
startRaw = "raw"
startHul = "hul"
stop = "stp"
#-----Define button functions------
def start_RawMsrmnt():
    if(serialPort.is_open):                 #check if port is open
        serialPort.close()                  #close open port
    serialPort.open()                       #restart port to ensure command is transmitted correctly
    for i in range(5):
        serialPort.write(startRaw.encode())
    global status
    status = ON
    print("Starte MessungRaw")

def start_HulMsrmnt():
    if(serialPort.is_open):
        serialPort.close()
    serialPort.open()
    for i in range(5):
        serialPort.write(startHul.encode())
    global status
    status = ON
    print("Starte MessungHul")

def stop_Msrmnt():
    if(serialPort.is_open):
        serialPort.close()
    serialPort.open()
    for i in range(5):
        serialPort.write(stop.encode())
    global status
    status = OFF
    print("Stoppe Messung")

#------Define serial reading and saving to .txt-file------
def serialReader():
    count = 0
    date = datetime.now().strftime(r"%I-%M-%S-%d_%m_%Y")    #create timestamp
    textfile = open(r"Messung_" + date + ".txt", "a+")    #create new file
    while(status == ON):
        if(serialPort.readline() != False): #prevent empty bits at beginning
            serial_bytes = serialPort.readline()
            count += 1 
            print(count)
        try:
            textfile.write(serial_bytes.decode("ascii"))
        except UnicodeDecodeError:  #prevent random special chars
            continue
    textfile.close()
            


#------Define buttons-------
button1 = Button(
    text="Rohsignal-Messung\nstarten", 
    command=lambda: [start_RawMsrmnt(), serialReader()], 
    width=10, height=10, 
    background= "lightblue", 
    font = font.Font(size=20,weight="bold"))
button1.pack(side='left', ipadx=50, padx=50, pady=50)
button2 = Button(
    text="Hüllkurven-Messung\nstarten", 
    command=lambda: [start_HulMsrmnt(), serialReader()], 
    width=10, height=10, 
    background= "lightgreen", 
    font = font.Font(size=20,weight="bold"))
button2.pack(side='left', ipadx=50, padx=50, pady=50)
button3 = Button(
    text="Messung stoppen", 
    command=lambda: stop_Msrmnt(), 
    width=10, height=10, 
    background= "red", 
    font = font.Font(size=20,weight="bold"))
button3.pack(side='right', ipadx=50, padx=50, pady=50)


root.mainloop()
