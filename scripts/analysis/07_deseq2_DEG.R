#This is run in R

library(DESeq2)
library(tximeta)
library(sva)
library(ggplot2)

coldata <- read.csv("samples_table.csv")
rownames(coldata) <- coldata$names

se <- tximeta(coldata)
gse <- summarizeToGene(se)
dds <- DESeqDataSet(gse, design = ~ litter + condition)

keep <- rowSums(counts(dds) >= 10) >= 2
dds <- dds[keep, ]

#PCA plot for exploration purposes
rld <- rlog(dds, blind = FALSE)
pcaData <- plotPCA(rld, intgroup = c("condition", "litter"), returnData = TRUE)
ggplot(pcaData, aes(PC1, PC2, color = condition, shape = litter)) +
  geom_point(size = 3)

dat <- counts(dds, normalized = TRUE)
mod <- model.matrix(~ litter + condition, colData(dds))
mod0 <- model.matrix(~ 1, colData(dds))

#SVA
svseq <- svaseq(dat, mod, mod0)
dds$SV1 <- svseq$sv[,1]
design(dds) <- ~ SV1 + litter + condition

dds <- DESeq(dds)
res <- results(dds, contrast = c("condition", "treated", "control"))
res <- res[order(res$padj), ]

write.csv(as.data.frame(res), "DEG_results.csv")
write.csv(counts(dds, normalized=TRUE), "normalized_counts.csv")
write.csv(assay(vst(dds)), "vst_matrix.csv")
