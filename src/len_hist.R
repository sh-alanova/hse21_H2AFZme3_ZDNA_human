#source('lib.R')
library(ggplot2)
library(dplyr)


###

#NAME <- '/H3K36me3_H1.intersect_w_DeepZ'
#NAME <- '/DeepZ'
#NAME <- '/H3K36me3_H1.ENCFF295UVV.hg19'
#NAME <- '/H3K36me3_H1.ENCFF327EZJ.hg19'




getwd()

###
setwd("C:/Users/Ilya_Pakhalko/Documents/BioProject")
bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
#colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)