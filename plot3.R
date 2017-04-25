library(tidyr)

# Loading, subsetting and formating data
plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
plotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)
plotdata <- unite(plotdata, col = "Date.Time", Date:Time, sep = " ")
plotdata$Date.Time <- strptime(plotdata$Date.Time, format = "%d/%m/%Y %H:%M:%S")

# Plotting Plot3 using the base package
plot(plotdata$Date.Time, plotdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(plotdata, lines(Date.Time, Sub_metering_1, type = "l"))
with(plotdata, lines(Date.Time, Sub_metering_2, type = "l", col = "red"))
with(plotdata, lines(Date.Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lwd = c(1,1,1), lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
