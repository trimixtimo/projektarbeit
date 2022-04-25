import serial

#Configure Serial Port
serialPort = serial.Serial(
    port = "COM5",
    baudrate = 250000,
    rtscts = False,
    bytesize = 8,
    timeout = 0,
    write_timeout = 0
)
serialPort.flushInput()