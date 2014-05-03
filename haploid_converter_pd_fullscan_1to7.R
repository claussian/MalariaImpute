script.pd <- "chr <- read.table('5pop_chrZZ.calls', header=F)
mZZ <- read.table('markerZZ_ref.txt', sep='\\t', header=T)
mZZ.panel <- read.table('markerZZ_ref_imp.txt', sep='\\t', header=T)
chr.pd <- chr[,1:91]

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

chrab <- cbind(chr.pd, 'alleleA'=as.character(alleleA), 'alleleB'=as.character(alleleB))
chr.bin <- data.frame(t(apply(chrab,1,binari.converter, max=91)))

chr_m <-list()
for (i in 1:91)
{chr_m[[i]] <- cbind(mZZ.panel, chr.bin[,i], chr.bin[,i])
write.table(chr_m[[i]], paste('chrZZ_pdfull_panel',i,sep=''), sep='\\t', 
col.names=F, row.names=F, quote=F)
}"

scriptlist.pd <- list()

for (i in 1:7)
{scriptlist.pd[[i]] <- gsub('ZZ', i, script.pd)
write.table(scriptlist.pd[[i]], paste('haploid_converter_pd_chr',i,'.R',sep=''),col.names=F, row.names=F, quote=F)
}