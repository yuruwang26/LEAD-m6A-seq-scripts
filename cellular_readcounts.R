library(ggplot2)
library(ggpubr)
library(RADAR)

MALAT1_site_2515 <- data.frame("chromosome"=c("chr11"), "loc"=c(65500276.0))
MALAT1_site_2577 <- data.frame("chromosome"=c("chr11"), "loc"=c(65500338.0))
MALAT1_site_2720 <- data.frame("chromosome"=c("chr11"), "loc"=c(65500481.0))
ACTB <- data.frame("chromosome"=c("chr7"), "loc"=c(5527743.0))
BSG <- data.frame("chromosome"=c("chr19"), "loc"=c(583239.0)) 
RGS2 <- data.frame("chromosome"=c("chr1"), "loc"=c(192811673.0))
YTHDF2 <- data.frame("chromosome"=c("chr1"), "loc"=c(28743593.0))
ACTG_site_2 <- data.frame("chromosome"=c("chr17"), "loc"=c(81511529.0))
MALAT1_site_N <- data.frame("chromosome"=c("chr11"), "loc"=c(65500145.0))
ACTG_site_1 <- data.frame("chromosome"=c("chr17"), "loc"=c(81512323.0))
PARP1_N <- data.frame("chromosome"=c("chr1"), "loc"=c(226361173.0))

ss <- c("S2","S3","S4","S5","S6","S7","S8","S9","S10","S11","S12","S13","S14","S15", "S16","S17")
Targets <- list(MALAT1_site_2515, MALAT1_site_2577, MALAT1_site_2720, ACTB, BSG, RGS2, YTHDF2, ACTG_site_2, MALAT1_site_N, ACTG_site_1, PARP1_N)
for (t in Targets)
{
    bamFile <- paste0("~/SELECT_seq_01_2020/01_2020/FastQ/Analysis/dedupe/trim/hg38_sam_files/CHe-YW-Nov25-19_S1_R2_001.sorted.bam" )
    if( ! file.exists(paste0(bamFile,".bai")) )
    { indexBam(bamFile) } 
    chr <- GRangesList(GRanges(seqnames = t$chromosome, IRanges(start = t$loc -10, end = t$loc + 10)) )
    names(chr) = t$chromosome
    reads <- scanBam( bamFile, param = ScanBamParam( which = chr, what = c("pos", "strand", "qwidth", "seq") )  ) 
    reads <- do.call(cbind.data.frame ,reads[[1]]  ) 
    reads <- reads[reads$qwidth > 12,] 
    if (reads$strand == "+") {
    table <- table(reads$pos)
    } else
    {
    table <- table(reads$pos + reads$qwidth -1) 
    }
    table <- as.data.frame(table)
    colnames(table) <- c("pos","S1")
    plot1 <- ggplot(table, aes(x=pos, y=S1)) + geom_bar(stat= "identity")+theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(), axis.line = element_line(colour = "black",size = 1),
                axis.title.x=element_text(size=20, face="bold", hjust=0.5,family = "arial"),
                axis.title.y=element_text(size=20, face="bold", vjust=0.4, angle=90,family = "arial"),
                legend.title=element_blank(),legend.text = element_text(size = 14, face = "bold",family = "arial"),
                axis.text = element_text(size = 15,face = "bold",family = "arial",colour = "black")  )
        
     ggsave(file=paste0("S1_",t$chromosome, "_", t$loc, ".png"), plot=plot1, device=png(),
               path="~/SELECT_seq_01_2020/01_2020/FastQ/Analysis/dedupe/trim/hg38_sam_files/images/", dpi=300, dev.off())
    for (s in ss)
    {
       bamFile <- paste0("~/SELECT_seq_01_2020/01_2020/FastQ/Analysis/dedupe/trim/hg38_sam_files/", "CHe-YW-Nov25-19_", s, "_R2_001.sorted.bam" )
       if( ! file.exists(paste0(bamFile,".bai")) )
       { indexBam(bamFile) } 
       chr <- GRangesList(GRanges(seqnames = t$chromosome, IRanges(start = t$loc -10, end = t$loc + 10)) )
       names(chr) = t$chromosome
       reads <- scanBam( bamFile, param = ScanBamParam( which = chr, what = c("pos", "strand", "qwidth", "seq") )  ) 
       reads <- do.call(cbind.data.frame ,reads[[1]]  ) 
       reads <- reads[reads$qwidth > 12,] 
       if (reads$strand == "+") { 
       table_1 <- table(reads$pos)
       } else
       {table_1 <- table(reads$pos + reads$qwidth -1) 
       }
       table_1 <- as.data.frame(table_1)
       colnames(table_1) <- c("pos",s)
       plot1 <- ggplot(table_1, aes(x=pos, y=s)) + geom_bar(stat= "identity")+theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(), axis.line = element_line(colour = "black",size = 1),
                axis.title.x=element_text(size=20, face="bold", hjust=0.5,family = "arial"),
                axis.title.y=element_text(size=20, face="bold", vjust=0.4, angle=90,family = "arial"),
                legend.title=element_blank(),legend.text = element_text(size = 14, face = "bold",family = "arial"),
                axis.text = element_text(size = 15,face = "bold",family = "arial",colour = "black")  )
        
       ggsave(file=paste0(s,"_", t$chromosome, "_", t$loc, ".png"), plot=plot1, device=png(),
               path="~/SELECT_seq_01_2020/01_2020/FastQ/Analysis/dedupe/trim/hg38_sam_files/images/", dpi=300, dev.off())
       table <- merge(table,table_1, by = c("pos","pos"),all.x =TRUE, all.y = TRUE)
    }
    write.csv(table, file=paste0("~/SELECT_seq_01_2020/01_2020/FastQ/Analysis/dedupe/trim/hg38_sam_files/tables/",t$chromosome, "_", t$loc, ".csv"))
}





