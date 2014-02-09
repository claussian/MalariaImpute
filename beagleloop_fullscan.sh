#!/bin/bash

for i in {1..14}
do 
	java -Xmx10000m -jar beagle.jar unphased=bgl_chr_pa$i.bgl markers=marker$i\_ref missing=N out=Full &
	java -Xmx10000m -jar beagle.jar unphased=bgl_chr_pd$i.bgl markers=marker$i\_ref missing=N out=Full &
	java -Xmx10000m -jar beagle.jar unphased=bgl_chr_ph$i.bgl markers=marker$i\_ref missing=N out=Full &
	java -Xmx10000m -jar beagle.jar unphased=bgl_chr_pt$i.bgl markers=marker$i\_ref missing=N out=Full &
	java -Xmx10000m -jar beagle.jar unphased=bgl_chr_pv$i.bgl markers=marker$i\_ref missing=N out=Full &
done

