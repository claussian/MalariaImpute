script.pa <- "library(rehh)

haps.pa <- data2haplohh('chrZZ_pa_impXX.rehh','markerZZ_rehh.txt',chr.name=ZZ)
scan <- scan_hh(haps.pa)

write.table(scan, 'iES_chrZZ_pa_impXX.txt', sep='\\t',col.names=T, row.names=F, quote=F)"

script.pd <- "library(rehh)

haps.pd <- data2haplohh('chrZZ_pd_impXX.rehh','markerZZ_rehh.txt',chr.name=ZZ)
scan <- scan_hh(haps.pd)

write.table(scan, 'iES_chrZZ_pd_impXX.txt', sep='\\t',col.names=T, row.names=F, quote=F)"

script.ph <- "library(rehh)

haps.ph <- data2haplohh('chrZZ_ph_impXX.rehh','markerZZ_rehh.txt',chr.name=ZZ)
scan <- scan_hh(haps.ph)

write.table(scan, 'iES_chrZZ_ph_impXX.txt', sep='\\t',col.names=T, row.names=F, quote=F)"


script.pt <- "library(rehh)

haps.pt <- data2haplohh('chrZZ_pt_impXX.rehh','markerZZ_rehh.txt',chr.name=ZZ)
scan <- scan_hh(haps.pt)

write.table(scan, 'iES_chrZZ_pt_impXX.txt', sep='\\t',col.names=T, row.names=F, quote=F)"


script.pv <- "library(rehh)

haps.pv <- data2haplohh('chrZZ_pv_impXX.rehh','markerZZ_rehh.txt',chr.name=ZZ)
scan <- scan_hh(haps.pv)

write.table(scan, 'iES_chrZZ_pv_impXX.txt', sep='\\t',col.names=T, row.names=F, quote=F)"


scriptlist.pa <- list()
scriptlist.pd <- list()
scriptlist.ph <- list()
scriptlist.pt <- list()
scriptlist.pv <- list()

for (i in 8:14)
{scriptlist.pa[[i]] <- gsub('ZZ', i, script.pa)
scriptlist.pd[[i]] <- gsub('ZZ', i, script.pd)
scriptlist.ph[[i]] <- gsub('ZZ', i, script.ph)
scriptlist.pt[[i]] <- gsub('ZZ', i, script.pt)
scriptlist.pv[[i]] <- gsub('ZZ', i, script.pv)
shell.pa <- list()
shell.pd <- list()
shell.ph <- list()
shell.pt <- list()
shell.pv <- list()

	for (j in 1:10)
	{shell.pa[[j]] <- gsub('XX', j, scriptlist.pa[[i]])
	shell.pd[[j]] <- gsub('XX', j, scriptlist.pd[[i]])
	shell.ph[[j]] <- gsub('XX', j, scriptlist.ph[[i]])
	shell.pt[[j]] <- gsub('XX', j, scriptlist.pt[[i]])
	shell.pv[[j]] <- gsub('XX', j, scriptlist.pv[[i]])
	write.table(shell.pa[[j]], paste('iES_chr',i,'_pa',j,'.R',sep=''),col.names=F, row.names=F, quote=F)
	write.table(shell.pd[[j]], paste('iES_chr',i,'_pd',j,'.R',sep=''),col.names=F, row.names=F, quote=F)
	write.table(shell.ph[[j]], paste('iES_chr',i,'_ph',j,'.R',sep=''),col.names=F, row.names=F, quote=F)
	write.table(shell.pt[[j]], paste('iES_chr',i,'_pt',j,'.R',sep=''),col.names=F, row.names=F, quote=F)
	write.table(shell.pv[[j]], paste('iES_chr',i,'_pv',j,'.R',sep=''),col.names=F, row.names=F, quote=F)
	}
}






