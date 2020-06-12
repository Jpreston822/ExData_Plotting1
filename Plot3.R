## Set workspace
setwd("~/Desktop/R notes/Course 4/Week 1/Assignment")
## Read in data
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
## Subset table to dates wanted
power_datewanted <- subset(power, Date %in% c("1/2/2007","2/2/2007"))

## Make date and time combined column
DateTime <- strptime(paste(power_datewanted$Date, power_datewanted$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

##Add date and time combined column to table
power_datewanted <- cbind(power_datewanted,DateTime)

## Set sub metering columns to numeric
power_datewanted$Sub_metering_1<- as.numeric(power_datewanted$Sub_metering_1)
power_datewanted$Sub_metering_2<- as.numeric(power_datewanted$Sub_metering_2)
power_datewanted$Sub_metering_3<- as.numeric(power_datewanted$Sub_metering_3)

## Plot graph
png("plot3.png", width=480, height=480)
with(power_datewanted, plot(DateTime,Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(power_datewanted$DateTime, power_datewanted$Sub_metering_2, col = "red", type = "l")
lines(power_datewanted$DateTime, power_datewanted$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
