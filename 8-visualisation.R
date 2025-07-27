library(dplyr)
library(ggplot2)

df_salary <- read.csv("data/Salary_Data_Based_country_and_race.csv")


# ggplot(data, aesthetics(x, y, color, fill)) +
#  visualisatios_geoms(histogram, boxplot, point, line, jitter, linear_regression) + 
#  visualisatios_geoms(histogram, boxplot, point, line, jitter, linear_regression) + 
#  labels ()

# 
ggplot(df_salary, aes(x = Years.of.Experience, y = Salary)) + 
  geom_point()


ggplot(df_salary, aes(x = as.factor(Years.of.Experience), y = Salary)) +
  geom_boxplot()

ggplot(df_salary, aes(x = Years.of.Experience, y = Salary, color = Gender)) + 
  geom_point() +
  geom_smooth()


ggplot(df_salary, aes(x = Years.of.Experience, y = Salary, color = Gender)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~Education.Level)

# Histograms
ggplot(df_salary, aes(x = Salary, color = Gender, fill = Gender)) +
  geom_histogram()


ggplot(df_salary, aes(x = Salary, color = Gender, fill = Gender)) +
  geom_histogram() +
  facet_wrap(~Gender)


df_salary %>% 
  filter(Gender %in% c("Male", "Female")) %>% 
  ggplot(aes(x = Salary, color = Gender, fill = Gender)) +
    geom_histogram() +
    facet_wrap(~Gender, scales = "free")


df_salary %>% 
  filter(Gender %in% c("Male", "Female")) %>%
  mutate(Salary = Salary/1000) %>% 
  ggplot(aes(x = Salary, color = Gender, fill = Gender)) +
    geom_histogram() +
    facet_wrap(~Gender)


# Boxplot 
df_salary %>% 
  filter(Gender %in% c("Male", "Female")) %>%
  ggplot(aes(x = Gender, y = Salary)) +
    geom_boxplot()

df_salary %>% 
  filter(Gender %in% c("Male", "Female")) %>%
  ggplot(aes(x = Gender, y = Years.of.Experience, fill = Gender)) +
  geom_boxplot()

## T-test
df_salary %>% 
  filter(Gender %in% c("Male", "Female")) %>% 
  t.test(Salary ~ Gender, data = .)

df_salary_two_genders <- df_salary %>% 
  filter(Gender %in% c("Male", "Female"))

t.test(Salary ~ Gender, data = df_salary_two_genders)
### Paired t.test
# Need to pass in data from round 1 and oround 2
round1 <- seq(0,20,1)
round2 <- seq(10,30,1)

t.test(round1, round2)

# Just an example,. we need to randomize the data to not have R crash on us

t.test(sample(round1), sample(round2), paired = TRUE)

## AOV
df_salary %>% 
  ggplot(aes(x = Education.Level, y = Salary)) +
  geom_boxplot()

df_salary %>%
  filter(Education.Level %in% c("Bachelor's Degree", "High School",
                                "Master's Degree", "PhD")) %>% 
  ggplot(aes(x = Education.Level, y = Salary)) +
  geom_boxplot()

df_salary_eucation_clear <- df_salary %>%
  filter(Education.Level %in% c("Bachelor's Degree", "High School",
                                "Master's Degree", "PhD"))

aov(Salary ~ Education.Level, data = df_salary_eucation_clear)
summary(aov(Salary ~ Education.Level, data = df_salary_eucation_clear))


TukeyHSD(aov(Salary ~ Education.Level, data = df_salary_eucation_clear))


# Linear regression
ggplot(df_salary_two_genders, aes(x = Years.of.Experience, y = Salary, color = Gender)) + 
  geom_point() +
  geom_smooth(method="lm")

lm(Salary ~ Years.of.Experience, data = df_salary_two_genders)
summary(lm(Salary ~ Years.of.Experience, data = df_salary_two_genders))

summary(lm(Salary ~ Years.of.Experience + Gender, data = df_salary_two_genders))
summary(lm(Salary ~ Years.of.Experience*Gender, data = df_salary_two_genders))

df_salary_two_genders %>% 
  mutate(Years.of.Experience2 = Years.of.Experience^2) %>% 
  glm(Salary ~ Years.of.Experience + Years.of.Experience2, data = .) %>% 
  summary()
