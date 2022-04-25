import time
import serial

#----Needed for communication with serial port----
from serialConnection import serialPort
print("Verbunden auf:" + serialPort.portstr)

def information():
    variable = 0
    seq = []
    count = 1
    while True:  # changed from 500 for testing
        if(serialPort.readline() != False): #prevent empty bits at beginning
            serial_bytes = serialPort.readline()
            count += 1 
        try:
            #print(serial_bytes.decode("ascii") + " | " + str(count))
            yield count, serial_bytes.decode("ascii")
        except UnicodeDecodeError:  #prevent random special chars
            continue
        #for c in serialPort.readline():
        #    seq.append(chr(c)) #convert from ANSII
        #    joined_seq = ''.join(str(v) for v in seq) #Make a string from array
        #    count += 1
        #    if chr(c) == '\n':
        #        #print("Line " + str(count) + ': ' + joined_seq)
        #        seq = []
        #        value = joined_seq.strip(' \n')
        #            #
        #        try:
        #            value = int(value, 16)
        #        except ValueError:
        #            value = '0'
        #            print('Messfehler')
        #            #
        #        yield count, value
        #        break
        #new
            #variable += 1
            #print(variable)
#        time.sleep(1)  # don't call in tkinter programs
