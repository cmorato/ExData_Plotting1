
## plot1.R
## author @ CM
#
# setwd("~/R/Exploratory Data Analysis/Project 1/")
# source("plot1.R")
#

## reading the data
data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## creating Plot 1 (labels for each axis)
hist(subdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving as a png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()