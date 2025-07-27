df_iris <- iris

df_iris[1]

# df_iris[ROWS, COLUMNS]
class(df_iris[1])
class(df_iris[,1])

df_iris[1,]
df_iris[c(1,2),]

df_iris[seq(1,40),]
df_iris[seq(1,40),2]
df_iris[seq(1,40),c(1,2)]

df_iris[seq(1,20),"Sepal.Length"]
df_iris[seq(1,20),c("Sepal.Length", "Species")]

# Colum selection
df_mpg <- ggplot2::mpg
df_mpg$cyl
df_mpg[["cty"]]

# List functions
# what is the max number of cylinders in the df_mpg
df_mpg$cyl
max(df_mpg$cyl)

# what is the SD - hwy miles per gallon
sd(df_mpg$hwy)
  
# Traditional subsetting
mean_hwy <- mean(df_mpg$hwy)
sd_hwy <- sd(df_mpg$hwy)
bottom_hwy <- mean_hwy - 1.5*sd_hwy
df_mpg$hwy < bottom_hwy

# data.frame[ROWS, COLUMNS]
# list rows (cars) which have 1.5SD down from the mean i hwy 
df_mpg[df_mpg$hwy < bottom_hwy, ]

# list rows (cars) which have 1.5SD up from the mean i cty
mean_cty <- mean(df_mpg$cty)
sd_cty <- sd(df_mpg$cty)
top_cty <- mean_cty + 1.5*sd_cty
df_mpg[df_mpg$cty > top_cty, ]

df_best_citycars <- df_mpg[df_mpg$cty > (mean(df_mpg$cty) + 1.5*sd_cty), ]

# Create a new colums

df_mpg$one <- 1
# (VALUE - Mean(VALUE))/SD(VALUE)
df_mpg$z_score_cty <- (df_mpg$cty - mean_cty)/sd_cty
df_mpg$z_score_cty <- (df_mpg$cty - mean(df_mpg$cty))/sd(df_mpg$cty)

# convert cty to c_lkm
# 0.425143707
df_mpg$c_lkm <- df_mpg$cty * 0.425143707
