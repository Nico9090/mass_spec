#!/usr/bin/env python3
import re
import numpy as np
class Supervised_ML:
    def __init__(self,data_file):
            self.data=data_file
    def linear_R(data_file):
            x,y=[],[]
            with open(data_file,'r')as f:
                for line in f:
                        if not re.match(r'^\d',line):
                              continue
                        else:
                             points=line.strip().split("|")
                             x.append(float(points[0]))
                             y.append(float(points[-1])) 
            mean_x,mean_y=np.mean(x),np.mean(y)
            stdev_x,stdev_y=np.std(x),np.std(y)
            cor=np.corrcoef(x,y)[0,1] #source:datacamp
            sl=(cor*stdev_y)/(stdev_x)
            y_int=mean_y-sl*mean_x
            y_pred=[]
            y_pred.append(sl*x+y_int)
            return f"slope : {sl}, y_intercept : {y_int}"
sample_data=Supervised_ML
print(sample_data.linear_R("sample_file.txt"))
