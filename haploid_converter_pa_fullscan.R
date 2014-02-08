script.pa <- "chr <- read.table('5pop_chrZZ.calls', header=F)
mZZ<- read.table('markerZZ_ref.txt', sep='\\t', header=T)
mZZ.panel <- read.table('markerZZ_ref_imp.txt', sep='\\t', header=T)
chr.pa <- chr[,405:459]

alleleA <- mZZ[,3]
alleleB <- mZZ[,4]

binari.converter = function(chrab, max) {
	indexer_N <- as.vector(chrab[1:max]=='N')
	indexer_A <- as.vector(chrab[1:max]==chrab['alleleA'])
	indexer_B <- as.vector(chrab[1:max]==chrab['alleleB'])
	xx <- as.vector(replace(chrab[1:max], indexer_N, '?'))
	yy <- replace(xx, indexer_A, 1)
	zz <- replace(yy, indexer_B, 0)
return (zz)
}

chrab <- cbind(chr.pa, 'alleleA'=as.character(alleleA), 'alleleB'=as.character(alleleB))
chr.bin <- data.frame(t(apply(chrab,1,binari.converter,max=55)))

chr_m <-list()
for (i in 1:55)
{chr_m[[i]] <- cbind(mZZ.panel, chr.bin[,i], chr.bin[,i])
write.table(chr_m[[i]], paste('chrZZ_pafull_panel',i,sep=''), sep='\\t', 
col.names=F, row.names=F, quote=F)
}"

scriptlist.pa <- list()

for (i in 1:14)
{scriptlist.pa[[i]] <- gsub('ZZ', i, script.pa)
write.table(scriptlist.pa[[i]], paste('haploid_converter_pa_chr',i,'.R',sep=''),col.names=F, row.names=F, quote=F)
}


