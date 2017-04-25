library(tidyr)

# Opening a PNG Graphics Device
png(filename = "Plot4.png")

# Loading, subsetting and formating data
plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
plotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)
plotdata <- unite(plotdata, col = "Date.Time", Date:Time, sep = " ")
plotdata$Date.Time <- strptime(plotdata$Date.Time, format = "%d/%m/%Y %H:%M:%S")

# Plotting Plot4 using the base package
par(mfrow = c(2,2))
with(plotdata, {
  #Plot (1,1)
  plot(Date.Time, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(Date.Time, Global_active_power, type = "l")
  #Plot (1,2)
  plot(Date.Time, Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
  lines(Date.Time, Voltage, type = "l")
  #Plot (2,1)
  plot(plotdata$Date.Time, plotdata$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(Date.Time, Sub_metering_1, type = "l")
  lines(Date.Time, Sub_metering_2, type = "l", col = "red")
  lines(Date.Time, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lwd = c(1,1,1), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
  #Plot (2,2)
  plot(Date.Time, Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
  lines(Date.Time, Global_reactive_power, type = "l")
})

# Closing the graphics device
dev.off()
