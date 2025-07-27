# 
library(dplyr)
read.csv()

?read.csv
help(read.csv)

?mean
mean()
read.csv()

read.csv("data/loading-examples/example-sep.txt")

df_example <- read.csv("data/loading-examples/example-sep.txt")
head(df_example)
?read.table

df_example <- read.csv("data/loading-examples/example-sep.txt", 
                       header = FALSE)

df_example <- read.csv("data/loading-examples/example-row.txt", 
                       header = TRUE, sep = ";")

read.csv("data/loading-examples/test-spaces.txt", sep="")

df_example <- read.csv("data/loading-examples/example-missing.txt")
df_example <- read.csv("data/loading-examples/example-missing.txt",
                       na.strings = c("missing"))

df_example <- mutate(df_example, height = as.numeric(height))
class(df_example)
summary(df_example)

## Excel sheets
# install.packages("readxl")
library(readxl)
df_xls <- read_excel("data/loading-examples/data.xlsx")
df_xls
class(df_xls)
## Saving
write.csv(df_example, "example-missing_edited.csv")

df_shared_examples <- select(df_example, id, gender, salary)
write.csv(df_shared_examples, "example-missing_shared.csv")
