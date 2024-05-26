#!/usr/bin/env python3
import random
#Generating random y values for a set of x values from -20 to 20
x=[]
y=[]
for i in range(-20,20):
        x.append(i)
i=1
while i<=40:
        y.append(random.randint(1,41))
        i+=1

#Linear regression test

#1) Find the y-int
alpha=[]
for i in range(len(x)):
        if x[i]==0:
                alpha.append(y[i])
#2) Find the slope

s=(y[-1]-y[0])//(x[-1]-x[0])
#2) Find sum of residual squares
rsqs=[]
for i in range(0,len(y)):
        rsqs.append(y[i]-alpha-s*x[i])
sum=0
for i in rsqs:
        sum+=i
