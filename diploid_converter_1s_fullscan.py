#!/usr/bin/env python                                                                            

from __future__ import with_statement
import timeit
import csv
import re

tic = timeit.default_timer()


for i in range(1,15):
	with open('bgl_chr_pa' + str(i)) as f:
		calls = [x.split() for x in f.readlines() if x]
	
	chr =[]
	for snpLine in calls:
		dipLine = [snpLine[0],snpLine[1]]
		for k in snpLine[2:]:
			dipLine.append(k)
			dipLine.append(k)
		chr.append(dipLine)
	
	with open('bgl_chr_pa' + str(i) +'.bgl', 'wb') as g:
		writer = csv.writer(g, delimiter = '\t')
		writer.writerows(chr)
		
for i in range(1,15):
	with open('bgl_chr_pd' + str(i)) as f:
		calls = [x.split() for x in f.readlines() if x]
	
	chr =[]
	for snpLine in calls:
		dipLine = [snpLine[0],snpLine[1]]
		for k in snpLine[2:]:
			dipLine.append(k)
			dipLine.append(k)
		chr.append(dipLine)
	
	with open('bgl_chr_pd' + str(i) +'.bgl', 'wb') as g:
		writer = csv.writer(g, delimiter = '\t')
		writer.writerows(chr)
		
for i in range(1,15):
	with open('bgl_chr_ph' + str(i)) as f:
		calls = [x.split() for x in f.readlines() if x]
	
	chr =[]
	for snpLine in calls:
		dipLine = [snpLine[0],snpLine[1]]
		for k in snpLine[2:]:
			dipLine.append(k)
			dipLine.append(k)
		chr.append(dipLine)
	
	with open('bgl_chr_ph' + str(i) +'.bgl', 'wb') as g:
		writer = csv.writer(g, delimiter = '\t')
		writer.writerows(chr)

for i in range(1,15):
	with open('bgl_chr_pt' + str(i)) as f:
		calls = [x.split() for x in f.readlines() if x]
	
	chr =[]
	for snpLine in calls:
		dipLine = [snpLine[0],snpLine[1]]
		for k in snpLine[2:]:
			dipLine.append(k)
			dipLine.append(k)
		chr.append(dipLine)
	
	with open('bgl_chr_pt' + str(i) +'.bgl', 'wb') as g:
		writer = csv.writer(g, delimiter = '\t')
		writer.writerows(chr)

for i in range(1,15):
	with open('bgl_chr_pv' + str(i)) as f:
		calls = [x.split() for x in f.readlines() if x]
	
	chr =[]
	for snpLine in calls:
		dipLine = [snpLine[0],snpLine[1]]
		for k in snpLine[2:]:
			dipLine.append(k)
			dipLine.append(k)
		chr.append(dipLine)
	
	with open('bgl_chr_pv' + str(i) +'.bgl', 'wb') as g:
		writer = csv.writer(g, delimiter = '\t')
		writer.writerows(chr)

toc = timeit.default_timer()
print (toc - tic)


