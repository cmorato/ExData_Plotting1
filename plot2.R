## plot2.R
## author @ CM
#
# setwd("~/R/Exploratory Data Analysis/Project 1/")
# source("plot2.R")
#

## Reading the data
data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## creating Plot 2 (labels for each axis)
plot(subdata$Global_active_power~subdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving as a png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()