library(tidyr)

# Opening a PNG Graphics Device
png(filename = "Plot1.png")

# Loading, subsetting and formating data
plotdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
plotdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)
plotdata <- unite(plotdata, col = "Date.Time", Date:Time, sep = " ")
plotdata$Date.Time <- strptime(plotdata$Date.Time, format = "%d/%m/%Y %H:%M:%S")

# Plotting Plot1 using the base package
hist(plotdata$Global_active_power, main = "Global Active Power", xlab = "Global active power (kilowatts)", col = "red")

# Closing the graphics device
dev.off()
