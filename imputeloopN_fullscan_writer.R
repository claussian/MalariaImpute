script <- "#!/bin/bash

for i in {1..55}
do
	./impute2 \\
	-chrX \\
	-use_prephased_g \\
	-m mapimp_ldhat_chrZZ_pa \\
	-h chrZZ_pafull_cosmo_ref$i \\
	-l markerZZ_ref_imprun.txt \\
	-known_haps_g chrZZ_pafull_panel$i \\
	-sample_g pafull_samp$i \\
	-int cookie \\
	-Ne 30000 \\
	-k_hap 589 \\
	-o chrZZ_pafull_imp$i &
done

for i in {1..91}
do
	./impute2 \\
	-chrX \\
	-use_prephased_g \\
	-m mapimp_ldhat_chrZZ_pd \\
	-h chrZZ_pdfull_cosmo_ref$i \\
	-l markerZZ_ref_imprun.txt \\
	-known_haps_g chrZZ_pdfull_panel$i \\
	-sample_g pdfull_samp$i \\
	-int cookie \\
	-Ne 30000 \\
	-k_hap 589 \\
	-o chrZZ_pdfull_imp$i &
done

for i in {1..253}
do
	./impute2 \\
	-chrX \\
	-use_prephased_g \\
	-m mapimp_ldhat_chrZZ_ph \\
	-h chrZZ_phfull_cosmo_ref$i \\
	-l markerZZ_ref_imprun.txt \\
	-known_haps_g chrZZ_phfull_panel$i \\
	-sample_g phfull_samp$i \\
	-int cookie \\
	-Ne 30000 \\
	-k_hap 589 \\
	-o chrZZ_phfull_imp$i &
done

for i in {1..60}
do
	./impute2 \\
	-chrX \\
	-use_prephased_g \\
	-m mapimp_ldhat_chrZZ_pt \\
	-h chrZZ_ptfull_ref$i \\
	-l markerZZ_ref_imprun.txt \\
	-known_haps_g chrZZ_ptfull_panel$i \\
	-sample_g ptfull_samp$i \\
	-int cookie \\
	-Ne 30000 \\
	-k_hap 59 \\
	-o chrZZ_ptfull_imp$i &
done

for i in {1..131}
do
	./impute2 \\
	-chrX \\
	-use_prephased_g \\
	-m mapimp_ldhat_chrZZ_pv \\
	-h chrZZ_pvfull_cosmo_ref$i \\
	-l markerZZ_ref_imprun.txt \\
	-known_haps_g chrZZ_pvfull_panel$i \\
	-sample_g pvfull_samp$i \\
	-int cookie \\
	-Ne 30000 \\
	-k_hap 589 \\
	-o chrZZ_pvfull_imp$i &
done"

scriptlist <- list()
mlist <- list()
posname <- list()

for (i in 1:14)
{scriptlist[[i]] <- gsub('ZZ', i, script)
mlist[[i]] <- read.table(paste('marker',i,'_ref.txt',sep=''), header=T)
posname[[i]] <- paste(min(mlist[[i]][,2]),max(mlist[[i]][,2]),sep=' ')
scriptlist[[i]] <- gsub('cookie', posname[[i]],scriptlist[[i]])
write.table(scriptlist[[i]], paste('imputeloopN_chr',i,'.sh',sep=''),col.names=F, row.names=F, quote=F)
}

