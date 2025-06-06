#!/usr/bin/env python3
import numpy as np
with open("fpcL.fasta","r")as prot:
        fpcL_m=prot.readlines()[1:]
fpcL_m=[char.replace('\n','') for char in fpcL_m]
fpcL_m="".join(fpcL_m)
fpcL_m="$"+fpcL_m
domains={"IPT/TIG":[np.arange(31,361),np.arange(1067,2175)],
        "PA14":np.arange(337,492),
        "G81":np.arange(2183,2303),
        "G82":np.arange(3035,3173),
        "PbH1":[np.arange(2484,2755),np.arange(3292,3514)],
        "Disordered":np.arange(4183,4208)}
my_seq="FYIRGDDRYAIYFSQTGRTEDKVR"
start=fpcL_m.find(my_seq)
end=start+len(my_seq)
print(f"sequence starts at {start} and ends at {end}")
#From CHATGPT
for domain_name, ranges in domains.items():
        if not isinstance(ranges, list):
                ranges = [ranges]
        for r in ranges:
        # Check if start or end is inside domain range
                if start in r or end in r:
                        print(f"Sequence overlaps with domain '{domain_name}'")
                        break
                else:
                        print("none found")
