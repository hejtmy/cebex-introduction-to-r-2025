# 
num <- 5
length(num)

numbers <- c(1,2,3)

ages <- c(39,40,35,41,45)
gender <- c("male", "male", "female", "female", "other")

# Vector function
sum(ages)
mean(ages)
median(ages)
max
min()
sd(ages)
var(ages)
range(ages)

# Character functions
toupper(gender)
as.character(ages)

# ages
ages
ages[1]
ages[5]
ages[-1]

ages[c(1,2)]

# 
?seq
ids <- seq(from = 0, to = 500, by = 100)
seq_len(100)

# Cities
cities <- c("Prague", "Berlin", "Milan", 
            "Vienna", "Bratislava", "Paris",
            "Luxembourg")# put a vector of 7 cities
# sequence 7 values between 200k to 800k of inhabitants
population <- seq(200000, 800000, 100000)
population <- seq(by = 100000, from = 200000, to = 800000)
# vector of TRUE FALSE of length 7 
is_biking_friendly <- c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)

berlin_bike_friendly <- is_biking_friendly[2]

cities == "Berlin"
which(cities == "Berlin")

population > 500000
which(population > 500000)

i_berlin <- which(cities == "Berlin")
i_large_cities <- which(population > 500000)

# is berlin bike friendly
is_biking_friendly[i_berlin]
is_biking_friendly[i_large_cities]

cities == "Milan"

cities[cities == "Milan"]
cities[which(cities == "Milan")]
is_biking_friendly[cities == "Milan"]

# bike friendly cities
cities[is_biking_friendly]
