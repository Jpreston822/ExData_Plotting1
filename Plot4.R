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

## Set Global Active Power column to numeric
power_datewanted$Global_active_power <- as.numeric(power_datewanted$Global_active_power)

## Set Global reactive power column to numeric
power_datewanted$Global_reactive_power <- as.numeric(power_datewanted$Global_reactive_power)

## Set Voltage column to numeric
power_datewanted$Voltage <- as.numeric(power_datewanted$Voltage)

##Plot Graphs
png("plot4.png", width=480, height=480)
## set up grid for 4 plots
par(mfrow = c(2,2))
##1st plot
with(power_datewanted, plot(DateTime,Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
##2nd plot
with(power_datewanted, plot(DateTime,Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
##3rd plot
with(power_datewanted, plot(DateTime,Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(power_datewanted$DateTime, power_datewanted$Sub_metering_2, col = "red", type = "l")
lines(power_datewanted$DateTime, power_datewanted$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##4th plot
with(power_datewanted, plot(DateTime,Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()







