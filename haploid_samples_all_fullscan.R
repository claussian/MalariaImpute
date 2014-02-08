samp.pa <- read.table('pafull.samples', header=T)

#write samp files
chr.samp <- list()
for (i in 1:55)
{m = i + 1
chr.samp[[i]] <- rbind(samp.pa[1,],samp.pa[m,])
write.table(chr.samp[[i]], paste('pafull_samp',i,sep=''), sep='\t', 
col.names=T, row.names=F, quote=F)
}

samp.pd <- read.table('pdfull.samples', header=T)

#write samp files
chr.samp <- list()
for (i in 1:91)
{m = i + 1
chr.samp[[i]] <- rbind(samp.pd[1,],samp.pd[m,])
write.table(chr.samp[[i]], paste('pdfull_samp',i,sep=''), sep='\t', 
col.names=T, row.names=F, quote=F)
}

samp.ph <- read.table('phfull.samples', header=T)

#write samp files
chr.samp <- list()
for (i in 1:253)
{m = i + 1
chr.samp[[i]] <- rbind(samp.ph[1,],samp.ph[m,])
write.table(chr.samp[[i]], paste('phfull_samp',i,sep=''), sep='\t', 
col.names=T, row.names=F, quote=F)
}

samp.pt <- read.table('ptfull.samples', header=T)

#write samp files
chr.samp <- list()
for (i in 1:60)
{m = i + 1
chr.samp[[i]] <- rbind(samp.pt[1,],samp.pt[m,])
write.table(chr.samp[[i]], paste('ptfull_samp',i,sep=''), sep='\t', 
col.names=T, row.names=F, quote=F)
}

samp.pv <- read.table('pvfull.samples', header=T)

#write samp files
chr.samp <- list()
for (i in 1:131)
{m = i + 1
chr.samp[[i]] <- rbind(samp.pv[1,],samp.pv[m,])
write.table(chr.samp[[i]], paste('pvfull_samp',i,sep=''), sep='\t', 
col.names=T, row.names=F, quote=F)
}



