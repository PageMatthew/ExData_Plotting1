library(readr)
power <- read_delim("Data/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

power$newDate <- as.Date(power$Date,format = "%d/%m/%Y")
power$newTime <- strptime(paste(power$newDate,power$Time),format = "%Y-%m-%d %H:%M:%S")
power2d <- subset(power,newDate=="2007-02-01" | newDate=="2007-02-02")

dev.new()
par(mfcol=c(2,2))
#plot 1
with(power2d,plot(newTime,Global_active_power,type="n", ylab = "Global Active Power",xlab = ""))
with(power2d,lines(newTime,Global_active_power))

#plot 2
with(power2d,plot(newTime,Sub_metering_1,type="n", ylab = "Energy sub metering",xlab = ""))

with(power2d,lines(newTime,Sub_metering_1,col = "black"))
with(power2d,lines(newTime,Sub_metering_2,col = "red"))
with(power2d,lines(newTime,Sub_metering_3,col = "blue"))

legend(x="topright"
       , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , col = c("black","red","blue")
       , lty = c(1,1)
       , bty = "n")

#plot 3
with(power2d,plot(newTime,Voltage,type="n",xlab = "datetime"))
with(power2d,lines(newTime,Voltage))

#plot 4
with(power2d,plot(newTime,Global_reactive_power,type="n",xlab = "datetime"))
with(power2d,lines(newTime,Global_reactive_power))

dev.copy(png, file="plot4.png")
dev.off()