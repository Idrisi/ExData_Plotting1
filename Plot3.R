rm(list=ls())

library(dplyr)
library(data.table)

householdpower <- "./data/householdpowerconsumption/household_power_consumption.txt"

housepower<-read.table(householdpower, sep=';', na.strings="?", header=TRUE)

housepower <- housepower[housepower$Date %in% c("1/2/2007","2/2/2007"),]

datetime <-strptime(paste(housepower$Date, housepower$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

housepower <- cbind(datetime, housepower)

png(filename='plot3.png', width=480, height=480, units='px')    

plot(housepower$datetime, housepower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")

lines(housepower$datetime, housepower$Sub_metering_2, col="red")

lines(housepower$datetime, housepower$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", col=c("black", "red", "blue"))

dev.off()

