## Set workspace
setwd("~/Desktop/R notes/Course 4/Week 1/Assignment")
## Read in data
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
## Subset table to dates wanted
power_datewanted <- subset(power, Date %in% c("1/2/2007","2/2/2007"))

## Set Global Active Power column to numeric
power_datewanted$Global_active_power <- as.numeric(power_datewanted$Global_active_power)

## Plot histogram
png("plot1.png", width=480, height=480)
hist(power_datewanted$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()



