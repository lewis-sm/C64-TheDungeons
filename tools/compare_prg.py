import sys
a = open(sys.argv[1],"rb").read()
b = open(sys.argv[2],"rb").read()
# skip PRG header (first 2 bytes) if both have it
if len(a) > 2 and len(b) > 2:
    a_body = a[2:]; b_body = b[2:]
else:
    a_body = a; b_body = b
minlen = min(len(a_body), len(b_body))
for i in range(minlen):
    if a_body[i] != b_body[i]:
        print(f"diff at {hex(i)}: orig {a_body[i]:02X} new {b_body[i]:02X}")
        break
else:
    if len(a_body) != len(b_body):
        print("length mismatch", len(a_body), len(b_body))
    else:
        print("identical")
