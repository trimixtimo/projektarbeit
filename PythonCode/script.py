import serial
from itertools import count #TEST
import matplotlib.pyplot as plt
from datetime import datetime
#
import numpy as np
from IPython.display import display, clear_output
#
import tkinter as tk
from tkinter import * 
from tkinter.filedialog import asksaveasfile
#SerialEinbindung
ser = serial.Serial(
    port='COM5',\
    baudrate=9600,\
    parity=serial.PARITY_NONE,\
    stopbits=serial.STOPBITS_ONE,\
    bytesize=serial.EIGHTBITS,\
    timeout=0)
print("Verbunden auf:" + ser.portstr) #Hallo Schnittstelle
x = []
y = []
#GIU Buttoncode
plt_aktiv = False
def StartStop():
    global plt_aktiv
    plt_aktiv = not plt_aktiv
    my_mainloop()
    print('Messung gestartet/gestoppt')
#Messung löschen
def deleteArray():
    global x, y
    x = []
    y = []
    print('Messung gelöscht')
#als .txt speichern
def Save():
    global y
    print(y)
    file = asksaveasfile(initialfile =  'Messung' + datetime.today().strftime('_%H-%M-%S_%d-%m-%Y'), filetypes=[('text file','*.txt'),('All Files', '*.*')], defaultextension = '.txt', title="Speicherort für .txt auswählen..",)
    print(file.name)
    np.savetxt(file.name, y, fmt='%s', delimiter='')
    print('Messung gespeichert')
#Useroberfläche
window = tk.Tk()
window.title('EEG Messung mit MyroSensor')
button = tk.Button(text="Messung starten/stoppen", width=25, height=5, bg="yellow", fg="black", command=lambda *args: StartStop())
button1 = tk.Button(text="Messung löschen", width=25, height=5, bg="grey", fg="black", command=lambda *args: deleteArray())
button2 = tk.Button(text="aktuelle Messung speichern", width=25, height=5, bg="grey", fg="black", command=lambda *args: Save())
button.pack()
button1.pack()
button2.pack()
#Anzeige des letzen Wertes
def label(value):
    w.config(text = 'Letzer Wert:' + str(value) + 'mV')
w = Label(window, text="Letzer Wert: 0 mV", font=(30))
w.pack()
#Diagramm erstellen
index = count()
plt.rcParams['toolbar'] = 'None'
fig = plt.figure()
fig.suptitle('Spannung über Zeit - MyoWare Muscle Sensor Signal')
ax = fig.add_subplot(1, 1, 1) 
#Schnittstelle Verarbeitungsschleife
Datenpaket_1BYTE = [] #Array zum zwischenspeichern des Datenpakets
def my_mainloop():
    global Datenpaket_1BYTE
    for c in ser.read():
        Datenpaket_1BYTE.append(chr(c)) #convert from ANSII
        Datenpaket = ''.join(str(v) for v in Datenpaket_1BYTE) #Make a string from array
        #Überprüfen wann \n kommt und dies als Paket wahrnehmen/verarbeiten
        if chr(c) == '\n':
            #
            x.append(next(index))
            y.append(int(Datenpaket, 16)) #Eingangswert von HEX auf DEZ, und in Y-ACHSE hinzufügen
            label(y[-1])
            ax.cla()
            ax.plot(x, y)
            plt.xlabel("Zeit in ms")
            plt.ylabel("Spannung in mV")
            display(fig);  
            clear_output(wait = True)
            plt.pause(0.001)
            #
            Datenpaket_1BYTE = [] #Array für nächstes Paket wd frei machen
        break
    if plt_aktiv == True:
        window.after(100, my_mainloop)  # run again after 1000ms (1s)
window.mainloop()