import threading
from tkinter import *
import tkinter as tk
import serial
import matplotlib
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import matplotlib.animation as animation
from tkinter.filedialog import asksaveasfile
import numpy as np
from datetime import datetime
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
    global msg, count
    msg = ""
    count += 1 
    msg = ser.readline()
    if msg != "":
        #print('Wert(' + str(count) + '): ' + str(msg)) 
        return msg, count
#----------Befehl senden----------
def WriteSerial(command):
    print("Befehl " + command + " an Gerät gesendet")
    ser.write(bytes(command, 'utf-8'))
    ReadSerial()
#----------Messung am Gerät starten/Buttons deaktivieren----------
def run_script(var):
    global active
    active = True
    button1['state'] = DISABLED
    button2['state'] = DISABLED
    button3['state'] = NORMAL
    button5['state'] = DISABLED
    button6['state'] = DISABLED
    WriteSerial(var)
#Messung stoppen
def run_stop():
    global active
    active = False
    button1['state'] = NORMAL
    button2['state'] = NORMAL
    button3['state'] = DISABLED
    button5['state'] = NORMAL
    button6['state'] = NORMAL
    var.set('Messung gestoppt..')
    var1.set('Messung gestoppt..')
    WriteSerial("stp")
#----------im angegeben Verzeichnis als .txt abspeichern----------
def Save():
    global y_Werte
    print(y_Werte)
    file = asksaveasfile(initialfile =  'Messung' + datetime.today().strftime('_%H-%M-%S_%d-%m-%Y'), filetypes=[('text file','*.txt'),('All Files', '*.*')], defaultextension = '.txt', title="Speicherort für .txt auswählen..",)
    print(file.name)
    np.savetxt(file.name, y_Werte, fmt='%s', delimiter='')
    print('Messung gespeichert')
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
canvas.pack()
inputData = Entry(root, text="<Slave1&p>") # input for enter the message to write
entrymsg = inputData.get() # get the massage
buttonMsg = Button(root, text="send", command = lambda: WriteSerial(inputData.get())) # create a send button for send the message
readData = Label(root, text=msg) # show message in Tkinter
ReadSerial()
# show items
inputData.pack()
readData.pack()
buttonMsg.pack()
#
var = StringVar()
var1 = StringVar()
var.set('Warte auf Messung..')
var1.set('Warte auf Messung..')
# Use TkAgg
matplotlib.use("TkAgg")
# Create a figure of specific size
figure = Figure(figsize=(14, 4), dpi=65)
figure.suptitle('Spannung über Zeit - MyoWare Muscle Sensor Signal.. letzten 100 Messungen')
# Define the points for plotting the figure
plot = figure.add_subplot(1, 1, 1)
# Add a canvas widget to associate the figure with canvas
canvas = FigureCanvasTkAgg(figure, root)
canvas.get_tk_widget().place(x = -50, y = 0)

labelframe1 = LabelFrame(root, text="Sensor", font=("Arial", 10, 'bold'))  
labelframe1.pack(fill="both", expand="yes")
labelframe2 = LabelFrame(root, text="Software", font=("Arial", 10, 'bold'))
labelframe2.pack(fill="both", expand="yes")
labelframe3 = LabelFrame(root, text="Messungen", font=("Arial", 10, 'bold'))  
labelframe3.pack(fill="both", expand="yes")
#toplabel = Label(labelframe1, text="You can put your happy thoughts here")  
#toplabel.pack()  
button5 = Button(labelframe2, text="Messung speichern/Ort fürs speichern des Messung wählen", command=lambda: Save())
button5.pack(side='left', ipadx=100, padx=50, pady=20)
button6 = Button(labelframe2, text="Messung löschen", command=lambda: Delete())
button6.pack(side='right', ipadx=100, padx=50, pady=20)

button1 = Button(labelframe1, text="Hul Messung starten", command=lambda: run_script('hul'))
button1.pack(side='left', ipadx=100, padx=50, pady=20)
button2 = Button(labelframe1, text="Raw Messung starten", command=lambda: run_script('raw'))
button2.pack(side='left', ipadx=100, padx=50, pady=20)
button3 = Button(labelframe1, text="Messung stoppen", state = DISABLED, command=lambda: run_stop())
button3.pack(side='right', ipadx=100, padx=0, pady=20)

status = Label(labelframe3, textvariable=var, bd=1, relief=SUNKEN, anchor=W, font=("Arial", 12, 'bold'))
status.pack(side='right', ipadx=40, padx=50, pady=20)
status1 = Label(labelframe3, textvariable=var1, bd=1, relief=SUNKEN, anchor=W, font=("Arial", 12, 'bold'))
status1.pack(side='left', ipadx=40, padx=50, pady=20)
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
        entrymsg = inputData.get()
        var1.set('Letzter Wert: ' + str(len(y_Werte)))
#SerialThread
def SerialProgram():
    while 1==1:
        if active == True:
            if(ReadSerial() != False):
                Wert, Time = ReadSerial()
            try:
                print('Wert(' + str(Time) + '): ' + Wert.decode("ascii").rstrip("\n"))
                x_Werte.append(Time)
                #zum plotten
                x_plot.append(Time)
                if len(x_plot) >= 100:
                    x_plot.pop(0)
                y_plot.append(Wert.decode("ascii").rstrip(" \n"))
                if len(y_plot) >= 100:
                    y_plot.pop(0)
                y_Werte.append(Wert.decode("ascii").rstrip(" \n")) 
            except UnicodeDecodeError:  #prevent random special chars
                continue
            readData.update_idletasks()
#Animation vom Plot aktivieren
#ani = animation.FuncAnimation(figure, animate, interval=2000)
#Threads definieren/starten
x = threading.Thread(target=TkinterGui, args=())
y = threading.Thread(target=SerialProgram, args=())
x.start()
y.start()

root.mainloop()