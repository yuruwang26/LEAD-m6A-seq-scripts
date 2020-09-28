ss <- c("R2","R3","R4")
Targets <- c("GAC-0","GAC-20","GAC-40","GAC-60","GAC-80","GAC-100","AAC-0","AAC-20","AAC-40","AAC-60","AAC-80","AAC-100")

for (t in Targets)
{
  bamFile <- paste0("~/SELECT_seq_01_24_19/fastq_files/12-03/Analysis/dedupe/trim_UMI/sorted-spike-in/sam_files/12-03_R1_merge.",t,".sorted.bam" )
  if( ! file.exists(paste0(bamFile,".bai")) ){ 
    
    indexBam(bamFile) 
    
  } 
  chr <- GRangesList(GRanges(seqnames = paste0("spike-in-",t), IRanges(start = 1, end = 3000)) )
  names(chr) <- paste0("spike-in-",t)
  reads <- scanBam( bamFile, param = ScanBamParam( which = chr, what = c("pos", "strand", "qwidth", "seq") )  ) 
  reads <- do.call(cbind.data.frame ,reads[[1]]  ) 
  reads <- reads[reads$qwidth > 12,] 
  table <- table(reads$qwidth) 
  table <- as.data.frame(table)
  colnames(table) <- c("length","R1")
  for (i in 1:3){
    bamFile <- paste0("~/SELECT_seq_01_24_19/fastq_files/12-03/Analysis/dedupe/trim_UMI/sorted-spike-in/sam_files/12-03_",ss[i],"_merge.",t,".sorted.bam" )
    if( ! file.exists(paste0(bamFile,".bai")) ){ 
           
               indexBam(bamFile) 
              
               } 
    chr <- GRangesList( GRanges(seqnames = paste0("spike-in-",t), IRanges(start = 1, end = 3000)) )
    names(chr) <- paste0("spike-in-",t)
    reads <- scanBam( bamFile, param = ScanBamParam( which = chr, what = c("pos", "strand", "qwidth", "seq") )  ) 
    reads <- do.call(cbind.data.frame ,reads[[1]]  ) 
    reads <- reads[reads$qwidth > 12,]
    table <- table(reads$qwidth)
    table1 <- as.data.frame(table)
    colnames(table1) <- c("length",ss[i])
    a <- merge(table,table1, by = c("length","length"),all.x =TRUE, all.y = TRUE)
   }
  write.csv(a, file=paste0("~/SELECT_seq_01_24_19/fastq_files/12-03/Analysis/dedupe/trim_UMI/sorted-spike-in/sam_files/tables/","spike-in-",t,".csv"))
}