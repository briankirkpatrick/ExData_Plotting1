powerdata <- read.table("./data/household_power_consumption.txt", 
                        sep = ";", header = TRUE, na.strings = "?", 
                        colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
powerdata$Time <- strptime(paste(as.character(powerdata$Date), powerdata$Time), format = "%Y-%m-%d  %H:%M", tz = "")

subdata <- powerdata[powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02", ]
rownames(subdata) <- NULL

png(file = "plot3.png", width = 480, height = 480)

submeter1 <- subdata[ , c(2, 7)]
names(submeter1) <- c("Time", "Measurement")
submeter2 <- subdata[ , c(2, 8)]
names(submeter2) <- c("Time", "Measurement")
submeter3 <- subdata[ , c(2, 9)]
names(submeter3) <- c("Time", "Measurement")
submeterbind <- rbind(submeter1, submeter2, submeter3)

sublevels <- gl(3, 2880, labels = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(submeterbind$Time, submeterbind$Measurement,
     xlab = "", ylab = "Energy sub metering", type = "n")
lines(submeterbind$Time[sublevels == "Sub_metering_1"], submeterbind$Measurement[sublevels == "Sub_metering_1"], lwd = 1.5)
lines(submeterbind$Time[sublevels == "Sub_metering_2"], submeterbind$Measurement[sublevels == "Sub_metering_2"], lwd = 1.5, col = "red")
lines(submeterbind$Time[sublevels == "Sub_metering_3"], submeterbind$Measurement[sublevels == "Sub_metering_3"], lwd = 1.5, col = "blue")
legend("topright", pch = "-" , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()