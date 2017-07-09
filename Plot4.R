rm(list=ls())

library(dplyr)
library(data.table)

householdpower <- "./data/householdpowerconsumption/household_power_consumption.txt"

housepower<-read.table(householdpower, sep=';', na.strings="?", header=TRUE)

housepower <- housepower[housepower$Date %in% c("1/2/2007","2/2/2007"),]

datetime <-strptime(paste(housepower$Date, housepower$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

housepower <- cbind(datetime, housepower)

png(filename='plot4.png', width=480, height=480, units='px')    

par(mfrow=c(2,2))

#plot2
plot(housepower$datetime, housepower$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", col="black")

#PlotA
plot(housepower$datetime, housepower$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")

#plot3
plot(housepower$datetime, housepower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(housepower$datetime, housepower$Sub_metering_2, col="red")
lines(housepower$datetime, housepower$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", col=c("black", "red", "blue"))

#plotB
plot(housepower$datetime, housepower$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

dev.off()

