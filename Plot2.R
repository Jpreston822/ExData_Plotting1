## Set workspace
setwd("~/Desktop/R notes/Course 4/Week 1/Assignment")
## Read in data
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
## Subset table to dates wanted
power_datewanted <- subset(power, Date %in% c("1/2/2007","2/2/2007"))

## Set Global Active Power column to numeric
power_datewanted$Global_active_power <- as.numeric(power_datewanted$Global_active_power)

## Make date and time combined column
DateTime <- strptime(paste(power_datewanted$Date, power_datewanted$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

##Add date and time combined column to table
power_datewanted <- cbind(power_datewanted,DateTime)

## Plot graph
png("plot2.png", width=480, height=480)
with(power_datewanted, plot(DateTime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()



