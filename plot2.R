library(readr)
power <- read_delim("Data/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

power$newDate <- as.Date(power$Date,format = "%d/%m/%Y")
power$newTime <- strptime(paste(power$newDate,power$Time),format = "%Y-%m-%d %H:%M:%S")
power2d <- subset(power,newDate=="2007-02-01" | newDate=="2007-02-02")

dev.new()

with(power2d,plot(newTime,Global_active_power,type="n", ylab = "Global Active Power (kilowatts)",xlab = ""))
with(power2d,lines(newTime,Global_active_power))

dev.copy(png, file="plot2.png")
dev.off()
