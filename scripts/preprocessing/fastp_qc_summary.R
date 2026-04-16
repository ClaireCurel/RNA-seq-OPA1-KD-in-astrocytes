library(jsonlite)

# Load fastp reports (chose 2 examples, do this for all files)
fastp.C1F <- fromJSON("fastp/C1F_fastp.json")
fastp.T1F <- fromJSON("fastp/T1F_fastp.json")

# Extract summary
fastp.C1F.df <- as.data.frame(fastp.C1F$summary)
fastp.T1F.df <- as.data.frame(fastp.T1F$summary)

# Combine into one table
df <- data.frame(
  C1F = fastp.C1F.df[1, ],
  T1F = fastp.T1F.df[1, ]
)

# Inspect
print(df)

# Save output
write.csv(df, "fastp_summary.csv", row.names = TRUE)
