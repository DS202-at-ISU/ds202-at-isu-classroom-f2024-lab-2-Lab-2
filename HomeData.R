# Importing the package
library(classdata)

# Getting and viewing the data from the Ames Homes dataset
data(ames)
class(ames)
head(ames)
View(ames)

# Viewing Styles alone
options(max.print = 12)
style_levels<- levels(ames$Style)
print.simple.list(style_levels)

# Viewing Occupancy alone
occ_levels<- levels(ames$Occupancy)
print.simple.list(occ_levels)

# Viewing Neighborhood alone
options(max.print = 42)
Neighbor_levels<- levels(ames$Neighborhood)
print.simple.list(Neighbor_levels)

# Prints the range for the Sale price
print(range(ames$`Sale Price`))

# Makes a histogram for the sale price with 100 bins
hist(ames$`Sale Price`, breaks = 100)

# Histogram for sales broken into 6 parts (2017 and 2018 were right next to eachother so I raised bins to separate)
year <- format(ames$`Sale Date`, "%Y")
print(year[1:2])
year_num <- as.numeric(year)
print(year_num)
hist(year_num, breaks = 18)


# This filters the house data to only show houses overtime between 100,000 and 1,000,000 sale price and prints a scatterplot
library(ggplot2)
library(dplyr)

ames$`Sale Price` <- as.numeric(ames$`Sale Price`)

filtered_houses <- filter(ames, !is.na(ames$`Sale Price`) & !is.na(ames$YearBuilt) & `Sale Price` >= 100000 & `Sale Price` <= 1000000)

View(filtered_houses)

ggplot(filtered_houses, aes(x = `YearBuilt`, y = `Sale Price`)) + geom_point()



# Sale price per year using the same filtering for outliers that Grant used

ggplot(filtered_houses, aes(x = `Sale Date`, y = `Sale Price`)) + geom_point()
