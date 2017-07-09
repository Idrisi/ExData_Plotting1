rm(list=ls())

library(dplyr)
library(data.table)

householdpower <- "./data/householdpowerconsumption/household_power_consumption.txt"

housepower<-read.table(householdpower, sep=';', na.strings="?", header=TRUE)

housepower <- housepower[housepower$Date %in% c("1/2/2007","2/2/2007"),]

datetime <-strptime(paste(housepower$Date, housepower$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

housepower <- cbind(datetime, housepower)

png(filename='plot2.png', width=480, height=480, units='px')    

plot(housepower$datetime, housepower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", col="black")
dev.off()