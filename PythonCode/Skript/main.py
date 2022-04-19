from tkinter import *
import script2
from pandas import DataFrame
import matplotlib
import matplotlib.pyplot as plt
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import matplotlib.animation as animation
#
import numpy as np
from datetime import datetime
from tkinter.filedialog import asksaveasfile
#

DELAY = 1  # in millisecs
active = False
x = []
y = []
x_plot = []
y_plot = []

root = Tk()
root.title("Software")
canvas = Canvas(root, width=800, height=300)
canvas.pack()

def do_update(gen, var):
    global active
    try:
        next_value, value2 = next(gen)
        x.append(next_value)
        x_plot.append(next_value)
        if len(x_plot) >= 100:
            x_plot.pop(0)
        y.append(value2)
        y_plot.append(value2)
        if len(y_plot) >= 100:
            y_plot.pop(0)
        print('Wert('+ str(next_value) + '): ' + str(value2))
        var1.set('Letzter Wert: ' + str(value2))
    except StopIteration:
        var.set('Done!')
    else:
        var.set('Messungen: ' + str(next_value))
        if active == True:
            root.after(DELAY, do_update, gen, var)  # call again after delay
#als .txt speichern
def Save():
    global y
    print(y)
    file = asksaveasfile(initialfile =  'Messung' + datetime.today().strftime('_%H-%M-%S_%d-%m-%Y'), filetypes=[('text file','*.txt'),('All Files', '*.*')], defaultextension = '.txt', title="Speicherort für .txt auswählen..",)
    print(file.name)
    np.savetxt(file.name, y, fmt='%s', delimiter='')
    print('Messung gespeichert')
#Messung starten
def run_script(var):
    global active
    active = True
    button1['state'] = DISABLED
    button2['state'] = NORMAL
    button5['state'] = DISABLED
    button6['state'] = DISABLED
    #serial.write(bytes(x, 'utf-8'))
    gen = script2.information()  # create generator object
    do_update(gen, var)  # start iterating generator and updating var
#Messung stoppen
def run_stop():
    global active
    active = False
    button1['state'] = NORMAL
    button2['state'] = DISABLED
    button5['state'] = NORMAL
    button6['state'] = NORMAL
    var.set('Messung gestoppt..')
    var1.set('Messung gestoppt..')
#Messung löschen
def Delete():
    global active, x, y, x_plot, y_plot
    active = False
    x = []
    y = []
    x_plot = []
    y_plot = []
    var.set('Messung gelöscht..')
    var1.set('Messung gelöscht..')

var = StringVar()
var1 = StringVar()
var.set('Warte auf Messung..')
var1.set('Warte auf Messung..')

#TEST
def animate(i):
    print('Plot update!')
    plot.clear()
    plot.plot(x_plot, y_plot)
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
button5 = Button(labelframe2, text="Messung speichern", command=lambda: Save())
button5.pack(side='left', ipadx=100, padx=50, pady=20)
button6 = Button(labelframe2, text="Messung löschen", command=lambda: Delete())
button6.pack(side='right', ipadx=100, padx=50, pady=20)

button1 = Button(labelframe1, text="Messung starten", command=lambda: run_script(var))
button1.pack(side='left', ipadx=100, padx=50, pady=20)
button2 = Button(labelframe1, text="Messung stoppen", state = DISABLED, command=lambda: run_stop())
button2.pack(side='right', ipadx=100, padx=50, pady=20)

status = Label(labelframe3, textvariable=var, bd=1, relief=SUNKEN, anchor=W, font=("Arial", 12, 'bold'))
status.pack(side='right', ipadx=40, padx=50, pady=20)
status1 = Label(labelframe3, textvariable=var1, bd=1, relief=SUNKEN, anchor=W, font=("Arial", 12, 'bold'))
status1.pack(side='left', ipadx=40, padx=50, pady=20)

ani = animation.FuncAnimation(figure, animate, interval=1000)

# create a menu
menubar = Menu(root)
# create a sub-menu
filemenu = Menu(menubar, tearoff=0)
menubar.add_command(label="Exit", command=root.quit)
root.config(menu=menubar)

root.mainloop()