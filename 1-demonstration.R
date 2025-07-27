# hello, this is a text file
name <- "lukas"

numbers <- c(1,2,3,5,10,8)
sum(numbers)
mean(numbers)

numbers <- 5 

# install.packages("dplyr")
# install.packages("ggplot2")

library(ggplot2)
library(dplyr)

df_mpg <- ggplot2::mpg
#View(df_mpg)

head(df_mpg)
str(df_mpg)

summary(df_mpg)

# Basic plotting
hist(df_mpg$displ)

# ggplot2
ggplot(df_mpg, aes(x=displ)) +
  geom_histogram()

ggplot(df_mpg, aes(x=manufacturer, y=cty)) +
  geom_boxplot()

# statistics
aov(cty ~ manufacturer, df_mpg)
summary(aov(cty ~ manufacturer, df_mpg))

summary(aov(cty ~ manufacturer + year, df_mpg))
cor.test(df_mpg$displ, df_mpg$cyl)

