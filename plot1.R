library(readr)
power <- read_delim("Data/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

power$Date <- as.Date(power$Date,format = "%d/%m/%Y")
power2d <- subset(power,Date=="2007-02-01" | Date=="2007-02-02")

dev.new(width=5,height=4, noRStudioGD = TRUE)
hist(power2d$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()