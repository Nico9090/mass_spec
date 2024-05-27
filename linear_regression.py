#!/usr/bin/env python3
#Obtain values from a dataset
x=[]
y=[]
with open('xpoints.txt','r')as f:
        for line in f:
                x.append(int(line[0:-1]))
with open('ypoints.txt','r')as f:
        for line in f:
                y.append(int(line[0:-1]))
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
        rsqs.append(y[i]-alpha[0]-s*x[i])
sum_rsqs=0
for i in rsqs:
        sum_rsqs+=i

#Finding alpha

#1)Find sum of y values
sum_y=0
for i in range(len(y)):
        sum_y+=y[i]

#2) Find sum of x values
sum_x=0
for i in range(len(x)):
        sum_x+=x[i]
#2)Find B
bup=[]
bdown=[]
for i in range(len(y)):
        bup.append((x[i]-sum_x)*(y[i]-sum_y))
        bdown.append((x[i]-sum_x)**2)
sum_bup=0
sum_bdown=0
for i in range(len(bup)):
        sum_bup+=i
for i in range(len(bdown)):
        sum_bdown+=i
b=sum_bup/sum_bdown
print(b)

