#Load libraries and data
library("dplyr")
library("plyr")

df <- read.csv("titanic_original.csv", header = T, sep = ",")

#Replace missing value in embarked column
df$embarked[df$embarked == ""] <- "S"

#Replace missing age values with mean
df$age[is.na(df$age)] <- mean(df$age, na.rm = TRUE)

#Fill in missing life boat values with NA
df$boat[df$boat == ""] <- NA

#Add has_cabin_number variable
no_cabin_number <- df$cabin == ""
df$cabin[no_cabin_number] <- NA
has_cabin_number <- as.numeric(!is.na(df$cabin))
df$has_cabin_number <- has_cabin_number

#Write csv
write.csv(df, file = "titanic_clean.csv")