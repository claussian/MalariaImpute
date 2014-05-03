script <- "pa.all <- list()
pd.all <- list()
ph.all <- list()
pt.all <- list()
pv.all <- list()

pa.all.head <- read.table('iES_chrZZ_pa_bgl1.txt', header=T)

ind <- c(1:nrow(pa.all.head))
pa.freq <- data.frame(row.names=ind)
pd.freq <- data.frame(row.names=ind)
ph.freq <- data.frame(row.names=ind)
pt.freq <- data.frame(row.names=ind)
pv.freq <- data.frame(row.names=ind)

pa.ihha <- data.frame(row.names=ind)
pd.ihha <- data.frame(row.names=ind)
ph.ihha <- data.frame(row.names=ind)
pt.ihha <- data.frame(row.names=ind)
pv.ihha <- data.frame(row.names=ind)

pa.ihhd <- data.frame(row.names=ind)
pd.ihhd <- data.frame(row.names=ind)
ph.ihhd <- data.frame(row.names=ind)
pt.ihhd <- data.frame(row.names=ind)
pv.ihhd <- data.frame(row.names=ind)

pa.ies <- data.frame(row.names=ind)
pd.ies <- data.frame(row.names=ind)
ph.ies <- data.frame(row.names=ind)
pt.ies <- data.frame(row.names=ind)
pv.ies <- data.frame(row.names=ind)


for (i in 1:10)
{pa.all[[i]] <- read.table(paste('iES_chrZZ_pa_bgl',i,'.txt',sep=''), header=T)
pd.all[[i]] <- read.table(paste('iES_chrZZ_pd_bgl',i,'.txt',sep=''), header=T)
ph.all[[i]] <- read.table(paste('iES_chrZZ_ph_bgl',i,'.txt',sep=''), header=T)
pt.all[[i]] <- read.table(paste('iES_chrZZ_pt_bgl',i,'.txt',sep=''), header=T)
pv.all[[i]] <- read.table(paste('iES_chrZZ_pv_bgl',i,'.txt',sep=''), header=T)

pa.freq <- cbind(pa.freq, pa.all[[i]][,'FREQ_a'])
pd.freq <- cbind(pd.freq, pd.all[[i]][,'FREQ_a'])
ph.freq <- cbind(ph.freq, ph.all[[i]][,'FREQ_a'])
pt.freq <- cbind(pt.freq, pt.all[[i]][,'FREQ_a'])
pv.freq <- cbind(pv.freq, pv.all[[i]][,'FREQ_a'])

pa.ihha <- cbind(pa.ihha, pa.all[[i]][,'IHHa'])
pd.ihha <- cbind(pd.ihha, pd.all[[i]][,'IHHa'])
ph.ihha <- cbind(ph.ihha, ph.all[[i]][,'IHHa'])
pt.ihha <- cbind(pt.ihha, pt.all[[i]][,'IHHa'])
pv.ihha <- cbind(pv.ihha, pv.all[[i]][,'IHHa'])

pa.ihhd <- cbind(pa.ihhd, pa.all[[i]][,'IHHd'])
pd.ihhd <- cbind(pd.ihhd, pd.all[[i]][,'IHHd'])
ph.ihhd <- cbind(ph.ihhd, ph.all[[i]][,'IHHd'])
pt.ihhd <- cbind(pt.ihhd, pt.all[[i]][,'IHHd'])
pv.ihhd <- cbind(pv.ihhd, pv.all[[i]][,'IHHd'])

pa.ies <- cbind(pa.ies, pa.all[[i]][,'IES'])
pd.ies <- cbind(pd.ies, pd.all[[i]][,'IES'])
ph.ies <- cbind(ph.ies, ph.all[[i]][,'IES'])
pt.ies <- cbind(pt.ies, pt.all[[i]][,'IES'])
pv.ies <- cbind(pv.ies, pv.all[[i]][,'IES'])
}

pa.freqm <- apply(pa.freq,1,median)
pd.freqm <- apply(pd.freq,1,median)
ph.freqm <- apply(ph.freq,1,median)
pt.freqm <- apply(pt.freq,1,median)
pv.freqm <- apply(pv.freq,1,median)

pa.ihham <- apply(pa.ihha,1,median)
pd.ihham <- apply(pd.ihha,1,median)
ph.ihham <- apply(ph.ihha,1,median)
pt.ihham <- apply(pt.ihha,1,median)
pv.ihham <- apply(pv.ihha,1,median)

pa.ihhdm <- apply(pa.ihhd,1,median)
pd.ihhdm <- apply(pd.ihhd,1,median)
ph.ihhdm <- apply(ph.ihhd,1,median)
pt.ihhdm <- apply(pt.ihhd,1,median)
pv.ihhdm <- apply(pv.ihhd,1,median)

pa.iesm <- apply(pa.ies,1,mean)
pd.iesm <- apply(pd.ies,1,mean)
ph.iesm <- apply(ph.ies,1,mean)
pt.iesm <- apply(pt.ies,1,mean)
pv.iesm <- apply(pv.ies,1,mean)

pa.mean <- cbind(pa.all[[1]][,1:2],pa.freqm,pa.ihham,pa.ihhdm,pa.iesm)
pd.mean <- cbind(pd.all[[1]][,1:2],pd.freqm,pd.ihham,pd.ihhdm,pd.iesm)
ph.mean <- cbind(ph.all[[1]][,1:2],ph.freqm,ph.ihham,ph.ihhdm,ph.iesm)
pt.mean <- cbind(pt.all[[1]][,1:2],pt.freqm,pt.ihham,pt.ihhdm,pt.iesm)
pv.mean <- cbind(pv.all[[1]][,1:2],pv.freqm,pv.ihham,pv.ihhdm,pv.iesm)

colnames(pa.mean) <- c('CHR','POSITION','FREQ_a','IHHa','IHHd','IES')
colnames(pd.mean) <- c('CHR','POSITION','FREQ_a','IHHa','IHHd','IES')
colnames(ph.mean) <- c('CHR','POSITION','FREQ_a','IHHa','IHHd','IES')
colnames(pt.mean) <- c('CHR','POSITION','FREQ_a','IHHa','IHHd','IES')
colnames(pv.mean) <- c('CHR','POSITION','FREQ_a','IHHa','IHHd','IES')

write.table(pa.mean, 'iES_mi_bgl_chrZZ_pa.txt', sep='\\t', col.names=T, row.names=F, quote=F)
write.table(pd.mean, 'iES_mi_bgl_chrZZ_pd.txt', sep='\\t', col.names=T, row.names=F, quote=F)
write.table(ph.mean, 'iES_mi_bgl_chrZZ_ph.txt', sep='\\t', col.names=T, row.names=F, quote=F)
write.table(pt.mean, 'iES_mi_bgl_chrZZ_pt.txt', sep='\\t', col.names=T, row.names=F, quote=F)
write.table(pv.mean, 'iES_mi_bgl_chrZZ_pv.txt', sep='\\t', col.names=T, row.names=F, quote=F)
"

scriptlist <- list()

for (i in 1:14)
{scriptlist[[i]] <- gsub('ZZ', i, script)
write.table(scriptlist[[i]], paste('MI_pool_bgl_chr',i,'.R',sep=''),col.names=F, row.names=F, quote=F)
}

