import sys
b = open(sys.argv[1],"rb").read(2)
addr = b[0] | (b[1]<<8)
print(hex(addr))
