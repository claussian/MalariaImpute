script <- "library(rehh)

pa.all <- list()
pd.all <- list()
ph.all <- list()
pt.all <- list()
pv.all <- list()

ihs.pa <- list()
ihs.pd <- list()
ihs.ph <- list()
ihs.pt <- list()
ihs.pv <- list()

ihs.pa.all <- data.frame('POSITION'=read.table('iES_chrZZ_pa_bgl1.txt', header=T)[,'POSITION'])
ihs.pd.all <- data.frame('POSITION'=read.table('iES_chrZZ_pd_bgl1.txt', header=T)[,'POSITION'])
ihs.ph.all <- data.frame('POSITION'=read.table('iES_chrZZ_ph_bgl1.txt', header=T)[,'POSITION'])
ihs.pt.all <- data.frame('POSITION'=read.table('iES_chrZZ_pt_bgl1.txt', header=T)[,'POSITION'])
ihs.pv.all <- data.frame('POSITION'=read.table('iES_chrZZ_pv_bgl1.txt', header=T)[,'POSITION'])

for (i in 1:10)
{pa.all[[i]] <- read.table(paste('iES_chrZZ_pa_bgl',i,'.txt',sep=''), header=T)
pd.all[[i]] <- read.table(paste('iES_chrZZ_pd_bgl',i,'.txt',sep=''), header=T)
ph.all[[i]] <- read.table(paste('iES_chrZZ_ph_bgl',i,'.txt',sep=''), header=T)
pt.all[[i]] <- read.table(paste('iES_chrZZ_pt_bgl',i,'.txt',sep=''), header=T)
pv.all[[i]] <- read.table(paste('iES_chrZZ_pv_bgl',i,'.txt',sep=''), header=T)

ihs.pa[[i]] <- ihh2ihs(pa.all[[i]], minmaf=0.01)$res.ihs[,2:4]
ihs.pd[[i]] <- ihh2ihs(pd.all[[i]], minmaf=0.01)$res.ihs[,2:4]
ihs.ph[[i]] <- ihh2ihs(ph.all[[i]], minmaf=0.01)$res.ihs[,2:4]
ihs.pt[[i]] <- ihh2ihs(pt.all[[i]], minmaf=0.01)$res.ihs[,2:4]
ihs.pv[[i]] <- ihh2ihs(pv.all[[i]], minmaf=0.01)$res.ihs[,2:4]

colnames(ihs.pa[[i]]) <- c('POSITION',paste('iHS.ind',i,sep=''),paste('Pvalue.ind',i,sep=''))
colnames(ihs.pd[[i]]) <- c('POSITION',paste('iHS.ind',i,sep=''),paste('Pvalue.ind',i,sep=''))
colnames(ihs.ph[[i]]) <- c('POSITION',paste('iHS.ind',i,sep=''),paste('Pvalue.ind',i,sep=''))
colnames(ihs.pt[[i]]) <- c('POSITION',paste('iHS.ind',i,sep=''),paste('Pvalue.ind',i,sep=''))
colnames(ihs.pv[[i]]) <- c('POSITION',paste('iHS.ind',i,sep=''),paste('Pvalue.ind',i,sep=''))

ihs.pa.all <- merge(ihs.pa.all, ihs.pa[[i]], by='POSITION')
ihs.pd.all <- merge(ihs.pd.all, ihs.pd[[i]], by='POSITION')
ihs.ph.all <- merge(ihs.ph.all, ihs.ph[[i]], by='POSITION')
ihs.pt.all <- merge(ihs.pt.all, ihs.pt[[i]], by='POSITION')
ihs.pv.all <- merge(ihs.pv.all, ihs.pv[[i]], by='POSITION')
}

ihs.pa.cat <- ihs.pa.all[,seq(2,ncol(ihs.pa.all),2)]
ihs.pd.cat <- ihs.pd.all[,seq(2,ncol(ihs.pd.all),2)]
ihs.ph.cat <- ihs.ph.all[,seq(2,ncol(ihs.ph.all),2)]
ihs.pt.cat <- ihs.pt.all[,seq(2,ncol(ihs.pt.all),2)]
ihs.pv.cat <- ihs.pv.all[,seq(2,ncol(ihs.pv.all),2)]

sumstats = function(x) {
	ihs <- mean(x,na.rm=T)
	ihs.sd <- sd(x, na.rm=T)
	n <- sum(is.na(x)==F)
return(c(ihs,ihs.sd,n))
}

ihs.pa.mean <- as.matrix(t(apply(ihs.pa.cat,1, sumstats)))
ihs.pd.mean <- as.matrix(t(apply(ihs.pd.cat,1, sumstats)))
ihs.ph.mean <- as.matrix(t(apply(ihs.ph.cat,1, sumstats)))
ihs.pt.mean <- as.matrix(t(apply(ihs.pt.cat,1, sumstats)))
ihs.pv.mean <- as.matrix(t(apply(ihs.pv.cat,1, sumstats)))

ihs.pa.mean <- cbind(rep(ZZ,nrow(ihs.pa.mean)),ihs.pa.all[,'POSITION'],ihs.pa.mean)
ihs.pd.mean <- cbind(rep(ZZ,nrow(ihs.pd.mean)),ihs.pd.all[,'POSITION'],ihs.pd.mean)
ihs.ph.mean <- cbind(rep(ZZ,nrow(ihs.ph.mean)),ihs.ph.all[,'POSITION'],ihs.ph.mean)
ihs.pt.mean <- cbind(rep(ZZ,nrow(ihs.pt.mean)),ihs.pt.all[,'POSITION'],ihs.pt.mean)
ihs.pv.mean <- cbind(rep(ZZ,nrow(ihs.pv.mean)),ihs.pv.all[,'POSITION'],ihs.pv.mean)

colnames(ihs.pa.mean) <- c('CHR','POSITION','iHS','iHS.sd','n')
colnames(ihs.pd.mean) <- c('CHR','POSITION','iHS','iHS.sd','n')
colnames(ihs.ph.mean) <- c('CHR','POSITION','iHS','iHS.sd','n')
colnames(ihs.pt.mean) <- c('CHR','POSITION','iHS','iHS.sd','n')
colnames(ihs.pv.mean) <- c('CHR','POSITION','iHS','iHS.sd','n')

write.table(ihs.pa.mean, 'iHS_mi_bgl_chrZZ_pa.txt', sep='\\t', col.names=T, row.names=F, quote=F)
write.table(ihs.pd.mean, 'iHS_mi_bgl_chrZZ_pd.txt', sep='\\t', col.names=T, row.names=F, quote=F)
write.table(ihs.ph.mean, 'iHS_mi_bgl_chrZZ_ph.txt', sep='\\t', col.names=T, row.names=F, quote=F)
write.table(ihs.pt.mean, 'iHS_mi_bgl_chrZZ_pt.txt', sep='\\t', col.names=T, row.names=F, quote=F)
write.table(ihs.pv.mean, 'iHS_mi_bgl_chrZZ_pv.txt', sep='\\t', col.names=T, row.names=F, quote=F)

#write.table(ihs.pa.cat, 'iHS_cat_bgl_chrZZ_pa.txt', sep='\\t', col.names=T, row.names=F, quote=F)
"

scriptlist <- list()

for (i in 1:14)
{scriptlist[[i]] <- gsub('ZZ', i, script)
write.table(scriptlist[[i]], paste('iHS_pool_bgl_chr',i,'.R',sep=''),col.names=F, row.names=F, quote=F)
}

