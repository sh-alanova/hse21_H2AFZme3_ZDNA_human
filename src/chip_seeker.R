###

if (!requireNamespace("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
 BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene", force=TRUE)
 #BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")

BiocManager::install("ChIPseeker", force=TRUE)
library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
#library(TxDb.Mmusculus.UCSC.mm10.knownGene)
install.packages("stringi")
BiocManager::install("clusterProfiler", force=TRUE)
library(clusterProfiler)

###

#NAME <- 'H3K36me3_H1.intersect_w_DeepZ'
#NAME <- 'DeepZ'
#NAME <- 'H3K36me3_H1.ENCFF295UVV.hg19.filtered'
#NAME <- 'H3K36me3_H1.ENCFF327EZJ.hg19.filtered'




getwd()
#setwd()
DATA_DIR <- getwd()
BED_FN <- paste0(getwd(), '/',NAME, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
peak <- readPeakFile(BED_FN)
#install.packages("org.Hs.eg.db")
#BiocManager::install("org.Hs.eg.db", force=TRUE)
#library("org.Hs.eg.db")
peakAnno <- annotatePeak(peak, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
OUT_DIR <- getwd()
png(paste0(OUT_DIR, '/chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

# peak <- readPeakFile(BED_FN)
#png(paste0(OUT_DIR, '/chip_seeker.', NAME, '.covplot.png'))
#covplot(peak, weightCol="V5")
#dev.off()
# 