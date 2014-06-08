powerdata <- read.table("./data/household_power_consumption.txt" , sep = ";", header = TRUE)
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
powerdata$Time <- strptime(paste(as.character(powerdata$Date), powerdata$Time), format = "%Y-%m-%d  %H:%M", tz = "")
