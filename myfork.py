import os, time
import sys
import signal 
import time

def sig_handler(sig_num, frame):
    print("SIGNAL: " + str(sig_num))
    exit(0)

signal.signal(signal.SIGINT, sig_handler)  
signal.signal(signal.SIGTERM, sig_handler) 
signal.signal(signal.SIGHUP, sig_handler) 

print('Hello! I am an example')
pid = os.fork()
print('pid of my child is %s' % pid)
if pid == 0:
    print('I am a child. Im going to sleep')
    for i in range(1,40):
      print('mrrrrr')
      a = 2**i
      print(a)
      pid = os.fork()
      if pid == 0:
            print('my name is %s' % a)
            sys.exit(0)
      else:
            print("my child pid is %s" % pid)
      time.sleep(1)
    print('Bye')
    sys.exit(0)

else:
    for i in range(1,200):
      print('HHHrrrrr')

      time.sleep(1)
      print(3**i)
    print('I am the parent')

