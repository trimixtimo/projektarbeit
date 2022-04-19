import time
import serial

#SerialCode
ser = serial.Serial(
    port='COM5',\
    baudrate=250000,\
    parity=serial.PARITY_NONE,\
    stopbits=serial.STOPBITS_ONE,\
    bytesize=serial.EIGHTBITS,\
        timeout=0)
print("Verbunden auf:" + ser.portstr)

def information():
    variable = 0
    seq = []
    count = 1
    while True:  # changed from 500 for testing
        for c in ser.read():
            seq.append(chr(c)) #convert from ANSII
            joined_seq = ''.join(str(v) for v in seq) #Make a string from array
            if chr(c) == '\n':
                #print("Line " + str(count) + ': ' + joined_seq)
                seq = []
                count += 1
                value = joined_seq.strip(' \n')
                    #
                try:
                    value = int(value, 16)
                except ValueError:
                    value = '0'
                    print('Messfehler')
                    #
                yield count, value
                break
        #new
            #variable += 1
            #print(variable)
#        time.sleep(1)  # don't call in tkinter programs
