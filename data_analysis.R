########################### Amgad Nady Barsom ############################

#read data and show the fifth samples 

my_data = read.csv('G3_sydney_hobart_times.csv', sep = ',')
head(my_data)

str(my_data)
summary(my_data)

##### year colunm ########
# Find missing values in Year
missing_values <- is.na(my_data$Year)
num_missing <- sum(missing_values)
result <- paste('the number of missing values in Year columns is ', num_missing)
print(result)

## get summary
summary(my_data$fleet_start)



##### Time colunm ########
# Find missing values in Time
missing_values <- is.na(my_data$Time)
num_missing <- sum(missing_values)
result <- paste('the number of missing values in Time columns is ', num_missing)
print(result)


# before replace the missing values in time we need to convert time to float 
# and remove day string in Time colunms

# Use gsub() to remove the last word from each string
my_data$Time <- gsub("\\s+\\w+$", "", my_data$Time)

# Use as.numeric() to convert the result to a float
my_data$Time <- as.numeric(my_data$Time)

# Print the result
print(my_data$Time)


# Define a default value to replace missing values
default_value <- "3.562"

# Use ifelse() and sub() to fill missing values
my_data$Time <- ifelse(is.na(my_data$Time), default_value, sub("NA", default_value, my_data$Time))

# Print the updated data frame
print(my_data$Time)

## get summary
summary(my_data$fleet_start)

##### fleet_start colunm ########
# Find missing values in fleet_start
missing_values <- is.na(my_data$fleet_start)
num_missing <- sum(missing_values)
result <- paste('the number of missing values in fleet_start columns is ', num_missing)
print(result)

## get summary
summary(my_data$fleet_start)



##### fleet_finish colunm ########
# Find missing values in fleet_finish
missing_values <- is.na(my_data$fleet_finish)
num_missing <- sum(missing_values)
result <- paste('the number of missing values in fleet_finish columns is ', num_missing)
print(result)

## get summary
summary(my_data$fleet_finish)

## code time less than 3 

# Create a new column with only the numbers smaller than 3
my_data$Code.Time.less.than.3 <- ifelse(my_data$Time < 3, my_data$Time, 0)

# Print the result
print(my_data$Code.Time.less.than.3)

########### add new column duration of fleet(fleet_start - fleet_finish)########

my_data$duration_of_fleet <- my_data$fleet_start  - my_data$fleet_finish
print(my_data$duration_of_fleet)


## Plot a graph between time and duration of fleet colunms

plot(my_data$Time, my_data$duration_of_fleet, type = "l",
     xlab = "Time", ylab = "duration_of_fleet", main = "Graph between Time and duration_of_fleet columns")


## Plot a graph between Year and duration of fleet colunms
plot(my_data$Year, my_data$duration_of_fleet, type = "l",
     xlab = "Year", ylab = "duration_of_fleet", main = "Graph between Year and duration_of_fleet columns")


