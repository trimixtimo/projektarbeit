import threading
from tkinter import *
import tkinter as tk
import serial
import matplotlib
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import matplotlib.animation as animation
from tkinter.filedialog import asksaveasfile
from tkinter import filedialog
import numpy as np
from datetime import datetime
from pathlib import Path
root = tk.Tk()
#----------Serialeinbindung----------
COM = "COM5"
ser = serial.Serial(port=COM, baudrate=250000, bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, timeout=2)
ser.isOpen()
#----------globale Variabeln----------
msg = ""
status = "ON"
count = 0;
active = False
x_Werte = []
y_Werte = []
x_plot = []
y_plot = []
#----------Werte einlesen----------
def ReadSerial():
    global msg, count, y_Werte
    msg = ""
    count += 1 
    msg = ser.readline()
    if msg != "":
        #print('Wert(' + str(count) + '): ' + str(msg))
        y_Werte.append(msg)
        return msg, count
#----------Befehl senden----------
def WriteSerial(command):
    print("Befehl " + command + " an Gerät gesendet")
    ser.write(bytes(command, 'utf-8'))
    ReadSerial()
#----------Messung am Gerät starten/Buttons deaktivieren----------
def run_script(var):
    global active, count
    count = 0
    active = True
    StartHulButton['state'] = DISABLED
    StartRawButton['state'] = DISABLED
    button3['state'] = NORMAL
    SaveButton['state'] = DISABLED
    WriteSerial(var)
#Messung stoppen
def run_stop():
    global active, y_Werte
    active = False
    entrymsg = SaveDirectoryDisplay.get()
    textfile = open(entrymsg + '/Messung' + datetime.today().strftime('_%H-%M-%S_%d-%m-%Y') + ".txt", "a+")
    for index, item in enumerate(y_Werte):
        try:
            #y_Werte[index] = item.decode("ascii")
            #y_Werte[x] = x.decode("ascii").rstrip("\n")
            textfile.write(item.decode("ascii"))
        except UnicodeDecodeError:  #prevent random special chars
            continue
    StartHulButton['state'] = NORMAL
    StartRawButton['state'] = NORMAL
    button3['state'] = DISABLED
    SaveButton['state'] = NORMAL
    WriteSerial("stp")
#----------im angegeben Verzeichnis als .txt abspeichern----------
def SelectSaveDirectory():
    filedirectory = filedialog.askdirectory(title="Speicherort für .txt auswählen..")
    print(filedirectory)
    SaveDirectoryDisplay.configure(state=NORMAL)
    SaveDirectoryDisplay.delete(0,END)
    SaveDirectoryDisplay.insert(0, filedirectory)
    SaveDirectoryDisplay.configure(state=DISABLED)
    #file = asksaveasfile(initialfile =  'Messung' + datetime.today().strftime('_%H-%M-%S_%d-%m-%Y'), filetypes=[('text file','*.txt'),('All Files', '*.*')], defaultextension = '.txt', title="Speicherort für .txt auswählen..",)
    #print(file.name)
    #np.savetxt(file.name, y_Werte, fmt='%s', delimiter='')
    print('Speicherort gespeichert')
#----------Arrays leeren----------
def Delete():
    global active, x_Werte, y_Werte, count
    active = False
    count = 0
    x_Werte = []
    y_Werte = []

    var.set('Messung gelöscht..')
    var1.set('Messung gelöscht..')
#----------Graphen aktualisieren----------
def animate(i):
    print('Plot update!')
    plot.clear()
    plot.plot(x_plot, y_plot)
#----------GUI Overlay----------
root.title("Software")
canvas = Canvas(root, width=800, height=300)
canvas.grid()
root.resizable(0, 0)
root.columnconfigure(0, weight=1)
root.rowconfigure(1, weight=3)
#
var = StringVar()
var1 = StringVar()
# Use TkAgg
matplotlib.use("TkAgg")
# Create a figure of specific size
figure = Figure(figsize=(14, 4), dpi=65)
figure.suptitle('Spannung über Zeit - MyoWare Muscle Sensor Signal.. letzten 100 Messungen')
# Define the points for plotting the figure
plot = figure.add_subplot(1, 1, 1)
# Add a canvas widget to associate the figure with canvas
canvas = FigureCanvasTkAgg(figure, root)
canvas.get_tk_widget().grid(column=0, row=0, sticky=N, padx=5, pady=5)

labelframe1 = LabelFrame(root, text="Sensor", font=("Arial", 10, 'bold'))  
labelframe1.grid(sticky='we')
labelframe2 = LabelFrame(root, text="Software", font=("Arial", 10, 'bold'))
labelframe2.grid(sticky='we')
#toplabel = Label(labelframe1, text="You can put your happy thoughts here")  
#toplabel.pack()  
SaveDirectoryDisplay = Entry(labelframe2, relief="sunken", width=100)
SaveDirectoryDisplay.grid(column=1, row=0)
SaveDirectoryDisplay.insert(0, str(Path(__file__).parent.absolute()))
SaveDirectoryDisplay.configure(state=DISABLED)
SaveButton = Button(labelframe2, text="Speicherort wählen", command=lambda: SelectSaveDirectory())
SaveButton.grid(column=2, row=0)

StartHulButton = Button(labelframe1, text="Hul Messung starten", command=lambda: run_script('hul'))
StartHulButton.grid(column=1, row=0, sticky='we', padx=20)
StartRawButton = Button(labelframe1, text="Raw Messung starten", command=lambda: run_script('raw'))
StartRawButton.grid(column=2, row=0, sticky='we', padx=20)
button3 = Button(labelframe1, text="Messung stoppen", state = DISABLED, command=lambda: run_stop())
button3.grid(column=1, columnspan=2, row=1, sticky='we', padx=20)

# create a menu
menubar = Menu(root)
# create a sub-menu
filemenu = Menu(menubar, tearoff=0)
menubar.add_command(label="Exit", command=root.quit)
root.config(menu=menubar)

#GUIThread
def TkinterGui():
    while 1==1:
        global msg
        entrymsg = SaveDirectoryDisplay.get()
        var1.set('Letzter Wert: ' + str(len(y_Werte)))
#SerialThread
def SerialProgram():
    while 1==1:
        global textfile
        if active == True:
            if(ReadSerial() != False):
                Wert, Time = ReadSerial()
            try:
                print('Wert(' + str(Time) + '): ' + Wert.decode("ascii").rstrip("\n"))
                #Arrays zum plotten füllen
                #x_plot.append(Time)
                #if len(x_plot) >= 100:
                #    x_plot.pop(0)
                #y_plot.append(Wert.decode("ascii").rstrip(" \n"))
                #if len(y_plot) >= 100:
                #    y_plot.pop(0)
                #y_Werte.append(Wert.decode("ascii").rstrip(" \n")) 
            except UnicodeDecodeError:  #prevent random special chars
                continue
            SaveDirectoryDisplay.update_idletasks()
#Animation vom Plot aktivieren
#ani = animation.FuncAnimation(figure, animate, interval=2000)
#Threads definieren/starten
x = threading.Thread(target=TkinterGui, args=())
y = threading.Thread(target=SerialProgram, args=())
x.start()
y.start()

root.mainloop()