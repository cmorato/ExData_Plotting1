## plot3.R
## author @ CM
#
# setwd("~/R/Exploratory Data Analysis/Project 1/")
# source("plot3.R")
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

## creating Plot 3 (labels for each axis)
with(subdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving as a png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()