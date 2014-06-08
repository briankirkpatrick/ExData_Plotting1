powerdata <- read.table("./data/household_power_consumption.txt", 
                        sep = ";", header = TRUE, na.strings = "?", 
                        colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
powerdata$Time <- strptime(paste(as.character(powerdata$Date), powerdata$Time), format = "%Y-%m-%d  %H:%M", tz = "")

subdata <- powerdata[powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02", ]

png(file = "plot1.png", width = 480, height = 480)

hist(subdata$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")

dev.off()