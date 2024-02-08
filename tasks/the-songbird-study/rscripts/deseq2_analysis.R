library(DESeq2)

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

count_matrix <- read.csv(input_file, header = TRUE, row.names = 1)

dds <- DESeqDataSetFromMatrix(countData = count_matrix, colData = NULL, design = ~ 1)

dds <- DESeq(dds)

results <- results(dds)

write.csv(results, file = output_file)
