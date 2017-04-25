library(tidyr)

# Loading, subsetting and formating data
plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
plotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)
plotdata <- unite(plotdata, col = "Date.Time", Date:Time, sep = " ")
plotdata$Date.Time <- strptime(plotdata$Date.Time, format = "%d/%m/%Y %H:%M:%S")

# Plotting Plot2 using the base package
plot(plotdata$Date.Time, plotdata$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
with(plotdata, lines(Date.Time, Global_active_power, type = "l"))

