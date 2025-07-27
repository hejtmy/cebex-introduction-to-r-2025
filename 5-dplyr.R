library(dplyr)

df_mpg <- ggplot2::mpg
df_sleep <- ggplot2::msleep

# glimpse
head(df_sleep)
str(df_sleep)
glimpse(df_sleep)

# select
df_sleep[, c("name", "sleep_rem")]
select(df_sleep, name, sleep_rem)

select(df_sleep, -conservation, -genus, -order)
select(df_sleep, name:conservation)
select(df_sleep, !(name:conservation))
select(df_sleep, starts_with("sleep"))

df_sleep_analysis <- select(df_sleep, starts_with("sleep"), name:vore)

# filter
filter(df_sleep, vore == "carni")

filter(df_sleep, vore == "carni", sleep_total > 10)

filter(df_sleep, vore == "carni", sleep_total > 10, !is.na(brainwt))

## Task

# Filte omnivores who sleep less then 10 hours, and brainwt and bodywt are not missing
df_omni_sleep <- filter(df_sleep, vore == "omni", sleep_total < 10, 
                        !is.na(brainwt), !is.na(bodywt))
# Select only sleep columns and name and conservation of the animal
select(df_omni_sleep, starts_with("sleep"), name, conservation)

# mutate
df_sleep <- mutate(df_sleep, 
                   sleep_more_than_avg = sleep_total > mean(sleep_total),
                   large_brain = brainwt > mean(brainwt))

mean(df_sleep$brainwt, na.rm = TRUE)
df_sleep <- mutate(df_sleep, 
                   sleep_more_than_avg = sleep_total > mean(sleep_total),
                   large_brain = brainwt > mean(df_sleep$brainwt, na.rm = TRUE))

# Pipe
filter(df_sleep, vore == "carni") %>%
  select(name)

select(filter(df_sleep, vore == "carni"), name)

df_carni <- filter(df_sleep, vore == "carni")
df_carni <- mutate(df_carni, sleep_more_than_average = sleep_total > mean(sleep_total ))
df_carni <- filter(df_carni, sleep_more_than_average)
df_carni <- select(df_carni, name, sleep_total, sleep_rem)
df_carni

filter(df_sleep, vore == "carni") %>%
  mutate(sleep_more_than_average = sleep_total > mean(sleep_total )) %>%
  filter(sleep_more_than_average) %>% 
  select(name, sleep_total, sleep_rem)

# Arrange

filter(df_sleep, vore == "carni") %>%
  mutate(sleep_more_than_average = sleep_total > mean(sleep_total )) %>%
  filter(sleep_more_than_average) %>% 
  select(name, sleep_total, sleep_rem) %>%
  arrange(-sleep_total)

  