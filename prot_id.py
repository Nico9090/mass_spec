#!/usr/bin/env python3
import numpy as np
with open("fpc.fasta","r")as f:
        fpc_m=f.readlines()[1:]
with open("fpcL.fasta","r")as prot:
        fpcL_m=prot.readlines()[1:]

fpc_m=[char.replace('\n','') for char in fpc_m]
fpc_m="".join(fpc_m)
fpc_m="$"+fpc_m

fpcL_m=[char.replace('\n','') for char in fpcL_m]
fpcL_m="".join(fpcL_m)
fpcL_m="$"+fpcL_m

domains_fpc={"IPT/TIG":[np.arange(25,333),np.arange(945,1738)],
                "PA14":np.arange(323,483),
                "G81":np.arange(1928,2049),
                "PbH1":[np.arange(2244,2481),np.arange(3004,3212)],
                "G82":np.arange(2741,2867),
                "CTS":np.arange(3869,3886),
                "NLS":np.arange(3946,3970),
                "Disordered":[np.arange(3885,3915),np.arange(4015,4038)]
                }
domains_fpcL={"IPT/TIG":[np.arange(31,361),np.arange(1067,2175)],
        "PA14":np.arange(337,492),
        "G81":np.arange(2183,2303),
        "G82":np.arange(3035,3173),
        "PbH1":[np.arange(2484,2755),np.arange(3292,3514)],
        "Disordered":np.arange(4183,4208)}
fpcL_seq="FYIRGDDRYAIYFSQTGRTEDKVR"
fpc_seq=""
start_L=fpcL_m.find(my_seq)
end_L=start+len(my_seq)
print(f"sequence starts at {start} and ends at {end}")
#From CHATGPT
for domain_name, ranges in domains_fpcL.items():
        if not isinstance(ranges, list):
                ranges = [ranges]
        for r in ranges:
        # Check if start or end is inside domain range
                if start in r or end in r:
                        print(f"Sequence overlaps with domain '{domain_name}'")
                        break
                else:
                        print("none found")
for key, values in domains_fpc.items():
        if not isinstance(values, list):
                values = [values]
        for r in values:
        # Check if start or end is inside domain range
                if start in r or end in r:
                        print(f"Sequence overlaps with domain '{domain_name}'")
                        break
                else:
                        print("none found")
