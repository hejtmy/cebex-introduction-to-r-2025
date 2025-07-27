library(dplyr)

df_salary <- read.csv("data/Salary_Data_Based_country_and_race.csv")
glimpse(df_salary)

df_salary <- select(df_salary, -X)
head(df_salary)

summary(df_salary)

# Freqeuncy-factors

table(df_salary$Gender)
table(df_salary$Education.Level)
table(df_salary$Job.Title)
table(df_salary$Gender, df_salary$Education.Level)

count(df_salary, Gender, Education.Level)


## Summarise

summarise(df_salary,
          mean_salary = mean(Salary, na.rm = TRUE),
          median_salary = median(Salary, na.rm = TRUE),
          mean_experience = mean(Years.of.Experience, na.rm = TRUE),
          median_experince = median(Years.of.Experience, na.rm = TRUE),
          mean_age = mean(Age, na.rm = TRUE))

## Group by
df_salary %>%
  group_by(Gender) %>% 
  summarise(mean_salary = mean(Salary, na.rm = TRUE),
            median_salary = median(Salary, na.rm = TRUE),
            mean_experience = mean(Years.of.Experience, na.rm = TRUE),
            median_experince = median(Years.of.Experience, na.rm = TRUE),
            mean_age = mean(Age, na.rm = TRUE))


df_salary %>%
  group_by(Education.Level) %>% 
  summarise(mean_salary = mean(Salary, na.rm = TRUE),
            median_salary = median(Salary, na.rm = TRUE),
            mean_experience = mean(Years.of.Experience, na.rm = TRUE),
            median_experince = median(Years.of.Experience, na.rm = TRUE),
            mean_age = mean(Age, na.rm = TRUE),
            n = n()) %>%
  arrange(mean_salary)

