# variable naming restrictions

# can only include numbers, letters (ASCII/English) 
# NO */-~/,

# have to start with a letter

day_1 <- 1
day_7 <- 7

# case sensitive

num <- 0
Num <- 1

monday <- 350
tuesday - 340
Wednesday <- 310

wednesday
# Numeric

num1 <- 5
class(num1)

num2 <- 5.5
class(num2)

outlier_value <- 10
my_value <- 12.5

points_above_outlier <- my_value - outlier_value
points_above_outlier

# round()
round(points_above_outlier)

# Character
name <- "Lukas"
class(name)

# round(name)
tolower(name)
toupper(name)

tolower(5)*5


# Type conversion 

## Implicit converstion
## happens automaticly to NOT CRASH
tolower(5)
is_smoking <- TRUE
is_smoking * 5
is_adult <- FALSE
is_adult * 5

## Explicit conversion

as.character(156)
as.character(1.467)
as.character(pi)

as.numeric("5.61")
as.numeric("fives")
as.numeric("5,3")

as.logical("five")
as.logical("True")
as.logical(-1)
as.logical(5)


# Logical
is_smoking <- TRUE
is_adult <- FALSE
class(is_smoking)

num_cigarettes <- 1

num_cigarettes > 0
num_cigarettes > 1
num_cigarettes >= 1
num_cigarettes < 1
num_cigarettes <= 1


num_cigarettes == 5

num_cigarettes > 0
!(num_cigarettes > 0)
is_smoking <- num_cigarettes > 0


# MISSING TYPES
## NA
age <- NA

## NULL
Num <- NULL

# Chekcing type
is.numeric()
is.character()
is.na(age)

# Complex types

## lists

settings_rounds <- 5
settings_participants <- 100
settings_payout <- 5
settings_max_payout<- 40

settings <- list(rounds = 5, participants = 100, payout = 5, max_payout = 40)

settings$max_payout
settings$rounds

settings$rounds <- 10
settings$min_payout <- 10

