script <- "pa.imp <- read.table('Full.chrZZ_pa_AA', header=F)
pd.imp <- read.table('Full.chrZZ_pd_AA', header=F)
ph.imp <- read.table('Full.chrZZ_ph_AA', header=F)
pt.imp <- read.table('Full.chrZZ_pt_AA', header=F)
pv.imp <- read.table('Full.chrZZ_pv_AA', header=F)
samples <- readLines('5pop_590.samples')

#sample 10 datasets according to posterior probabilities, vector(1,2) for major and minor alleles (dosages are for major alleles!)
allele.sampler = function(pop) {
	imp <- sapply(pop,function(x) {sample(c(1,2),1,prob=c(x,1-x))})
return (imp)
}

pa.mi <- list()
pd.mi <- list()
ph.mi <- list()
pt.mi <- list()
pv.mi <- list()

pa.rehh <- list()
pd.rehh <- list()
ph.rehh <- list()
pt.rehh <- list()
pv.rehh <- list()

for (i in 1:10)
{pa.mi[[i]] <- data.frame(t(apply(pa.imp,1,allele.sampler)))
pd.mi[[i]] <- data.frame(t(apply(pd.imp,1,allele.sampler)))
ph.mi[[i]] <- data.frame(t(apply(ph.imp,1,allele.sampler)))
pt.mi[[i]] <- data.frame(t(apply(pt.imp,1,allele.sampler)))
pv.mi[[i]] <- data.frame(t(apply(pv.imp,1,allele.sampler)))

colnames(pa.mi[[i]]) <- as.character(samples[405:459])
colnames(pd.mi[[i]]) <- as.character(samples[1:91])
colnames(ph.mi[[i]]) <- as.character(samples[92:344])
colnames(pt.mi[[i]]) <- as.character(samples[345:404])
colnames(pv.mi[[i]]) <- as.character(samples[460:590])

pa.rehh[[i]] <- t(pa.mi[[i]])
pd.rehh[[i]] <- t(pd.mi[[i]])
ph.rehh[[i]] <- t(ph.mi[[i]])
pt.rehh[[i]] <- t(pt.mi[[i]])
pv.rehh[[i]] <- t(pv.mi[[i]])

write.table(pa.rehh[[i]], file = paste('chrZZ_pa_imp',i,'.rehh',sep=''), 
	sep='\t', quote =F, col.names=F, row.names=T)
write.table(pd.rehh[[i]], file = paste('chrZZ_pd_imp',i,'.rehh',sep=''), 
	sep='\t', quote =F, col.names=F, row.names=T)
write.table(ph.rehh[[i]], file = paste('chrZZ_ph_imp',i,'.rehh',sep=''), 
	sep='\t', quote =F, col.names=F, row.names=T)
write.table(pt.rehh[[i]], file = paste('chrZZ_pt_imp',i,'.rehh',sep=''), 
	sep='\t', quote =F, col.names=F, row.names=T)
write.table(pv.rehh[[i]], file = paste('chrZZ_pv_imp',i,'.rehh',sep=''), 
	sep='\t', quote =F, col.names=F, row.names=T)
}"

scriptlist <- list()

for (i in 1:14)
{scriptlist[[i]] <- gsub('ZZ', i, script)
write.table(scriptlist[[i]], paste('MI_imp_sampler_chr',i,'.R',sep=''),col.names=F, row.names=F, quote=F)
}
	

