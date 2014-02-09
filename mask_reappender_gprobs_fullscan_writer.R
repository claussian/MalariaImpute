script <- "full <- read.table('Full.bgl_chr_paZZ.bgl.gprobs', header=T)
full <- full[,4:ncol(full)]

ind <- c(1:nrow(full))
repAA <- data.frame(row.names=ind)
repAB <- data.frame(row.names=ind)
doseA <- data.frame(row.names=ind)

for(i in 1:55)
{ j = i*3 -2
k = i*3 -1
repAA <- cbind(repAA,full[,j])
repAB <- cbind(repAB,full[,k])
hetprob <- full[,j] + 0.5*full[,k]
doseA <- cbind(doseA, hetprob)
}
write.table(doseA, 'Full.bgl_gprobs_chrZZ_pa', sep='\\t', col.names=F, row.names=F, quote=F)

full <- read.table('Full.bgl_chr_pdZZ.bgl.gprobs', header=T)
full <- full[,4:ncol(full)]

ind <- c(1:nrow(full))
repAA <- data.frame(row.names=ind)
repAB <- data.frame(row.names=ind)
doseA <- data.frame(row.names=ind)

for(i in 1:91)
{ j = i*3 -2
k = i*3 -1
repAA <- cbind(repAA,full[,j])
repAB <- cbind(repAB,full[,k])
hetprob <- full[,j] + 0.5*full[,k]
doseA <- cbind(doseA, hetprob)
}
write.table(doseA, 'Full.bgl_gprobs_chrZZ_pd', sep='\\t', col.names=F, row.names=F, quote=F)

full <- read.table('Full.bgl_chr_phZZ.bgl.gprobs', header=T)
full <- full[,4:ncol(full)]

ind <- c(1:nrow(full))
repAA <- data.frame(row.names=ind)
repAB <- data.frame(row.names=ind)
doseA <- data.frame(row.names=ind)

for(i in 1:253)
{ j = i*3 -2
k = i*3 -1
repAA <- cbind(repAA,full[,j])
repAB <- cbind(repAB,full[,k])
hetprob <- full[,j] + 0.5*full[,k]
doseA <- cbind(doseA, hetprob)
}
write.table(doseA, 'Full.bgl_gprobs_chrZZ_ph', sep='\\t', col.names=F, row.names=F, quote=F)

full <- read.table('Full.bgl_chr_ptZZ.bgl.gprobs', header=T)
full <- full[,4:ncol(full)]

ind <- c(1:nrow(full))
repAA <- data.frame(row.names=ind)
repAB <- data.frame(row.names=ind)
doseA <- data.frame(row.names=ind)

for(i in 1:60)
{ j = i*3 -2
k = i*3 -1
repAA <- cbind(repAA,full[,j])
repAB <- cbind(repAB,full[,k])
hetprob <- full[,j] + 0.5*full[,k]
doseA <- cbind(doseA, hetprob)
}
write.table(doseA, 'Full.bgl_gprobs_chrZZ_pt', sep='\\t', col.names=F, row.names=F, quote=F)

full <- read.table('Full.bgl_chr_pvZZ.bgl.gprobs', header=T)
full <- full[,4:ncol(full)]

ind <- c(1:nrow(full))
repAA <- data.frame(row.names=ind)
repAB <- data.frame(row.names=ind)
doseA <- data.frame(row.names=ind)

for(i in 1:131)
{ j = i*3 -2
k = i*3 -1
repAA <- cbind(repAA,full[,j])
repAB <- cbind(repAB,full[,k])
hetprob <- full[,j] + 0.5*full[,k]
doseA <- cbind(doseA, hetprob)
}
write.table(doseA, 'Full.bgl_gprobs_chrZZ_pv', sep='\\t', col.names=F, row.names=F, quote=F)"

scriptlist <- list()

for (i in 1:14)
{scriptlist[[i]] <- gsub('ZZ', i, script)
write.table(scriptlist[[i]], paste('mask_reappender_bgl_chr',i,'.R',sep=''),col.names=F, row.names=F, quote=F)
}
