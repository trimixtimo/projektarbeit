import serial
 
ser = serial.Serial(port='COM5', baudrate=9600, bytesize=serial.EIGHTBITS, 
    parity=serial.PARITY_NONE, timeout=1)
ser.flushInput()
 
while True:
    print(ser.read())