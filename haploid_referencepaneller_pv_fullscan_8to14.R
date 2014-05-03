script.pv <- "chr <- read.table('5pop_chrZZ.calls', header=F)
mZZ <- read.table('markerZZ_ref.txt', header=T)
maf.all <- read.table('bysnp_maf_chrZZ', header=T)

chr.pv <- chr[,460:590]
chr.rest <- chr[,1:459]

#population-specific referencing

alleleA <- mZZ[,3]
alleleB <- mZZ[,4]

mafX <- maf.all[,9]
mafX_1 <- 1-mafX


binari.converter = function(chrab, max) {
	indexer_A <- as.vector(chrab[1:max]==chrab['alleleA'])
	indexer_B <- as.vector(chrab[1:max]==chrab['alleleB'])
	xx <- vector()
	for(i in 1:max) {
	if(chrab[i]=='N') {
	xx[i] <- sample(c(0,1),1,prob=as.numeric(chrab[as.numeric(max+3):as.numeric(max+4)])) }
	else {
	xx[i] <- chrab[i]}
	}
	yy <- replace(xx, indexer_A, 1)
	zz <- replace(yy, indexer_B, 0)
return (zz)
}

chrab <- cbind(chr.pv, 'alleleA'=as.character(alleleA), 'alleleB'=as.character(alleleB),
				'maf'=mafX, 'maf_1'=mafX_1)
chr.hap.pv <- data.frame(t(apply(chrab,1,binari.converter,max=131)))
colnames(chr.hap.pv) <- c(1:131)

#cosmopolitan referencing

chrab <- cbind(chr.rest,  'alleleA'=as.character(alleleA), 'alleleB'=as.character(alleleB),
				'maf'=mafX, 'maf_1'=mafX_1)
chr.hap.rest <- data.frame(t(apply(chrab,1,binari.converter,max=459)))

#write hap files
chr.ref <- list()
chr.ref2 <- list()
chr.samp <- list()
for (i in 1:131)
{
chr.ref[[i]] <- chr.hap.pv[,!(colnames(chr.hap.pv) %in% i)]
chr.ref2[[i]] <- cbind(chr.ref[[i]], chr.hap.rest)

write.table(chr.ref2[[i]], paste('chrZZ_pvfull_cosmo_ref',i,sep=''), sep='\\t', 
col.names=F, row.names=F, quote=F)
}"

scriptlist.pv <- list()

for (i in 8:14)
{scriptlist.pv[[i]] <- gsub('ZZ', i, script.pv)
write.table(scriptlist.pv[[i]], paste('haploid_referencepaneller_pv_chr',i,'.R',sep=''),col.names=F, row.names=F, quote=F)
}





