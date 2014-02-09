samples <- read.table('5pop_590.samples', header=F)
for (i in 1:14)
{chr <- read.table(paste('5pop_chr',i,'.calls',sep=''), header=F)
chr.info <- read.table(paste('5pop_chr',i,'.info',sep=''), header=T)
marker <- read.table(paste('marker',i,'_ref.txt',sep=''), header=T)
colnames(chr) <- as.character(t(samples))
snpid <- chr.info[,1]

chr.pa <- chr[,405:459]
chr.pd <- chr[,1:91]
chr.ph <- chr[,92:344]
chr.pt <- chr[,345:404]
chr.pv <- chr[,460:590]

chr_m <- cbind('id'=snpid,chr.pa)
chr_m <- cbind('I'=rep('M',nrow(chr.pa)), chr_m)
write.table(chr_m, file = paste('bgl_chr_pa',i,sep=''), 
sep='\t', quote =F, col.names=T, row.names=F)

chr_m <- cbind('id'=snpid,chr.pd)
chr_m <- cbind('I'=rep('M',nrow(chr.pd)), chr_m)
write.table(chr_m, file = paste('bgl_chr_pd',i,sep=''), 
sep='\t', quote =F, col.names=T, row.names=F)

chr_m <- cbind('id'=snpid,chr.ph)
chr_m <- cbind('I'=rep('M',nrow(chr.ph)), chr_m)
write.table(chr_m, file = paste('bgl_chr_ph',i,sep=''), 
sep='\t', quote =F, col.names=T, row.names=F)

chr_m <- cbind('id'=snpid,chr.pt)
chr_m <- cbind('I'=rep('M',nrow(chr.pt)), chr_m)
write.table(chr_m, file = paste('bgl_chr_pt',i,sep=''), 
sep='\t', quote =F, col.names=T, row.names=F)

chr_m <- cbind('id'=snpid,chr.pv)
chr_m <- cbind('I'=rep('M',nrow(chr.pv)), chr_m)
write.table(chr_m, file = paste('bgl_chr_pv',i,sep=''), 
sep='\t', quote =F, col.names=T, row.names=F)

write.table(marker, file = paste('marker',i,'_ref',sep=''), 
sep='\t', quote =F, col.names=F, row.names=F)
}