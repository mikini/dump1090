#! /bin/bash 

# Setup dump1090 to take input from GNS 5890
# (http://www.gns-gmbh.com/index.php?id=238&L=1)

# Tell usbserial that VID/PID is in fact a serial port
sudo modprobe usbserial vendor=0x4d8 product=0xf8e8

# continously relay from serial port to the dump1090 raw socket
# if you are not in dialout group this might require root
gnome-terminal --command "bash -c 'echo Serial port relayer starting...; while true; do cat /dev/tty$SERIALPORT |nc localhost 30001; sleep 5; echo $(date -Is) restarted; done'"

# dump input for debugging
#gnome-terminal --command "bash -c 'echo Raw-dumper starting...; nc localhost 30002; read -p <enter> to end;'"

# do it
./dump1090 --net-only --interactive
