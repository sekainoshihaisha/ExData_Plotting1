Sys.setlocale("LC_ALL", "English")
fileDirectory <- dirname(rstudioapi::getSourceEditorContext()$path)
epc <- read.table(paste(fileDirectory, "/household_power_consumption.txt", sep = ""), skip = 1, sep = ";")
names(epc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

usedData <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = paste(fileDirectory, "/plot3.png", sep = ""), width = 480, height = 480)
plot(strptime(paste(usedData$Date, usedData$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), as.numeric(usedData$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(strptime(paste(usedData$Date, usedData$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), as.numeric(usedData$Sub_metering_2), col = "red")
lines(strptime(paste(usedData$Date, usedData$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), as.numeric(usedData$Sub_metering_3), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col= c("black", "red", "blue"))
dev.off()
